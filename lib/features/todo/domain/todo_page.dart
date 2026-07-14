import "package:freezed_annotation/freezed_annotation.dart";
import "package:todo_app_v1/features/todo/domain/todo.dart";

part "todo_page.freezed.dart";

/// 分页后的任务列表领域结果（对应列表接口 data 的分页信封）。
@freezed
abstract class TodoPage with _$TodoPage {
  const factory TodoPage({
    required List<Todo> items,
    required int totalDocs,
    required int limit,
    required int totalPages,
    required int page,
    required int pagingCounter,
    required bool hasPrevPage,
    required bool hasNextPage,
    int? prevPage,
    int? nextPage,
  }) = _TodoPage;
}
