import "package:flutter_riverpod/flutter_riverpod.dart";
import "package:todo_app_v1/core/providers/index.dart";
import "package:todo_app_v1/features/todo/data/index.dart";

/// Todo 仓库 DI：组装 DataSource（依赖全局 DioClient）。与 authRepositoryProvider 同构。
final todoRepositoryProvider = Provider<TodoRepository>(
  (ref) => TodoRepository(TodoRemoteDataSource(ref.watch(dioClientProvider))),
);
