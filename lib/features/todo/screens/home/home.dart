import "package:flutter/material.dart";
import "package:flutter_riverpod/flutter_riverpod.dart";
import "package:todo_app_v1/core/error/index.dart";
import "package:todo_app_v1/core/theme/index.dart";
import "package:todo_app_v1/features/auth/index.dart";
import "package:todo_app_v1/l10n/app_localizations.dart";
import "package:todo_app_v1/shared/widgets/index.dart";

/// 首页占位（v1）：仅文字占位 + 一个登出按钮。
/// TODO(todo): 接入任务列表后替换为真实首页 UI。
class HomeScreen extends ConsumerStatefulWidget {
  const HomeScreen({super.key});

  @override
  ConsumerState<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends ConsumerState<HomeScreen> {
  // 登出进行中的本地标记（控制按钮 loading）。登出成功后全局登录态翻转，
  // 路由守卫依据未登录态自动跳回登录页，故此处不手动 goNamed。
  bool _isLoggingOut = false;

  Future<void> _onLogout() async {
    // 跨 await 前先捕获依赖 context 的对象，避免 async gap 后再读 context。
    final l10n = AppLocalizations.of(context);
    final messenger = ScaffoldMessenger.of(context);

    setState(() => _isLoggingOut = true);
    try {
      // 登出：调 logout 接口 + 清本地会话；成功后路由守卫自动跳回登录页。
      await ref.read(authControllerProvider.notifier).logout();
    } on Object catch (e) {
      if (!mounted) return;
      final msg = e is Failure ? e.displayMessage : l10n.authErrorGeneric;
      messenger
        ..hideCurrentSnackBar()
        ..showSnackBar(SnackBar(content: Text(msg)));
    } finally {
      if (mounted) setState(() => _isLoggingOut = false);
    }
  }

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
                  onPressed: _onLogout,
                  isLoading: _isLoggingOut,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
