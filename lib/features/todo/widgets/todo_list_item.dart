import "package:flutter/material.dart";
import "package:todo_app_v1/core/theme/index.dart";
import "package:todo_app_v1/features/todo/domain/index.dart";
import "package:todo_app_v1/features/todo/widgets/todo_labels.dart";
import "package:todo_app_v1/l10n/app_localizations.dart";

/// 任务列表项：点击名称进详情，尾部菜单提供编辑 / 删除。
class TodoListItem extends StatelessWidget {
  const TodoListItem({
    super.key,
    required this.todo,
    required this.onTap,
    required this.onEdit,
    required this.onDelete,
  });

  final Todo todo;
  final VoidCallback onTap;
  final VoidCallback onEdit;
  final VoidCallback onDelete;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final l10n = AppLocalizations.of(context);
    final content = todo.content;

    return Card(
      child: ListTile(
        onTap: onTap,
        title: Text(todo.name, maxLines: 1, overflow: TextOverflow.ellipsis),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            if (content != null && content.isNotEmpty)
              Padding(
                padding: const EdgeInsets.only(bottom: WsyAppSpacing.xs),
                child: Text(
                  content,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            Row(
              spacing: WsyAppSpacing.xs,
              children: [
                _Tag(text: todo.type.label(l10n), color: _typeColor(theme)),
                _Tag(
                  text: todo.status.label(l10n),
                  color: theme.colorScheme.secondaryContainer,
                  onColor: theme.colorScheme.onSecondaryContainer,
                ),
              ],
            ),
          ],
        ),
        trailing: PopupMenuButton<_ItemAction>(
          onSelected: (action) => switch (action) {
            _ItemAction.edit => onEdit(),
            _ItemAction.delete => onDelete(),
          },
          itemBuilder: (context) => [
            PopupMenuItem(
              value: _ItemAction.edit,
              child: Text(l10n.todoActionEdit),
            ),
            PopupMenuItem(
              value: _ItemAction.delete,
              child: Text(l10n.todoActionDelete),
            ),
          ],
        ),
      ),
    );
  }

  /// 按类型区分标签底色：urgent→error，important→tertiary，其余→primary 容器色。
  Color _typeColor(ThemeData theme) => switch (todo.type) {
    TodoType.urgent => theme.colorScheme.errorContainer,
    TodoType.important => theme.colorScheme.tertiaryContainer,
    _ => theme.colorScheme.primaryContainer,
  };
}

enum _ItemAction { edit, delete }

/// 小标签：展示类型 / 状态。
class _Tag extends StatelessWidget {
  const _Tag({required this.text, required this.color, this.onColor});

  final String text;
  final Color color;
  final Color? onColor;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: WsyAppSpacing.sm,
        vertical: WsyAppSpacing.xxs,
      ),
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(WsyAppSpacing.xs),
      ),
      child: Text(
        text,
        style: theme.textTheme.labelSmall?.copyWith(color: onColor),
      ),
    );
  }
}
