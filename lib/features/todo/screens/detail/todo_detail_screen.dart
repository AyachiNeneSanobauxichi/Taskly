import "package:flutter/material.dart";
import "package:flutter_riverpod/flutter_riverpod.dart";
import "package:skeletonizer/skeletonizer.dart";
import "package:todo_app_v1/core/theme/index.dart";
import "package:todo_app_v1/features/todo/controllers/index.dart";
import "package:todo_app_v1/features/todo/domain/index.dart";
import "package:todo_app_v1/features/todo/widgets/index.dart";
import "package:todo_app_v1/l10n/app_localizations.dart";

/// 任务详情页：展示单条任务，支持通过底部弹层编辑。编辑成功后详情缓存被
/// 失效（见 TodoListController.save），本页 `watch` 自动重取刷新。
class TodoDetailScreen extends ConsumerWidget {
  const TodoDetailScreen({super.key, required this.id});

  final String id;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = AppLocalizations.of(context);
    final detail = ref.watch(todoDetailProvider(id));
    final todo = detail.value;

    return Scaffold(
      appBar: AppBar(title: Text(l10n.todoDetailTitle)),
      body: _buildBody(context, ref, detail),
      // 仅在数据就绪时提供编辑入口（纯图标按钮）。
      floatingActionButton: todo == null
          ? null
          : FloatingActionButton(
              onPressed: () => showTodoEditSheet(context, todo: todo),
              tooltip: l10n.todoActionEdit,
              child: const Icon(Icons.edit),
            ),
    );
  }

  Widget _buildBody(
    BuildContext context,
    WidgetRef ref,
    AsyncValue<Todo> detail,
  ) {
    final l10n = AppLocalizations.of(context);

    // 加载中：骨架屏。占位数据喂给同一套 _DetailBody，骨架形状自动贴合真实布局。
    if (detail.isLoading) {
      return Skeletonizer(child: _DetailBody(todo: _placeholderTodo()));
    }
    if (detail.hasError) {
      return Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          spacing: WsyAppSpacing.md,
          children: [
            Text(l10n.todoLoadError),
            FilledButton(
              onPressed: () => ref.invalidate(todoDetailProvider(id)),
              child: Text(l10n.commonRetry),
            ),
          ],
        ),
      );
    }
    return _DetailBody(todo: detail.requireValue);
  }
}

/// 骨架屏占位数据：文本会被 Skeletonizer 遮成骨架条，只需保证有内容撑起布局。
Todo _placeholderTodo() => Todo(
  id: "",
  name: "Placeholder task name",
  content: "Placeholder content line used only to size the skeleton.",
  userId: "",
  type: TodoType.normal,
  status: TodoStatus.pending,
  createdAt: DateTime(2020),
  updatedAt: DateTime(2020),
);

class _DetailBody extends StatelessWidget {
  const _DetailBody({required this.todo});

  final Todo todo;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final l10n = AppLocalizations.of(context);
    final materialL10n = MaterialLocalizations.of(context);
    final content = todo.content;

    return SingleChildScrollView(
      padding: const EdgeInsets.all(WsyAppSpacing.md),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        spacing: WsyAppSpacing.md,
        children: [
          Text(todo.name, style: theme.textTheme.headlineSmall),
          Row(
            spacing: WsyAppSpacing.sm,
            children: [
              todoTypeBadge(context, todo.type),
              todoStatusBadge(context, todo.status),
            ],
          ),
          if (content != null && content.isNotEmpty)
            _Field(label: l10n.todoFieldContent, value: content),
          _Field(
            label: l10n.todoDetailCreatedAt,
            value: materialL10n.formatMediumDate(todo.createdAt.toLocal()),
          ),
          _Field(
            label: l10n.todoDetailUpdatedAt,
            value: materialL10n.formatMediumDate(todo.updatedAt.toLocal()),
          ),
        ],
      ),
    );
  }
}

/// 详情字段：标签 + 值。
class _Field extends StatelessWidget {
  const _Field({required this.label, required this.value});

  final String label;
  final String value;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      spacing: WsyAppSpacing.xxs,
      children: [
        Text(
          label,
          style: theme.textTheme.labelMedium?.copyWith(
            color: theme.colorScheme.onSurfaceVariant,
          ),
        ),
        Text(value, style: theme.textTheme.bodyLarge),
      ],
    );
  }
}
