import "package:flutter/material.dart";
import "package:todo_app_v1/core/theme/index.dart";
import "package:todo_app_v1/features/todo/domain/index.dart";
import "package:todo_app_v1/features/todo/widgets/todo_labels.dart";
import "package:todo_app_v1/l10n/app_localizations.dart";

/// Todo 视觉元素（类型头像 + 类型/状态彩色徽章），列表页与详情页共用，
/// 保证同一语义在两处配色一致。颜色一律取自 [ColorScheme]，不硬编码。

/// (底色, 前景色) 二元组。
({Color bg, Color fg}) _typeColors(ColorScheme scheme, TodoType type) =>
    switch (type) {
      TodoType.urgent => (
        bg: scheme.errorContainer,
        fg: scheme.onErrorContainer,
      ),
      TodoType.important => (
        bg: scheme.tertiaryContainer,
        fg: scheme.onTertiaryContainer,
      ),
      _ => (bg: scheme.primaryContainer, fg: scheme.onPrimaryContainer),
    };

({Color bg, Color fg}) _statusColors(ColorScheme scheme, TodoStatus status) =>
    switch (status) {
      TodoStatus.doing => (
        bg: scheme.primaryContainer,
        fg: scheme.onPrimaryContainer,
      ),
      TodoStatus.completed => (
        bg: scheme.secondaryContainer,
        fg: scheme.onSecondaryContainer,
      ),
      _ => (bg: scheme.surfaceContainerHighest, fg: scheme.onSurfaceVariant),
    };

/// 圆形类型头像：底色 + 图标随类型变化。
class TodoTypeAvatar extends StatelessWidget {
  const TodoTypeAvatar({super.key, required this.type});

  final TodoType type;

  @override
  Widget build(BuildContext context) {
    final colors = _typeColors(Theme.of(context).colorScheme, type);
    return Container(
      width: WsyAppSpacing.xl,
      height: WsyAppSpacing.xl,
      decoration: BoxDecoration(color: colors.bg, shape: BoxShape.circle),
      // 所有 item 统一图标；类型区分交给底色。
      child: Icon(Icons.check_circle_outline, color: colors.fg),
    );
  }
}

/// 彩色小徽章。
class TodoBadge extends StatelessWidget {
  const TodoBadge({
    super.key,
    required this.text,
    required this.bg,
    required this.fg,
  });

  final String text;
  final Color bg;
  final Color fg;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: WsyAppSpacing.sm,
        vertical: WsyAppSpacing.xxs,
      ),
      decoration: BoxDecoration(
        color: bg,
        borderRadius: BorderRadius.circular(WsyAppSpacing.xs),
      ),
      child: Text(text, style: theme.textTheme.labelSmall?.copyWith(color: fg)),
    );
  }
}

/// 类型徽章（文案 + 配色）。
TodoBadge todoTypeBadge(BuildContext context, TodoType type) {
  final l10n = AppLocalizations.of(context);
  final colors = _typeColors(Theme.of(context).colorScheme, type);
  return TodoBadge(text: type.label(l10n), bg: colors.bg, fg: colors.fg);
}

/// 状态徽章（文案 + 配色）。
TodoBadge todoStatusBadge(BuildContext context, TodoStatus status) {
  final l10n = AppLocalizations.of(context);
  final colors = _statusColors(Theme.of(context).colorScheme, status);
  return TodoBadge(text: status.label(l10n), bg: colors.bg, fg: colors.fg);
}
