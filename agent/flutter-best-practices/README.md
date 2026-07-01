# Flutter 企业级最佳实践（Skill 索引）

> 本目录是 `todo_app_v1` 的 **单一权威规范来源（Single Source of Truth）**。
> Claude 通过根目录 `claude.md` 引用本目录；Cursor 通过 `.cursor/rules/*.mdc` 引用本目录。
> 修改规范时**只需改这里**，两端自动生效。

## 📚 模块清单

| 模块 | 文件 | 适用范围 |
| --- | --- | --- |
| 总览与核心原则 | [`00-overview.md`](./00-overview.md) | 全局 |
| 项目结构 | [`01-project-structure.md`](./01-project-structure.md) | `lib/**` |
| 架构分层 | [`02-architecture.md`](./02-architecture.md) | `lib/features/**` |
| 命名规范 | [`03-naming-conventions.md`](./03-naming-conventions.md) | 全局 |
| 状态管理 (Riverpod) | [`04-state-management.md`](./04-state-management.md) | `**/controllers/**`, `**/providers/**` |
| 网络层 (Dio) | [`05-networking.md`](./05-networking.md) | `**/data/**`, `**/network/**` |
| 数据模型 (Freezed) | [`06-data-models.md`](./06-data-models.md) | `**/domain/**`, `**/*_model.dart` |
| 路由 (go_router) | [`07-routing.md`](./07-routing.md) | `**/router/**` |
| 错误处理 | [`08-error-handling.md`](./08-error-handling.md) | `**/error/**`, `**/data/**` |
| 主题与 UI | [`09-theming-ui.md`](./09-theming-ui.md) | `**/theme/**`, `**/widgets/**`, `**/presentation/**`, `**/screens/**` |
| 存储与安全 | [`10-storage-security.md`](./10-storage-security.md) | `**/storage/**`, `**/config/**` |
| 国际化 | [`11-i18n-localization.md`](./11-i18n-localization.md) | 全局 |
| 代码生成 | [`12-code-generation.md`](./12-code-generation.md) | `**/*.g.dart`, `**/*.freezed.dart` |
| 测试 | [`13-testing.md`](./13-testing.md) | `test/**` |
| 性能 | [`14-performance.md`](./14-performance.md) | 全局 |
| Git 与质量门禁 | [`15-git-and-quality.md`](./15-git-and-quality.md) | 全局 |

## 🧭 使用约定

1. **写代码前** 先阅读相关模块，尤其是 `00-overview.md`（核心原则）与对应领域模块。
2. **每个模块** 都遵循 "✅ 应该 / ❌ 避免 / 📌 示例" 三段式，便于快速对照。
3. 示例代码基于本项目实际依赖版本（见 `00-overview.md` 技术栈），**不要**照搬旧版本 API。
4. 规范之间有冲突时，以更具体的领域模块为准；领域模块未覆盖的以 `00-overview.md` 为准。
