# 登录逻辑学习指南（auth 全景）

> 这份文档带你**读懂本项目从「点登录按钮」到「进入首页 / 被踢回登录页」的完整登录逻辑**。按「先建全局图 → 分层读文件 → 再把每条流程串一遍」的顺序学。
>
> 前置：网络底座（Dio / 拦截器 / 信封 / 两层错误）见 `agent/study/network-layer-guide.md`，本文不重复，只讲 auth 特有的部分。接口契约见 `agent/auth/auth_api.md`（v1 基础接口，v2 令牌策略）。

---

## 0. 先记住三句话

1. **令牌分家（v2 核心）**：`accessToken` **只存内存**（冷启动即丢），`refreshToken` + 用户快照**存安全存储**（持久）。启动时用 refreshToken 静默换回 accessToken，恢复登录态。
2. **登录态是全局唯一真相**：`authControllerProvider` 持有 `AuthState`（未定 / 已登录 / 未登录），**路由守卫**据它决定去哪个页面。页面自己**不手动导航**登录成功后的跳转。
3. **core 不认识 feature**：拦截器（core）发现会话失效时，不能直接调业务层，只能**广播事件**，由 `AuthController`（feature）订阅后翻转登录态。

---

## 1. 全局数据流图

```
                    ┌─────────────────────────────────────────────┐
                    │        authControllerProvider (AuthState)     │  ← 全局登录态
                    │   unknown / authenticated(User) / unauthed    │
                    └───────────────┬───────────────────┬───────────┘
                       写入↑ (login/logout/         订阅↓ (refreshListenable)
                            build/会话失效)                │
   ┌────────────┐   调用   ┌──────────────┐            ┌──────────────┐
   │ Login/Reg  │─────────▶│ AuthController│            │  路由守卫     │
   │  Screen    │          │ (controllers) │            │ guardRedirect │
   └────────────┘          └──────┬───────┘            └──────┬───────┘
        ↑本地 loading/报错          │调用                        │决定跳转
                                   ▼                            ▼
                          ┌──────────────┐            splash / login / home
                          │ AuthRepository│  DTO→Entity, AppException→Failure
                          └──────┬───────┘
                                 ▼
                          ┌──────────────────┐
                          │AuthRemoteDataSource│  4 个端点，返回原始 Map
                          └──────┬───────────┘
                                 ▼ DioClient → Dio(拦截器链) → 后端
```

**token 在这套流里怎么流动（务必记住）：**

```
登录成功 → accessToken 写 AccessTokenStore(内存) + refreshToken/user 写 SecureStorage(磁盘)
每次请求 → AuthInterceptor 从「内存」取 accessToken 拼 Authorization 头 + 带 X-Client-Type: app
请求 401 → AuthInterceptor 用「磁盘」refreshToken 静默换新 accessToken → 写回内存 → 重放原请求
换不回来 → 清会话 + 广播 onUnauthorized → AuthController 置未登录 → 守卫踢回 login
冷启动   → AuthController.build 用「磁盘」refreshToken 换 accessToken + 读回 user → 恢复已登录
```

---

## 2. 领域层 domain（登录逻辑的「名词表」，不依赖任何人）

`lib/features/auth/domain/`，全是 Freezed 不可变实体，只定义「概念」，不含逻辑。

| 文件 | 是什么 | 重点 |
| --- | --- | --- |
| `user.dart` | `User{username, email}` | 纯领域实体，UI 展示用的最小用户信息。 |
| `auth_tokens.dart` | `AuthTokens{accessToken, refreshToken?}` | 令牌对。`refreshToken` 可空——因为 refresh 接口只回新的 access，不回 refresh。 |
| `auth_session.dart` | `AuthSession{user, tokens}` | 一次成功登录的完整结果（用户 + 令牌）。Repository 返给 controller。 |
| `auth_state.dart` | `sealed AuthState`：`unknown` / `authenticated(User)` / `unauthenticated` | **登录态状态机**，全局唯一真相。`sealed` 便于 `switch` 穷尽。 |

> **为什么 `AuthState` 要有 `unknown`？** 冷启动时静默刷新还没跑完，登录态「未定」——此时**不能**当未登录直接踢到 login（会闪一下），也不能当已登录。守卫见 `unknown` 就停在 splash 等结果。

---

## 3. 数据层 data（跟后端打交道）

`lib/features/auth/data/`。分工严格：**DataSource 只发请求拿原始数据，Repository 负责翻译（DTO→Entity）和错误收敛（AppException→Failure）**。

### 3.1 DTO（`data/dto/`）——贴合接口字段

| 文件 | 对应接口 | 重点 |
| --- | --- | --- |
| `register_request_dto.dart` | `POST /auth/register` 入参 | `{username, email, password}` |
| `register_response_dto.dart` | 注册返回 | 后端用 `userName`（大写 N！），这里保留原字段名，在 `toEntity()` 里映射成领域的 `username`——**故意不用 `@JsonKey`**，避免 freezed 的 `invalid_annotation_target` 告警。 |
| `login_request_dto.dart` | `POST /auth/login` 入参 | `{identifier, password}`，`identifier` 可为用户名或邮箱。 |
| `login_response_dto.dart` | 登录返回 | `{accessToken, refreshToken, user}`，`toEntity()` → `AuthSession`。 |
| `refresh_token_request_dto.dart` | `POST /auth/refresh-token` 入参 | `{refreshToken}`（app 端直接传 body，不走 cookie）。 |
| `refresh_token_response_dto.dart` | 刷新返回 | 只有 `{accessToken}`。 |
| `user_dto.dart` | 登录返回里内嵌的用户 | 字段 `username`（注意和注册的 `userName` 不一致，各自映射）。 |

> **DTO vs Entity 为什么要分？** DTO 贴合后端字段（可能乱、可能改名），Entity 是干净的领域概念。后端字段变了只改 DTO 的映射，领域层和 UI 不受影响。注册/登录返回的用户字段名不一致（`userName` vs `username`）就是活例子——两个 DTO 各自消化，领域层只有一个干净的 `User`。

### 3.2 `auth_remote_data_source.dart`——4 个端点

- 只做 `_client.post(...)`，返回**信封解包后的原始 `Map`**（拦截器已把信封 `data` 解出来了）。
- 不做任何领域映射、不 catch 异常。一个方法对一个端点：`register / login / refreshToken / logout`。

### 3.3 `auth_repository.dart`——翻译层

- 每个方法：调 DataSource → `XxxDto.fromJson(map).toEntity()` → 返回领域对象。
- 统一用私有 `_guard()` 包一层：`catch (AppException)` → `e.toFailure()` 重抛。**于是 controller 只会拿到 `Failure`，不会看到技术异常。**

```dart
Future<T> _guard<T>(Future<T> Function() run) async {
  try { return await run(); }
  on AppException catch (e) { throw e.toFailure(); }  // 技术异常→UI失败
}
```

---

## 4. 控制层 controllers（登录逻辑的「大脑」）⭐ 最需要吃透

`lib/features/auth/controllers/auth_controller.dart`，两个手写 Provider：

- `authRepositoryProvider` — 组装 Repository（依赖全局 `dioClientProvider`）。
- `authControllerProvider` — `AsyncNotifier<AuthState>`，全局登录态。

### 4.1 状态约定（关键设计）

- `AsyncLoading`：**只在冷启动 `build()` 期间**出现 = 登录态未定 → 守卫停 splash。
- `AsyncData(AuthState)`：已定态，驱动守卫重定向。
- **登录 / 登出故意不把 provider 置 `AsyncLoading`**：否则守卫会误以为「未定」而闪 splash。所以：
  - 按钮的 loading 由**页面本地** `_isSubmitting` 承载；
  - 登录**失败**以**异常上抛**，页面本地 catch 弹提示，不污染全局态。

### 4.2 四个方法逐个看

| 方法 | 干什么 | 令牌怎么处理 |
| --- | --- | --- |
| `build()` | **冷启动恢复登录态**：读磁盘 refreshToken → 有就静默换 accessToken → 读回 user → `authenticated`；无 / 失败 → 清会话 → `unauthenticated`。 | 换来的 accessToken 写**内存**。 |
| `login()` | 调 repo 登录成功后置 `authenticated`。失败抛 `Failure`。 | accessToken 写**内存**，refreshToken + user 快照写**磁盘**。 |
| `register()` | 调 repo 注册。**不改登录态**（后端不发令牌），返回 `User` 给页面。 | 不碰令牌。 |
| `logout()` | 尽力调后端登出（失败也不管）→ 清本地会话 → 置 `unauthenticated`。 | 清内存 + 清磁盘。 |
| `_onSessionExpired()` | 订阅拦截器广播的失效事件，翻转为 `unauthenticated`。 | 拦截器已清令牌，这里只改态。 |

> **为什么 user 要单独持久化？** refresh 接口只回 `accessToken`，不回用户信息。冷启动想恢复成 `authenticated(User)` 就得有 `User`——所以登录时把用户快照（非敏感的 username/email）也存一份，`build()` 时读回来。

---

## 5. 页面层 screens（薄，只管收集输入 + 本地 loading + 报错）

`lib/features/auth/screens/`。

| 文件 | 职责 | 关键点 |
| --- | --- | --- |
| `login/login.dart` | 登录表单 | `ConsumerStatefulWidget`；`_onLogin` 校验后调 `login()`，本地 `_isSubmitting` 控制按钮 loading，catch `Failure` 弹 SnackBar。**成功后不手动跳转**——登录态一变，路由守卫自动跳 home。 |
| `register/register.dart` | 注册表单 | 同上模式；注册成功**手动** `goNamed(login)`（因为注册不改登录态，守卫不会自动跳）。 |

> **登录成功为什么不 `context.goNamed(home)`？** 因为「已登录就该在 home」这条规则**只应有一个出处**——路由守卫。页面只管把登录态改对，去哪由守卫统一裁决。这样登出、会话失效、深链接等所有场景共用同一套跳转逻辑，不会到处散落 `goNamed`。

---

## 6. 路由与守卫（登录态 → 落到哪个页面）

`lib/app/`。

| 文件 | 职责 | 关键点 |
| --- | --- | --- |
| `router/route_name.dart` | 路由名/路径常量 | 新增 `splash`（路径 `/`，作 initialLocation）。 |
| `router/routes.dart` | 路由表 | splash / login / register / home 四条。 |
| `splash_screen.dart` | 启动占位页 | 登录态未定时展示一个转圈，避免 login/home 闪烁。无文案，无 i18n 约束。 |
| `router/route_guard.dart` | **鉴权守卫** | 三态重定向逻辑，见下。 |
| `router/app_router.dart` | `routerProvider` | 把 GoRouter 做成 provider，`ref.listen(authControllerProvider)` → 自增一个 `ValueNotifier` 作 `refreshListenable`，登录态一变就重跑 redirect。 |
| `app.dart` | `WsyApp` | 改成 `ConsumerWidget`，`ref.watch(routerProvider)` 拿路由器。 |

### 守卫三态逻辑（`guardRedirect`）

```
登录态未定 (AsyncLoading) → 停 splash（不在 splash 就跳 splash）
已登录 (authenticated)    → 在 splash/login/register 就跳 home，否则放行
未登录                    → 在 login/register 就放行，否则跳 login
```

> **`refreshListenable` 是什么？** GoRouter 平时只在导航时算一次 redirect。登录态是**异步变的**（登录成功、静默刷新完成、被踢下线），必须给它一个「信号源」——每次登录态变，`ValueNotifier` 自增一下，GoRouter 收到就重新跑一遍 redirect，把用户送到对的页面。

---

## 7. 支撑登录的 core 基建（infra，v2 重点改造区）

这些在 `lib/core/`，是登录逻辑的地基。网络通用部分见 network-layer-guide，这里只讲 **auth 相关**的。

| 文件 | 职责 | v2 关键点 |
| --- | --- | --- |
| `network/access_token_store.dart` | **内存态** accessToken 持有者 | 只在内存，冷启动即空。拦截器同步读它拼鉴权头。 |
| `storage/secure_storage.dart` | 安全存储 | v2 后**只存 refreshToken + 用户快照**，accessToken 不再落盘。 |
| `network/auth_events.dart` | 鉴权事件通道 | `onUnauthorized` 广播流。**解耦 core→feature**：拦截器广播，controller 订阅。 |
| `network/interceptors/auth_interceptor.dart` | 鉴权拦截器 | ①注入内存 token + `X-Client-Type: app`；②401 自动刷新+重放。见下。 |
| `providers/core_providers.dart` | 装配 | 新增 `accessTokenStoreProvider` / `authEventsProvider`；`X-Client-Type` 进公共头；建「刷新专用 Dio」；`attachDio` 注入主 Dio 给拦截器重放用。 |
| `config/env.dart` | 环境配置 | `apiBaseUrl = BASE_URL + API_PREFIX` 拼接（network v2）。 |

### AuthInterceptor 的 401 自动刷新（最烧脑，单独讲）

```
请求带内存 accessToken → 后端返回 401
  → onError 判断：是 401 且不是刷新请求本身、且没重放过
  → 单飞锁 _refreshOnce：并发的多个 401 只发起一次刷新
  → 用「刷新专用 Dio」(无拦截器) + 磁盘 refreshToken 换新 accessToken
       ├─ 成功：写回内存 → 用「主 Dio」重放原请求(标记 retried 防死循环) → 把结果交回去
       └─ 失败：清内存+清磁盘 → events.notifyUnauthorized() → 放行原 401 错误
```

**三个「为什么」要想明白：**
- **为什么刷新用独立 Dio？** 刷新请求若走主 Dio，它 401 又会触发刷新 → 无限递归。独立无拦截器的 Dio 打破递归。
- **为什么重放走主 Dio？** 要复用主 Dio 的 ResponseInterceptor 把信封解包，业务层才能拿到干净数据；靠 `extra[retried]` 标记防止二次刷新。
- **为什么要 `attachDio`？** 「Dio 需要拦截器、拦截器又需要 Dio 来重放」是构造环——先建拦截器，装进 Dio，再把 Dio 反手塞回拦截器，破环。

---

## 8. 合上书，自己串三条流程（终极自检）

### 流程 A：冷启动，之前登录过

```
main → ProviderScope → WsyApp watch routerProvider → initialLocation "/" splash
authController.build() 开跑(async) → 状态 AsyncLoading → 守卫见未定 → 停 splash（转圈）
build 读磁盘 refreshToken(有) → repo.refreshToken → 换回 accessToken 写内存
     → 读磁盘 user 快照 → 返回 authenticated(user)
状态变 AsyncData(authenticated) → refreshListenable 自增 → 守卫重跑
     → 已登录且在 splash → 跳 home ✅（全程没闪 login）
```

### 流程 B：在登录页输入正确账号密码

```
点登录 → 表单校验过 → _isSubmitting=true(按钮转圈)
authController.login() → repo.login → 后端 200 {accessToken, refreshToken, user}
     → accessToken 写内存 + refreshToken/user 写磁盘 → 状态 AsyncData(authenticated)
refreshListenable 自增 → 守卫重跑 → 已登录且在 login → 跳 home ✅
（登录失败：repo 抛 Failure → 页面 catch → SnackBar 显示 displayMessage，状态没变，仍在 login）
```

### 流程 C：登录很久，accessToken 过期，用户点了某个需要鉴权的操作

```
请求带旧 accessToken → 后端 401
AuthInterceptor.onError → 用磁盘 refreshToken 换新 accessToken
     ├─ 换到了 → 写内存 → 重放原请求 → 用户无感，操作照常成功 ✅
     └─ refreshToken 也失效 → 清会话 + notifyUnauthorized()
            → AuthController._onSessionExpired 置 unauthenticated
            → refreshListenable → 守卫把用户踢回 login ✅
```

能顺畅说出这三条，就说明你真的读懂了整套登录逻辑。

---

## 9. 现存 TODO / 注意事项

- **home 的「返回登录」按钮**：现在守卫会把已登录用户从 login 弹回 home，该按钮已失效。接 todo 首页时应改成「登出」（调 `authController.logout()`，并加对应 i18n key）。
- **`.env` 需含** `BASE_URL` / `API_PREFIX`（network v2）。
- **mock**：当前直连 `http://localhost:3000/api` 真后端，无 mock；若后端未起，登录/刷新会走网络失败分支（`Failure.network`）。
- **register 的社交登录按钮 / 忘记密码**：仍是占位 `onTap: () {}`，未接。

---

## 附：登录逻辑文件清单速查

| 层 | 文件 |
| --- | --- |
| 领域 | `features/auth/domain/{user,auth_tokens,auth_session,auth_state}.dart` |
| DTO | `features/auth/data/dto/*_dto.dart`（7 个） |
| 数据源 | `features/auth/data/auth_remote_data_source.dart` |
| 仓库 | `features/auth/data/auth_repository.dart` |
| 控制器 | `features/auth/controllers/auth_controller.dart` |
| 页面 | `features/auth/screens/{login/login,register/register}.dart` |
| 路由 | `app/router/{route_name,routes,route_guard,app_router}.dart`、`app/splash_screen.dart`、`app/app.dart` |
| 令牌 infra | `core/network/access_token_store.dart`、`core/storage/secure_storage.dart` |
| 事件 infra | `core/network/auth_events.dart` |
| 拦截器 | `core/network/interceptors/auth_interceptor.dart` |
| 装配 | `core/providers/core_providers.dart` |
| 配置 | `core/config/env.dart` |
| 网络底座 | 见 `agent/study/network-layer-guide.md` |
