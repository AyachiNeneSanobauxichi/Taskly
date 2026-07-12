# 网络层学习指南（core/network 全景）

> 这份文档带你**从零读懂本项目的网络请求架构**：按「从地基往上，最后串一遍完整请求」的顺序学，每一步告诉你读哪个文件、重点看什么、为什么这样设计、以及和上下游怎么接。配套支线：为什么用手写 Provider 而非 `@riverpod`，见 `agent/study/riverpod-codegen-issue.md`。

---

## 0. 先建立全局图

一句话记住数据流，后面每个文件都往这张图上挂：

```
UI → Controller → Repository → DioClient → Dio(拦截器链) → 后端
                                    ↑ 错误反向收敛
后端返回 → Response拦截器解包 → Error拦截器映射 → DioClient抛AppException
        → Repository转Failure → UI 渲染友好文案
```

**贯穿始终的两条红线：**

1. **依赖单向向下**：上层能调下层，下层不知道上层。业务只依赖 `DioClient`，永远接触不到 `Dio` 或 `DioException`。
2. **两层错误**：底层抛技术异常 `AppException` → Repository 转面向 UI 的 `Failure` → UI 只认 `Failure`。用户永远看不到堆栈/技术细节。

**关键约定（来自 network.md v1）：**

- baseUrl = `http://localhost:3000`，全局前缀 `/api`（合成 `http://localhost:3000/api`）。
- 统一响应信封：`{ "code": 0, "message": "success", "data": {...} }`，`code==0` 成功，否则业务错误。
- token 放请求头 `Authorization: Bearer <token>`。

---

## 1. 配置与工具（最底层，谁都不依赖）

| 文件 | 职责 | 重点 |
| --- | --- | --- |
| `lib/core/config/env.dart` | 集中读 `.env` | 为什么不在业务里 `dotenv.env["X"]` 裸读？→ 避免 key 拼写漂移、缺省值不一致。`apiBaseUrl` 默认 `http://localhost:3000/api`。 |
| `lib/shared/utils/logger.dart` | 统一日志，替代 `print` | `kDebugMode` 下才输出，生产静默；禁止记 token 等敏感信息。 |

> **自检**：为什么 baseUrl 不写死在 `DioClient` 里？（答：环境会变——本地/测试/生产不同，集中到 `Env` 一处改。）

---

## 2. 错误模型（整个架构的灵魂）

务必读懂**两层错误**的区别，这是本项目错误处理的核心哲学。

### `lib/core/error/app_exception.dart` —— 技术层异常

- `sealed class AppException`，子类 = 出错**类型**：`NetworkException`（断网）、`TimeoutException`（超时）、`ServerException`（HTTP 非 2xx，带 statusCode）、`ParseException`、`UnknownException`。
- **特别注意** `BusinessException`：HTTP 200 但信封 `code != 0` 的业务错误（如 `11001 Invalid token`），携带后端 `code` 与 `message`。

### `lib/core/error/failure.dart` —— UI 层失败（freezed）

- `sealed class Failure`：`network / server / unauthorized / business / unknown`。
- `toFailure()` 扩展：把 `AppException` **翻译**成 `Failure`（例：`ServerException(statusCode:401)` → `Failure.unauthorized()`）。
- `displayMessage` 扩展：给用户看的话（优先用后端 message，否则兜底文案）。

> **记住这句**：底层抛 `AppException`，Repository 转 `Failure`，UI 只认 `Failure`。
>
> **自检**：`ServerException(statusCode: 401)` 会变成哪个 `Failure`？（看 `toFailure` 的 switch）

---

## 3. 安全存储 + 信封模型（两个独立小件）

| 文件 | 职责 | 重点 |
| --- | --- | --- |
| `lib/core/storage/secure_storage.dart` | token 存 Keychain/Keystore | 对外只给 `readToken/writeToken/deleteToken/clear` 语义方法，key 常量藏内部；登出 `clear()`。 |
| `lib/core/network/api_response.dart` | 解析信封 `{code,message,data}` | `isSuccess => code == 0`；只被拦截器用，业务层拿不到它。 |

---

## 4. DioClient（业务唯一的网络入口）

### `lib/core/network/dio_client.dart`

- 对 `Dio` 的**薄封装**，暴露 `get/post/put/patch/delete`。
- 核心看私有 `_request()`：

  ```dart
  Future<T> _request<T>(Future<Response<T>> Function() send) async {
    try {
      final res = await send();
      return res.data as T; // 拦截器已把信封 data 解包写回
    } on DioException catch (e) {
      final err = e.error;
      throw err is AppException ? err : const UnknownException();
    }
  }
  ```

- **关键认知**：DioClient **不做解包、不做错误映射**（那些交给拦截器），它只负责「统一入口 + 把 Dio 的 `DioException` 收敛成 `AppException` 抛出」，把 Dio 细节挡在网络层内。

---

## 5. 拦截器链（请求真正发生的地方）⭐ 最需要吃透

**按装配顺序读，顺序即执行逻辑。** 装配在 `core_providers.dart` 里：`[Auth, Response, Error, Logger]`。

| 顺序 | 文件 | 钩子 | 干什么 |
| --- | --- | --- | --- |
| 1 | `interceptors/auth_interceptor.dart` | `onRequest` | 读 token，拼 `Authorization: Bearer xxx`；无 token 不加头（公开接口可访问）。 |
| 2 | `interceptors/response_interceptor.dart` | `onResponse` | 拆信封：`code==0` 把内层 `data` 写回 `response.data`；否则 `reject` 成带 `BusinessException` 的错误。 |
| 3 | `interceptors/error_interceptor.dart` | `onError` | 已是 `AppException` 直接放行；否则把超时/断网/HTTP 错误映射成对应 `AppException`。 |
| 4 | `PrettyDioLogger` | - | 仅 debug 打印请求/响应。 |

> **关键顺序题（务必想明白）**：为什么 `ErrorInterceptor` 必须排在 `ResponseInterceptor` **后面**？
>
> 因为 Response 拆包发现业务错误时会 `reject`，这个错误要能被**后面**的 Error 拦截器接住并放行（Error 里判断「已是 AppException 就直接 next」）。顺序反了，业务错误就没人接，链路断裂。

---

## 6. 装配 + 启动

### `lib/core/providers/core_providers.dart`

三个**手写** Provider，依赖单向：`secureStorage → dio → dioClient`。

```dart
final secureStorageProvider = Provider<SecureStorage>(
  (ref) => const SecureStorage(FlutterSecureStorage()),
);

final dioProvider = Provider<Dio>((ref) {
  final dio = Dio(BaseOptions(baseUrl: Env.apiBaseUrl, /* 超时/头 */));
  dio.interceptors.addAll([
    AuthInterceptor(ref.watch(secureStorageProvider)), // 依赖上一个 provider
    ResponseInterceptor(),
    ErrorInterceptor(),
    if (kDebugMode && Env.enableLogging) PrettyDioLogger(...),
  ]);
  ref.onDispose(dio.close); // provider 销毁时自动关连接
  return dio;
});

final dioClientProvider =
    Provider<DioClient>((ref) => DioClient(ref.watch(dioProvider)));
```

### `lib/main.dart`

`dotenv.load()`（失败不致命，Env 有默认值）→ 全局错误兜底（`FlutterError.onError` / `PlatformDispatcher.onError`）→ `runApp(ProviderScope(...))`。

---

## 7. 为什么 Dio 要用 Provider 包一层（而不是全局对象）

`final dio = Dio(...)` 也能跑，但 provider 换来 5 样裸对象给不了的东西：

1. **依赖注入**：`dioProvider` 用 `ref.watch(secureStorageProvider)` 声明式组合，不用手动保证初始化顺序。
2. **生命周期**：`ref.onDispose(dio.close)` 自动关连接，不会漏。
3. **单例 + 懒加载**：第一次 watch 才建，之后全局复用，无需自己写单例样板。
4. **测试可替换**：`ProviderScope(overrides: [dioProvider.overrideWithValue(mockDio)])` 换 mock，生产代码一行不改。
5. **红线要求**：skill `04` 明确禁止「用全局单例/静态变量代替 provider」。

> 不是 Dio 特殊——本项目所有跨组件的服务/依赖（secureStorage、dioClient、以后各种 Repository）都走 provider。**provider 就是本项目的依赖注入容器。**

---

## 8. 合上书，自己串一遍（终极自检）

不看代码，凭记忆走这个场景：**「一个带 token 的 GET 请求，后端返回 `code: 11001`，最后 UI 显示什么」**。

标准链路：

```
dioClient.get("/xxx")
  → AuthInterceptor 加 Authorization: Bearer 头
  → 后端返回 HTTP 200，但 body = {code: 11001, message: "Invalid token"}
  → ResponseInterceptor 发现 code≠0，reject 成 BusinessException(11001)
  → ErrorInterceptor 见 error 已是 AppException，直接放行
  → DioClient._request 捕获 DioException，取出 e.error 重抛 BusinessException
  → Repository catch(AppException) → toFailure() → Failure.business(code:11001)
  → UI 用 failure.displayMessage 显示「操作失败，请稍后再试」
```

能顺畅说出每一站，就说明你真懂了这套架构。

---

## 9. 现存的 TODO（接后端时要处理）

- `AuthInterceptor` 里 `TODO(auth)`：收到 401 时刷新令牌/登出跳登录，待登录流程就绪补。
- `failure.dart` 里 `TODO(auth)`：后端业务错误码表定稿后，把「token 失效」类 code 映射为 `Failure.unauthorized()`。
- `failure.dart` 里 `TODO(i18n)`：兜底文案后续宜走 `AppLocalizations`。

---

## 附：文件清单速查

| 层 | 文件 |
| --- | --- |
| 配置 | `lib/core/config/env.dart` |
| 日志 | `lib/shared/utils/logger.dart` |
| 错误 | `lib/core/error/app_exception.dart`、`lib/core/error/failure.dart` |
| 存储 | `lib/core/storage/secure_storage.dart` |
| 信封 | `lib/core/network/api_response.dart` |
| 入口 | `lib/core/network/dio_client.dart` |
| 拦截器 | `lib/core/network/interceptors/{auth,response,error}_interceptor.dart` |
| 装配 | `lib/core/providers/core_providers.dart` |
| 启动 | `lib/main.dart` |
| 可选包装 | `lib/core/network/api_result.dart`（`sealed ApiResult<T>`，非抛异常场景用） |
