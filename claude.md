# CLAUDE.md — todo_app_v1 工程规范

本文件是 Claude 在本仓库工作的入口约定。**详细规范采用模块化文档，位于 `agent/flutter-best-practices/`，是唯一权威来源。** 修改规范只改那里；本文件仅做导航与红线。

## 🚦 首要红线（务必遵守）

1. 字符串用**双引号** `"..."`（`prefer_double_quotes: true`）。
2. 状态管理只用 **Riverpod 3 `@riverpod` 代码生成**；模型只用 **Freezed 3**；改注解后必须跑 `build_runner`。
3. 严格 **feature-first + 分层**：`data / domain / controllers / screens / widgets`，依赖单向向下。
4. 网络只通过 `core/network/DioClient`；错误统一 `AppException → Failure → AsyncValue`。
5. 每个目录维护 `index.dart` barrel；对外只经 barrel 引用。
6. 提交前 `dart format` + `flutter analyze`（零告警）+ `flutter test`。禁止 `print`。

## 📚 规范模块（按需完整阅读）

编码前请阅读 `@agent/flutter-best-practices/00-overview.md`，并按任务领域阅读对应模块：

- @agent/flutter-best-practices/00-overview.md — 技术栈与核心原则
- @agent/flutter-best-practices/01-project-structure.md — 目录结构
- @agent/flutter-best-practices/02-architecture.md — 分层架构
- @agent/flutter-best-practices/03-naming-conventions.md — 命名规范
- @agent/flutter-best-practices/04-state-management.md — Riverpod 状态管理
- @agent/flutter-best-practices/05-networking.md — Dio 网络层
- @agent/flutter-best-practices/06-data-models.md — Freezed 数据模型
- @agent/flutter-best-practices/07-routing.md — go_router 路由
- @agent/flutter-best-practices/08-error-handling.md — 错误处理
- @agent/flutter-best-practices/09-theming-ui.md — 主题与 UI
- @agent/flutter-best-practices/10-storage-security.md — 存储/配置/安全
- @agent/flutter-best-practices/11-i18n-localization.md — 国际化
- @agent/flutter-best-practices/12-code-generation.md — build_runner 代码生成
- @agent/flutter-best-practices/13-testing.md — 测试
- @agent/flutter-best-practices/14-performance.md — 性能
- @agent/flutter-best-practices/15-git-and-quality.md — Git 与质量门禁

> 索引与使用约定见 `@agent/flutter-best-practices/README.md`。

## 🔧 常用命令

```bash
flutter pub get
dart run build_runner build --delete-conflicting-outputs   # 改了 freezed/json/riverpod 注解后
dart run build_runner watch  --delete-conflicting-outputs   # 开发期自动生成
dart format .
flutter analyze
flutter test
```

## ✅ 工作流约定

- 新增功能前，先读 `01`（结构）+ `02`（架构）+ 相关领域模块，再动手。
- 生成/修改带注解的文件后，**立即**运行 `build_runner`，再继续。
- 完成后自检：barrel 导出补齐、`flutter analyze` 干净、无敏感信息入库。
