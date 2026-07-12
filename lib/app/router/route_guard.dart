import "package:go_router/go_router.dart";

/// 鉴权守卫：集中处理登录态相关的重定向。
///
/// v1 暂无鉴权状态，一律放行（返回 null）。
/// TODO(auth): 接入 authController 后，未登录访问受保护路由重定向到 login，
/// 已登录访问 login/register 重定向到 home；届时把本函数改为接收 AuthState，
/// 并把 [appRouter] 改造为 @riverpod provider 以支持 refreshListenable。
String? guardRedirect(GoRouterState state) {
  return null;
}
