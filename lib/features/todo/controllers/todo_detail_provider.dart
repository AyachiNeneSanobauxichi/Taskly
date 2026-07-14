import "package:flutter_riverpod/flutter_riverpod.dart";
import "package:todo_app_v1/features/todo/controllers/todo_providers.dart";
import "package:todo_app_v1/features/todo/domain/index.dart";

/// 单个任务详情。按 id 家族化：详情页读取它渲染；编辑成功后由列表控制器
/// `ref.invalidate(todoDetailProvider(id))` 触发重取，保证详情与列表一致。
final todoDetailProvider = FutureProvider.family<Todo, String>(
  (ref, id) => ref.watch(todoRepositoryProvider).detail(id),
);
