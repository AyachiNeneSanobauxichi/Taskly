import "package:flutter/material.dart";
import "package:todo_app_v1/core/theme/index.dart";
import "package:todo_app_v1/features/todo/domain/index.dart";
import "package:todo_app_v1/features/todo/widgets/todo_labels.dart";
import "package:todo_app_v1/l10n/app_localizations.dart";

/// 已选筛选结果。[type] / [status] 为 null 表示该维度不筛选（全部）。
typedef TodoFilterResult = ({TodoType? type, TodoStatus? status});

/// 打开筛选底部弹层（类型 + 状态用 ChoiceChip 选择，替代下拉）。
/// 返回 null 表示未应用（取消/下滑关闭）；否则为「应用」时的选择。
Future<TodoFilterResult?> showTodoFilterSheet(
  BuildContext context, {
  required TodoType? type,
  required TodoStatus? status,
}) {
  return showModalBottomSheet<TodoFilterResult>(
    context: context,
    showDragHandle: true,
    builder: (_) => _TodoFilterSheet(type: type, status: status),
  );
}

class _TodoFilterSheet extends StatefulWidget {
  const _TodoFilterSheet({required this.type, required this.status});

  final TodoType? type;
  final TodoStatus? status;

  @override
  State<_TodoFilterSheet> createState() => _TodoFilterSheetState();
}

class _TodoFilterSheetState extends State<_TodoFilterSheet> {
  late TodoType? _type = widget.type;
  late TodoStatus? _status = widget.status;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final l10n = AppLocalizations.of(context);

    return Padding(
      padding: const EdgeInsets.fromLTRB(
        WsyAppSpacing.md,
        0,
        WsyAppSpacing.md,
        WsyAppSpacing.md,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        spacing: WsyAppSpacing.md,
        children: [
          Text(l10n.todoFilters, style: theme.textTheme.titleLarge),
          _Group(
            label: l10n.todoFieldType,
            children: [
              ChoiceChip(
                label: Text(l10n.todoFilterTypeAll),
                selected: _type == null,
                onSelected: (_) => setState(() => _type = null),
              ),
              for (final t in kSelectableTodoTypes)
                ChoiceChip(
                  label: Text(t.label(l10n)),
                  selected: _type == t,
                  onSelected: (_) => setState(() => _type = t),
                ),
            ],
          ),
          _Group(
            label: l10n.todoFieldStatus,
            children: [
              ChoiceChip(
                label: Text(l10n.todoFilterStatusAll),
                selected: _status == null,
                onSelected: (_) => setState(() => _status = null),
              ),
              for (final s in kSelectableTodoStatuses)
                ChoiceChip(
                  label: Text(s.label(l10n)),
                  selected: _status == s,
                  onSelected: (_) => setState(() => _status = s),
                ),
            ],
          ),
          Row(
            spacing: WsyAppSpacing.md,
            children: [
              Expanded(
                child: OutlinedButton(
                  onPressed: () => setState(() {
                    _type = null;
                    _status = null;
                  }),
                  child: Text(l10n.commonReset),
                ),
              ),
              Expanded(
                child: FilledButton(
                  onPressed: () =>
                      Navigator.of(context).pop((type: _type, status: _status)),
                  child: Text(l10n.commonApply),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

/// 一个筛选分组：小标题 + 可换行的 chip 组。
class _Group extends StatelessWidget {
  const _Group({required this.label, required this.children});

  final String label;
  final List<Widget> children;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      spacing: WsyAppSpacing.sm,
      children: [
        Text(
          label,
          style: theme.textTheme.labelLarge?.copyWith(
            color: theme.colorScheme.onSurfaceVariant,
          ),
        ),
        Wrap(
          spacing: WsyAppSpacing.sm,
          runSpacing: WsyAppSpacing.xs,
          children: children,
        ),
      ],
    );
  }
}
