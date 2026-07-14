import "package:freezed_annotation/freezed_annotation.dart";
import "package:todo_app_v1/features/todo/data/dto/todo_dto.dart";
import "package:todo_app_v1/features/todo/domain/index.dart";

part "todo_list_response_dto.freezed.dart";
part "todo_list_response_dto.g.dart";

/// `POST /todo/todo-list` 响应体（信封解包后的 `data`）：分页信封 + 条目列表。
@freezed
abstract class TodoListResponseDto with _$TodoListResponseDto {
  const TodoListResponseDto._();

  const factory TodoListResponseDto({
    required List<TodoDto> docs,
    required int totalDocs,
    required int limit,
    required int totalPages,
    required int page,
    required int pagingCounter,
    required bool hasPrevPage,
    required bool hasNextPage,
    int? prevPage,
    int? nextPage,
  }) = _TodoListResponseDto;

  factory TodoListResponseDto.fromJson(Map<String, dynamic> json) =>
      _$TodoListResponseDtoFromJson(json);

  TodoPage toEntity() => TodoPage(
    items: docs.map((e) => e.toEntity()).toList(),
    totalDocs: totalDocs,
    limit: limit,
    totalPages: totalPages,
    page: page,
    pagingCounter: pagingCounter,
    hasPrevPage: hasPrevPage,
    hasNextPage: hasNextPage,
    prevPage: prevPage,
    nextPage: nextPage,
  );
}
