import "package:todo_app_v1/features/todo/domain/index.dart";
import "package:todo_app_v1/l10n/app_localizations.dart";

/// 枚举 → 本地化显示名。集中在此，避免各处重复 switch（红线 #9：文案走 i18n）。

extension TodoTypeLabel on TodoType {
  String label(AppLocalizations l10n) => switch (this) {
    TodoType.normal => l10n.todoTypeNormal,
    TodoType.important => l10n.todoTypeImportant,
    TodoType.urgent => l10n.todoTypeUrgent,
    TodoType.unknown => l10n.todoTypeNormal,
  };
}

extension TodoStatusLabel on TodoStatus {
  String label(AppLocalizations l10n) => switch (this) {
    TodoStatus.pending => l10n.todoStatusPending,
    TodoStatus.doing => l10n.todoStatusDoing,
    TodoStatus.completed => l10n.todoStatusCompleted,
    // deleted 不在可选/展示范围内，兜底给待办文案避免抛错。
    TodoStatus.deleted => l10n.todoStatusPending,
    TodoStatus.unknown => l10n.todoStatusPending,
  };
}

/// 筛选/编辑下拉的可选项（均排除 deleted 与 unknown）。
const List<TodoType> kSelectableTodoTypes = [
  TodoType.normal,
  TodoType.important,
  TodoType.urgent,
];

const List<TodoStatus> kSelectableTodoStatuses = [
  TodoStatus.pending,
  TodoStatus.doing,
  TodoStatus.completed,
];
