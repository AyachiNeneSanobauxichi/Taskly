import "package:flutter/material.dart";
import "package:todo_app_v1/core/theme/index.dart";
import "package:todo_app_v1/features/todo/domain/index.dart";
import "package:todo_app_v1/features/todo/widgets/todo_visuals.dart";
import "package:todo_app_v1/l10n/app_localizations.dart";

/// 任务列表项：类型头像 + 名称/内容/状态徽章，点击名称进详情，尾部菜单编辑 / 删除。
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
    final content = todo.content;

    return Card(
      clipBehavior: Clip.hardEdge,
      margin: const EdgeInsets.only(bottom: WsyAppSpacing.sm),
      child: InkWell(
        onTap: onTap,
        child: Padding(
          padding: const EdgeInsets.all(WsyAppSpacing.md),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            spacing: WsyAppSpacing.md,
            children: [
              TodoTypeAvatar(type: todo.type),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  spacing: WsyAppSpacing.xxs,
                  children: [
                    Text(
                      todo.name,
                      style: theme.textTheme.titleMedium?.copyWith(
                        fontWeight: FontWeight.w600,
                      ),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                    if (content != null && content.isNotEmpty)
                      Text(
                        content,
                        style: theme.textTheme.bodySmall?.copyWith(
                          color: theme.colorScheme.onSurfaceVariant,
                        ),
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      ),
                    Padding(
                      padding: const EdgeInsets.only(top: WsyAppSpacing.xs),
                      child: todoStatusBadge(context, todo.status),
                    ),
                  ],
                ),
              ),
              _MoreMenu(onEdit: onEdit, onDelete: onDelete),
            ],
          ),
        ),
      ),
    );
  }
}

enum _ItemAction { edit, delete }

/// 编辑 / 删除菜单（删除项以 error 色强调）。
class _MoreMenu extends StatelessWidget {
  const _MoreMenu({required this.onEdit, required this.onDelete});

  final VoidCallback onEdit;
  final VoidCallback onDelete;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final l10n = AppLocalizations.of(context);
    return PopupMenuButton<_ItemAction>(
      icon: const Icon(Icons.more_vert),
      onSelected: (action) => switch (action) {
        _ItemAction.edit => onEdit(),
        _ItemAction.delete => onDelete(),
      },
      itemBuilder: (context) => [
        PopupMenuItem(
          value: _ItemAction.edit,
          child: Row(
            spacing: WsyAppSpacing.sm,
            children: [
              const Icon(Icons.edit_outlined),
              Text(l10n.todoActionEdit),
            ],
          ),
        ),
        PopupMenuItem(
          value: _ItemAction.delete,
          child: Row(
            spacing: WsyAppSpacing.sm,
            children: [
              Icon(Icons.delete_outline, color: theme.colorScheme.error),
              Text(
                l10n.todoActionDelete,
                style: theme.textTheme.bodyLarge?.copyWith(
                  color: theme.colorScheme.error,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
