import "package:flutter/material.dart";
import "package:go_router/go_router.dart";
import "package:todo_app_v1/app/router/route_name.dart";
import "package:todo_app_v1/core/theme/index.dart";
import "package:todo_app_v1/l10n/app_localizations.dart";
import "package:todo_app_v1/shared/widgets/index.dart";

/// 首页占位（v1）：仅文字占位 + 一个返回登录的测试按钮。
/// TODO(todo): 接入任务列表后替换为真实首页 UI。
class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final l10n = AppLocalizations.of(context);

    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: WsyAppSpacing.md),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              spacing: WsyAppSpacing.md,
              children: [
                Text(l10n.homeTitle, style: theme.textTheme.headlineSmall),
                WsyButton(
                  label: l10n.homeBackToLogin,
                  onPressed: () => context.goNamed(RouteName.login),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
