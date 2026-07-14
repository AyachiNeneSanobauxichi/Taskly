import "package:freezed_annotation/freezed_annotation.dart";
import "package:todo_app_v1/features/todo/domain/todo_enums.dart";

part "todo.freezed.dart";

/// 任务领域实体（v1）。
///
/// [content] 可空：按契约列表接口（`/todo/todo-list`）不返回 content，
/// 仅创建 / 详情 / 更新接口返回；故建模为可空以覆盖两种来源。
@freezed
abstract class Todo with _$Todo {
  const factory Todo({
    required String id,
    required String name,
    String? content,
    required TodoType type,
    required TodoStatus status,
    required String userId,
    required DateTime createdAt,
    required DateTime updatedAt,
  }) = _Todo;
}
