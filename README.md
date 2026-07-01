# todo_app_v1

一个基于 Flutter 的待办事项应用，采用 **feature-first + Clean Architecture** 分层架构，遵循企业级工程规范。

> 完整开发规范见 [`agent/flutter-best-practices/`](./agent/flutter-best-practices/README.md)（Claude / Cursor 均已接入）。

## 技术栈

| 领域 | 技术 | 版本 | 说明 |
| --- | --- | --- | --- |
| 框架 | Flutter / Dart | Dart `^3.10.1` | 现代语法（records / patterns / sealed / switch 表达式） |
| 状态管理 | `flutter_riverpod` + `riverpod_annotation` | 3.3.x / 4.0.x | 代码生成写法（`@riverpod`） |
| 网络 | `dio` + `pretty_dio_logger` + `connectivity_plus` | 5.10.x | 统一 `DioClient` + 拦截器 + 断网检测 |
| 数据模型 | `freezed` + `json_serializable` + `*_annotation` | 3.2.x / 6.11.x | 不可变模型 + JSON 序列化 |
| 路由 | `go_router` | 17.3.x | 声明式路由 + 鉴权守卫 |
| 配置 | `flutter_dotenv` | 6.0.x | `.env` 环境变量 |
| 日志 | `logger` | 2.7.x | 统一 `AppLogger` |
| 国际化 | `intl` | 0.20.x | 日期 / 数字 / 复数 |
| 图片 | `cached_network_image` | 3.4.x | 网络图缓存 |
| 代码生成 | `build_runner` | 2.15.x | freezed / json / riverpod |
| 静态检查 | `flutter_lints` | 6.0.x | 基线 lint 规则 |

## 项目结构

```text
lib/
├── main.dart          # 入口（加载 .env、ProviderScope、runApp）
├── app/               # 应用装配（MaterialApp、router）
├── core/              # 跨功能基础设施（network / error / storage / config / utils）
├── features/          # 业务功能（feature-first：data/domain/controllers/screens/widgets）
├── shared/            # 可复用的业务无关组件/模型
├── theme/             # 主题与配色
└── widgets/           # 全局通用 UI 组件
```

## 环境要求

- Flutter SDK（Dart `^3.10.1`，建议使用最新 stable）
- 已配置 iOS / Android 开发环境（Xcode / Android Studio + 模拟器或真机）

验证环境：

```bash
flutter --version
flutter doctor
```

## 启动方法

### 1. 安装依赖

```bash
flutter pub get
```

### 2. 配置环境变量

在项目根目录创建 `.env` 文件（参考规范中的 `Env` 封装）：

```env
API_BASE_URL=https://api.example.com
ENABLE_LOGGING=true
```

> `.env` 已在 `.gitignore` 中忽略，请勿提交真实密钥。

### 3. 生成代码（Freezed / JSON / Riverpod）

首次运行或修改了带注解（`@freezed` / `@JsonSerializable` / `@riverpod`）的文件后执行：

```bash
dart run build_runner build --delete-conflicting-outputs
```

开发期可用监听模式自动生成：

```bash
dart run build_runner watch --delete-conflicting-outputs
```

### 4. 运行应用

```bash
flutter run                 # 运行到默认设备
flutter devices             # 查看可用设备
flutter run -d <device_id>  # 指定设备运行
```

## 常用命令

```bash
dart format .        # 代码格式化
flutter analyze      # 静态分析（提交前需零告警）
flutter test         # 运行测试
flutter build apk    # 构建 Android 包
flutter build ios    # 构建 iOS 包
```

## 开发规范

本项目采用模块化工程规范，作为 Claude 与 Cursor 的统一约定来源：

- 规范文档：[`agent/flutter-best-practices/`](./agent/flutter-best-practices/README.md)
- Claude 入口：[`claude.md`](./claude.md)
- Cursor 规则：`.cursor/rules/*.mdc`（按文件类型自动生效）

提交前请确保：`dart format` 已执行、`flutter analyze` 零告警、`flutter test` 通过。
