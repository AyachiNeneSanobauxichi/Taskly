# todo_app_v1

A new Flutter project.

lib/
├── main.dart # 入口：加载 .env、初始化、runApp
├── app/ # 应用级装配（全局，非业务）
│ ├── app.dart # MaterialApp.router 根 Widget
│ ├── router/
│ │ ├── app_router.dart # go_router 配置（Provider 形式）
│ │ ├── routes.dart # 路由路径常量
│ │ └── route_guard.dart # 登录态重定向（redirect）
│ └── theme/
│ ├── app_theme.dart # ThemeData light/dark
│ └── app_colors.dart
│
├── core/ # 跨 feature 复用的底层能力（无业务）
│ ├── network/
│ │ ├── dio_client.dart # Dio 实例 + baseUrl + 拦截器装配
│ │ ├── interceptors/
│ │ │ ├── auth_interceptor.dart # 自动塞 token、401 刷新
│ │ │ └── error_interceptor.dart # Dio 异常 → AppException
│ │ └── api_result.dart # 统一返回包装（可选）
│ ├── error/
│ │ ├── app_exception.dart # 业务异常基类（freezed sealed）
│ │ └── failure.dart # domain 层用的 Failure
│ ├── storage/
│ │ └── secure_storage.dart # token 等敏感数据存储
│ ├── config/
│ │ └── env.dart # 读取 dotenv 的强类型封装
│ ├── constants/
│ ├── extensions/
│ ├── utils/
│ │ └── logger.dart # logger 封装
│ └── providers/
│ └── core_providers.dart # dio、storage 等全局 Provider
│
├── features/
│ ├── auth/
│ │ ├── data/
│ │ │ ├── datasources/
│ │ │ │ └── auth_remote_datasource.dart # 调 Dio，纯 API
│ │ │ ├── models/
│ │ │ │ └── user_dto.dart # freezed + json
│ │ │ └── repositories/
│ │ │ └── auth_repository_impl.dart # 实现 domain 接口
│ │ ├── domain/
│ │ │ ├── entities/
│ │ │ │ └── user.dart # 纯业务实体
│ │ │ ├── repositories/
│ │ │ │ └── auth_repository.dart # 抽象接口
│ │ │ └── usecases/
│ │ │ ├── login_usecase.dart
│ │ │ └── logout_usecase.dart
│ │ └── presentation/
│ │ ├── controllers/
│ │ │ └── auth_controller.dart # Riverpod Notifier
│ │ ├── screens/
│ │ │ └── login_screen.dart
│ │ └── widgets/
│ │
│ └── todo/
│ ├── data/
│ │ ├── datasources/
│ │ │ └── todo_remote_datasource.dart
│ │ ├── models/
│ │ │ └── todo_dto.dart
│ │ └── repositories/
│ │ └── todo_repository_impl.dart
│ ├── domain/
│ │ ├── entities/
│ │ │ └── todo.dart
│ │ ├── repositories/
│ │ │ └── todo_repository.dart
│ │ └── usecases/
│ │ ├── get_todos_usecase.dart
│ │ ├── add_todo_usecase.dart
│ │ └── toggle_todo_usecase.dart
│ └── presentation/
│ ├── controllers/
│ │ └── todo_list_controller.dart
│ ├── screens/
│ │ └── todo_list_screen.dart
│ └── widgets/
│ └── todo_item_tile.dart
│
└── shared/ # 跨 feature 复用的 UI(非底层)
└── widgets/
├── app_button.dart
├── loading_view.dart
└── error_view.dart
