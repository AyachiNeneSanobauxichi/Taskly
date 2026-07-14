import "package:flutter/material.dart";
import "package:todo_app_v1/core/theme/index.dart";
import "package:todo_app_v1/l10n/app_localizations.dart";

/// 任务名搜索框。受控组件：文本由外部 [controller] 持有，提交（键盘完成）时回调
/// [onSubmitted] 触发查询；清除按钮回调 [onCleared]。
class TodoSearchBar extends StatelessWidget {
  const TodoSearchBar({
    super.key,
    required this.controller,
    required this.onSubmitted,
    required this.onCleared,
  });

  final TextEditingController controller;
  final ValueChanged<String> onSubmitted;
  final VoidCallback onCleared;

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    return TextField(
      controller: controller,
      textInputAction: TextInputAction.search,
      onSubmitted: onSubmitted,
      decoration: InputDecoration(
        hintText: l10n.todoSearchHint,
        prefixIcon: const Icon(Icons.search),
        // 有内容时显示清除按钮。用 ValueListenableBuilder 随输入实时切换。
        suffixIcon: ValueListenableBuilder<TextEditingValue>(
          valueListenable: controller,
          builder: (context, value, _) => value.text.isEmpty
              ? const SizedBox.shrink()
              : IconButton(
                  icon: const Icon(Icons.clear),
                  onPressed: () {
                    controller.clear();
                    onCleared();
                  },
                ),
        ),
        isDense: true,
        contentPadding: const EdgeInsets.symmetric(
          vertical: WsyAppSpacing.sm,
          horizontal: WsyAppSpacing.md,
        ),
      ),
    );
  }
}
