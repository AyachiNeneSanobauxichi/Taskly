import "package:flutter/material.dart";
import "package:todo_app_v1/core/theme/index.dart";

class WsyButton extends StatelessWidget {
  const WsyButton({
    super.key,
    required this.label,
    required this.onPressed,
    this.isLoading = false,
    this.isFullWidth = true,
  });

  final String label;
  final VoidCallback? onPressed;
  final bool isLoading;
  final bool isFullWidth;

  @override
  Widget build(BuildContext context) {
    final button = FilledButton(
      // loading 时置空 onPressed：既变灰禁用，又防止重复提交
      onPressed: isLoading ? null : onPressed,
      child: isLoading
          ? SizedBox(
              width: WsyAppSpacing.md,
              height: WsyAppSpacing.md,
              child: CircularProgressIndicator(
                strokeWidth: WsyAppSpacing.xxs,
                color: Theme.of(context).colorScheme.onPrimary,
              ),
            )
          : Text(label),
    );

    return isFullWidth
        ? SizedBox(width: double.infinity, child: button)
        : button;
  }
}
