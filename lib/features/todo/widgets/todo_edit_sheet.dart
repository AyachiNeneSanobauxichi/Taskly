import "package:flutter/material.dart";
import "package:flutter_riverpod/flutter_riverpod.dart";
import "package:form_builder_validators/form_builder_validators.dart";
import "package:todo_app_v1/core/error/index.dart";
import "package:todo_app_v1/core/theme/index.dart";
import "package:todo_app_v1/features/todo/controllers/index.dart";
import "package:todo_app_v1/features/todo/domain/index.dart";
import "package:todo_app_v1/features/todo/widgets/todo_labels.dart";
import "package:todo_app_v1/l10n/app_localizations.dart";
import "package:todo_app_v1/shared/widgets/index.dart";

/// 打开编辑任务的底部弹层。返回 `true` 表示保存成功（调用方据此提示 / 刷新）。
Future<bool?> showTodoEditSheet(BuildContext context, Todo todo) {
  return showModalBottomSheet<bool>(
    context: context,
    isScrollControlled: true, // 配合键盘顶起
    showDragHandle: true,
    builder: (_) => _TodoEditSheet(todo: todo),
  );
}

class _TodoEditSheet extends ConsumerStatefulWidget {
  const _TodoEditSheet({required this.todo});

  final Todo todo;

  @override
  ConsumerState<_TodoEditSheet> createState() => _TodoEditSheetState();
}

class _TodoEditSheetState extends ConsumerState<_TodoEditSheet> {
  final _formKey = GlobalKey<FormState>();
  late final TextEditingController _nameController;
  late final TextEditingController _contentController;
  late TodoType _type;
  late TodoStatus _status;

  bool _isSaving = false;

  @override
  void initState() {
    super.initState();
    _nameController = TextEditingController(text: widget.todo.name);
    _contentController = TextEditingController(text: widget.todo.content ?? "");
    // 下拉值必须落在可选项内：非常规枚举（unknown/deleted）回落到默认项。
    _type = kSelectableTodoTypes.contains(widget.todo.type)
        ? widget.todo.type
        : TodoType.normal;
    _status = kSelectableTodoStatuses.contains(widget.todo.status)
        ? widget.todo.status
        : TodoStatus.pending;
  }

  @override
  void dispose() {
    _nameController.dispose();
    _contentController.dispose();
    super.dispose();
  }

  Future<void> _onSave() async {
    if (!_formKey.currentState!.validate()) return;

    // 跨 await 前捕获依赖 context 的对象。
    final l10n = AppLocalizations.of(context);
    final messenger = ScaffoldMessenger.of(context);
    final navigator = Navigator.of(context);

    setState(() => _isSaving = true);
    try {
      await ref
          .read(todoListControllerProvider.notifier)
          .save(
            id: widget.todo.id,
            name: _nameController.text.trim(),
            content: _contentController.text.trim(),
            type: _type,
            status: _status,
          );
      messenger
        ..hideCurrentSnackBar()
        ..showSnackBar(SnackBar(content: Text(l10n.todoSaveSuccess)));
      navigator.pop(true);
    } on Object catch (e) {
      if (!mounted) return;
      final msg = e is Failure ? e.displayMessage : l10n.todoLoadError;
      messenger
        ..hideCurrentSnackBar()
        ..showSnackBar(SnackBar(content: Text(msg)));
    } finally {
      if (mounted) setState(() => _isSaving = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final l10n = AppLocalizations.of(context);

    return Padding(
      // 顶起以避开键盘。
      padding: EdgeInsets.only(
        left: WsyAppSpacing.md,
        right: WsyAppSpacing.md,
        bottom: MediaQuery.of(context).viewInsets.bottom + WsyAppSpacing.md,
        top: WsyAppSpacing.sm,
      ),
      child: Form(
        key: _formKey,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          spacing: WsyAppSpacing.md,
          children: [
            Text(l10n.todoEditTitle, style: theme.textTheme.titleLarge),
            TextFormField(
              controller: _nameController,
              decoration: InputDecoration(labelText: l10n.todoFieldName),
              validator: FormBuilderValidators.required(),
            ),
            TextFormField(
              controller: _contentController,
              decoration: InputDecoration(labelText: l10n.todoFieldContent),
              minLines: 2,
              maxLines: 4,
              validator: FormBuilderValidators.required(),
            ),
            DropdownButtonFormField<TodoType>(
              initialValue: _type,
              decoration: InputDecoration(labelText: l10n.todoFieldType),
              items: [
                for (final t in kSelectableTodoTypes)
                  DropdownMenuItem(value: t, child: Text(t.label(l10n))),
              ],
              onChanged: (v) => setState(() => _type = v ?? _type),
            ),
            DropdownButtonFormField<TodoStatus>(
              initialValue: _status,
              decoration: InputDecoration(labelText: l10n.todoFieldStatus),
              items: [
                for (final s in kSelectableTodoStatuses)
                  DropdownMenuItem(value: s, child: Text(s.label(l10n))),
              ],
              onChanged: (v) => setState(() => _status = v ?? _status),
            ),
            WsyButton(
              label: l10n.commonSave,
              onPressed: _onSave,
              isLoading: _isSaving,
            ),
          ],
        ),
      ),
    );
  }
}
