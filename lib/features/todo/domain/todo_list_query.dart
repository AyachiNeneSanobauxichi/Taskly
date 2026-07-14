import "package:freezed_annotation/freezed_annotation.dart";
import "package:todo_app_v1/features/todo/domain/todo_enums.dart";

part "todo_list_query.freezed.dart";

/// 任务列表查询条件（领域值对象）。分页必填、筛选与排序可选（为空即不施加）。
/// Repository 负责把它映射成列表请求 DTO；page/controller 层持有并按交互更新它。
@freezed
abstract class TodoListQuery with _$TodoListQuery {
  const factory TodoListQuery({
    @Default(1) int pageNumber,
    @Default(10) int pageSize,
    String? name,
    TodoType? type,
    TodoStatus? status,
    TodoSortField? sortField,
    TodoSortOrder? sortOrder,
  }) = _TodoListQuery;
}
