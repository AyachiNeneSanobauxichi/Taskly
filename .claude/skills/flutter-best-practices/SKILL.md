---
name: flutter-best-practices
description: >-
  todo_app_v1 的 Flutter 工程规范（企业级最佳实践）。在本仓库编写、修改或审查任何
  Dart/Flutter 代码时使用：涉及 Riverpod 状态管理、Freezed 数据模型、Dio 网络层、
  go_router 路由、错误处理、主题/UI、存储与安全、国际化、build_runner 代码生成、
  测试、性能、命名与目录结构、Git 提交规范时，先读对应的 references/ 模块再动手。
---

# Flutter 工程规范（todo_app_v1）

本 skill 是本仓库 Flutter 开发的**权威规范**。编码前先读 `references/00-overview.md`，再按任务领域读对应模块。

## 🚦 首要红线（务必遵守）

1. 字符串用**双引号** `"..."`（`prefer_double_quotes: true`）。
2. 状态管理只用 **Riverpod 3 `@riverpod` 代码生成**；模型只用 **Freezed 3**；改注解后必须跑 `build_runner`。
3. 严格 **feature-first + 分层**：`data / domain / controllers / screens / widgets`，依赖单向向下（domain 不依赖 data）。
4. 网络只通过 `core/network/DioClient`；错误统一 `AppException → Failure → AsyncValue`。
5. 每个目录维护 `index.dart` barrel；对外只经 barrel 引用。
6. 提交前 `dart format` + `flutter analyze`（零告警）+ `flutter test`。禁止 `print`（用 `AppLogger`）。

## 🔧 常用命令

```bash
flutter pub get
dart run build_runner build --delete-conflicting-outputs   # 改了 freezed/json/riverpod 注解后
dart run build_runner watch  --delete-conflicting-outputs   # 开发期自动生成
dart format .
flutter analyze
flutter test
```

## 📚 领域模块（按需读 references/）

| 任务领域 | 参考文件 |
| --- | --- |
| 技术栈与核心原则、代码风格 | `references/00-overview.md` |
| 目录结构（feature-first） | `references/01-project-structure.md` |
| 分层架构（Clean Architecture） | `references/02-architecture.md` |
| 命名规范 | `references/03-naming-conventions.md` |
| Riverpod 3 状态管理 | `references/04-state-management.md` |
| Dio 网络层 | `references/05-networking.md` |
| Freezed 数据模型 | `references/06-data-models.md` |
| go_router 路由 | `references/07-routing.md` |
| 错误处理 | `references/08-error-handling.md` |
| 主题与 UI | `references/09-theming-ui.md` |
| 存储/配置/安全 | `references/10-storage-security.md` |
| 国际化 | `references/11-i18n-localization.md` |
| build_runner 代码生成 | `references/12-code-generation.md` |
| 测试 | `references/13-testing.md` |
| 性能 | `references/14-performance.md` |
| Git 与质量门禁 | `references/15-git-and-quality.md` |

## ✅ 工作流约定

- 新增功能前，先读 `01`（结构）+ `02`（架构）+ 相关领域模块，再动手。
- 生成/修改带注解的文件后，**立即**运行 `build_runner`，再继续。
- 完成后自检：barrel 导出补齐、`flutter analyze` 干净、无敏感信息入库。

> 同源提醒：本 skill 与 `.cursor/rules/*.mdc` 是同一套规范的两种表达（Claude 用 skill，Cursor 用 rules）。改规范时两处都要更新，见 `.cursor/rules/sync.mdc`。
