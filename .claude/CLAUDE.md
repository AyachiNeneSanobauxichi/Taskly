# CLAUDE.md — todo_app_v1 工程规范

本文件是 Claude 在本仓库工作的入口约定（位于 `.claude/`，由 Claude Code 自动加载）。**详细规范以 skill 形式维护：`flutter-best-practices`（`.claude/skills/flutter-best-practices/`），是唯一权威来源。** 编写/修改/审查 Dart/Flutter 代码时按需读取该 skill 的 `references/` 模块。

## 🚦 首要红线（务必遵守）

1. 字符串用**双引号** `"..."`（`prefer_double_quotes: true`）。
2. 状态管理用 **Riverpod 3**（`flutter_riverpod`）。⚠️ 当前 Flutter SDK 工具链无法运行 `riverpod_generator`，**provider/notifier 一律手写**（`Provider`/`NotifierProvider`/`AsyncNotifierProvider` 等），**不用 `@riverpod` 注解与代码生成**；模型仍用 **Freezed 3** + `build_runner`。原因与等价写法见 `agent/study/riverpod-codegen-issue.md`。
3. 严格 **feature-first + 分层**：`data / domain / controllers / screens / widgets`，依赖单向向下。
4. 网络只通过 `core/network/DioClient`；错误统一 `AppException → Failure → AsyncValue`。
5. 每个目录维护 `index.dart` barrel；对外只经 barrel 引用。
6. 提交前 `dart format` + `flutter analyze`（零告警）+ `flutter test`。禁止 `print`。
7. **关键函数/复杂逻辑必须写注释**（讲意图/为什么）；UI 代码注释保持简洁。
8. **禁止魔法值**：尺寸/圆角用 `WsyAppSpacing`/`WsyAppRadius`，颜色用 `colorScheme`/`WsyAppColors`，文字用 `textTheme`/`WsyAppTextStyles`；禁止内联 `TextStyle(fontSize: ...)`、`Color(0xFF...)`、裸数值尺寸。
9. **页面文案禁止硬编码**：用户可见文案一律走国际化（gen-l10n `AppLocalizations`/ARB），`screens/`·`widgets/` 内不得出现中/英文字面量。
10. **agent 生成边界**：依业务文档（`*_page.md`/`*_api.md`）生成的代码**只写业务层**，**禁止改动 infra**（`core/`、`app/router`、`theme/`、`DioClient`、工程配置等）；确有必要必须停下重点询问、由人工操作。`agent/infra/*` 文档只写 infra。
11. **无真实接口用 mock**：暂无后端时在 feature 的 `data/mock/` 建 mock 数据跑通逻辑，**接入真实接口后立即删除** mock 文件夹；不确定处一律加带描述的 `TODO(<scope>): ...`。

## 📚 详细规范

完整规范见 skill **`flutter-best-practices`**，编码前先读 `references/00-overview.md`，再按任务领域读对应模块（结构/架构/Riverpod/Dio/Freezed/路由/错误/UI/存储/国际化/代码生成/测试/性能/命名/Git/Agent 工作流）。表单校验统一用 `form_builder_validators`。**按 `agent/` 文档生成代码前，先读 `references/16-agent-workflow.md`。**

## 🔧 常用命令

```bash
flutter pub get
dart run build_runner build --delete-conflicting-outputs   # 改了 freezed/json 注解后（provider 手写，无需生成）
dart run build_runner watch  --delete-conflicting-outputs   # 开发期自动生成
dart format .
flutter analyze
flutter test
```

## 🔁 规范同步（skill ↔ rules）

- 同一套规范有两种表达：Claude 用 skill（`.claude/skills/flutter-best-practices/`），Cursor 用 rules（`.cursor/rules/*.mdc`，内容自包含）。
- 改规范/新增约定：**两处都要更新**，保持内容一致；新增领域时补 skill 的 `references/<nn-xxx>.md`（并在 `SKILL.md` 索引加行）+ 对应 `.cursor/rules/<xxx>.mdc`。
- 详见 `.cursor/rules/sync.mdc`。
