import "package:flutter/material.dart";
import "package:go_router/go_router.dart";
import "package:todo_app_v1/app/router/route_guard.dart";
import "package:todo_app_v1/app/router/route_name.dart";
import "package:todo_app_v1/app/router/routes.dart";
import "package:todo_app_v1/l10n/app_localizations.dart";

/// 应用路由器（v1）。
///
/// 暂用顶层实例：v1 无鉴权状态需要监听。
/// TODO(auth): 接入 auth 后改为 @riverpod provider（watch authController），
/// 用 refreshListenable 驱动 [guardRedirect] 重定向。
final GoRouter appRouter = GoRouter(
  initialLocation: RoutePath.login,
  routes: appRoutes,
  redirect: (context, state) => guardRedirect(state),
  errorBuilder: (context, state) => const _RouteErrorScreen(),
);

/// 未知路由的兜底页面。
class _RouteErrorScreen extends StatelessWidget {
  const _RouteErrorScreen();

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    return Scaffold(body: Center(child: Text(l10n.routeNotFound)));
  }
}
