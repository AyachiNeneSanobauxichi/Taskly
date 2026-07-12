# CLAUDE.md — todo_app_v1 工程规范

本文件是 Claude 在本仓库工作的入口约定（位于 `.claude/`，由 Claude Code 自动加载）。**详细规范以 skill 形式维护：`flutter-best-practices`（`.claude/skills/flutter-best-practices/`），是唯一权威来源。** 编写/修改/审查 Dart/Flutter 代码时按需读取该 skill 的 `references/` 模块。

## 🚦 首要红线（务必遵守）

1. 字符串用**双引号** `"..."`（`prefer_double_quotes: true`）。
2. 状态管理只用 **Riverpod 3 `@riverpod` 代码生成**；模型只用 **Freezed 3**；改注解后必须跑 `build_runner`。
3. 严格 **feature-first + 分层**：`data / domain / controllers / screens / widgets`，依赖单向向下。
4. 网络只通过 `core/network/DioClient`；错误统一 `AppException → Failure → AsyncValue`。
5. 每个目录维护 `index.dart` barrel；对外只经 barrel 引用。
6. 提交前 `dart format` + `flutter analyze`（零告警）+ `flutter test`。禁止 `print`。

## 📚 详细规范

完整规范见 skill **`flutter-best-practices`**，编码前先读 `references/00-overview.md`，再按任务领域读对应模块（结构/架构/Riverpod/Dio/Freezed/路由/错误/UI/存储/国际化/代码生成/测试/性能/命名/Git）。表单校验统一用 `form_builder_validators`。

## 🔧 常用命令

```bash
flutter pub get
dart run build_runner build --delete-conflicting-outputs   # 改了 freezed/json/riverpod 注解后
dart run build_runner watch  --delete-conflicting-outputs   # 开发期自动生成
dart format .
flutter analyze
flutter test
```

## 🔁 规范同步（skill ↔ rules）

- 同一套规范有两种表达：Claude 用 skill（`.claude/skills/flutter-best-practices/`），Cursor 用 rules（`.cursor/rules/*.mdc`，内容自包含）。
- 改规范/新增约定：**两处都要更新**，保持内容一致；新增领域时补 skill 的 `references/<nn-xxx>.md`（并在 `SKILL.md` 索引加行）+ 对应 `.cursor/rules/<xxx>.mdc`。
- 详见 `.cursor/rules/sync.mdc`。
