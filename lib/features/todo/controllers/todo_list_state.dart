import "package:freezed_annotation/freezed_annotation.dart";
import "package:todo_app_v1/features/todo/domain/index.dart";

part "todo_list_state.freezed.dart";

/// 任务列表页状态：已加载条目 + 当前查询条件 + 分页游标。
///
/// [query] 里的 `pageNumber` 表示**已加载到的最后一页**；[hasNextPage] 由后端分页
/// 信封给出，决定能否继续上拉加载；[isLoadingMore] 防抖上拉的重复触发。
@freezed
abstract class TodoListState with _$TodoListState {
  const factory TodoListState({
    required List<Todo> items,
    required TodoListQuery query,
    required bool hasNextPage,
    @Default(false) bool isLoadingMore,
  }) = _TodoListState;
}
