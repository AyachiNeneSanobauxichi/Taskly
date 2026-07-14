import "package:go_router/go_router.dart";
import "package:todo_app_v1/app/router/route_name.dart";
import "package:todo_app_v1/app/splash_screen.dart";
import "package:todo_app_v1/features/auth/index.dart";
import "package:todo_app_v1/features/todo/index.dart";

/// 应用路由表：所有页面在此声明式注册。
final List<RouteBase> appRoutes = [
  GoRoute(
    name: RouteName.splash,
    path: RoutePath.splash,
    builder: (context, state) => const SplashScreen(),
  ),
  GoRoute(
    name: RouteName.login,
    path: RoutePath.login,
    builder: (context, state) => const LoginScreen(),
  ),
  GoRoute(
    name: RouteName.register,
    path: RoutePath.register,
    builder: (context, state) => const RegisterScreen(),
  ),
  GoRoute(
    name: RouteName.home,
    path: RoutePath.home,
    builder: (context, state) => const TodoListScreen(),
  ),
  GoRoute(
    name: RouteName.todoDetail,
    path: RoutePath.todoDetail,
    builder: (context, state) =>
        TodoDetailScreen(id: state.pathParameters["id"]!),
  ),
];
