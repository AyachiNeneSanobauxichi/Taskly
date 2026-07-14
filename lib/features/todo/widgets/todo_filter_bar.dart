import "package:flutter/material.dart";
import "package:todo_app_v1/core/theme/index.dart";
import "package:todo_app_v1/features/todo/domain/index.dart";
import "package:todo_app_v1/features/todo/widgets/todo_labels.dart";
import "package:todo_app_v1/l10n/app_localizations.dart";

/// 类型 / 状态筛选栏。两个下拉各含「全部」（值为 null）选项；状态项不含 deleted。
class TodoFilterBar extends StatelessWidget {
  const TodoFilterBar({
    super.key,
    required this.type,
    required this.status,
    required this.onTypeChanged,
    required this.onStatusChanged,
  });

  final TodoType? type;
  final TodoStatus? status;
  final ValueChanged<TodoType?> onTypeChanged;
  final ValueChanged<TodoStatus?> onStatusChanged;

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    return Row(
      spacing: WsyAppSpacing.sm,
      children: [
        Expanded(
          child: DropdownButtonFormField<TodoType?>(
            initialValue: type,
            isExpanded: true,
            decoration: const InputDecoration(isDense: true),
            items: [
              DropdownMenuItem(
                value: null,
                child: Text(l10n.todoFilterTypeAll),
              ),
              for (final t in kSelectableTodoTypes)
                DropdownMenuItem(value: t, child: Text(t.label(l10n))),
            ],
            onChanged: onTypeChanged,
          ),
        ),
        Expanded(
          child: DropdownButtonFormField<TodoStatus?>(
            initialValue: status,
            isExpanded: true,
            decoration: const InputDecoration(isDense: true),
            items: [
              DropdownMenuItem(
                value: null,
                child: Text(l10n.todoFilterStatusAll),
              ),
              for (final s in kSelectableTodoStatuses)
                DropdownMenuItem(value: s, child: Text(s.label(l10n))),
            ],
            onChanged: onStatusChanged,
          ),
        ),
      ],
    );
  }
}
