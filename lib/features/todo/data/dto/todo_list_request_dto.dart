import "package:freezed_annotation/freezed_annotation.dart";
import "package:todo_app_v1/features/todo/domain/index.dart";

part "todo_list_request_dto.freezed.dart";
part "todo_list_request_dto.g.dart";

/// `POST /todo/todo-list` 请求体。分页必填，筛选 / 排序可选（为空则不下发）。
@freezed
abstract class TodoListRequestDto with _$TodoListRequestDto {
  const factory TodoListRequestDto({
    required int pageNumber,
    required int pageSize,
    @JsonKey(includeIfNull: false) String? todoName,
    @JsonKey(includeIfNull: false) TodoType? todoType,
    @JsonKey(includeIfNull: false) TodoStatus? todoStatus,
    @JsonKey(includeIfNull: false) TodoSortField? sortBy,
    @JsonKey(includeIfNull: false) TodoSortOrder? sortOrder,
  }) = _TodoListRequestDto;

  factory TodoListRequestDto.fromJson(Map<String, dynamic> json) =>
      _$TodoListRequestDtoFromJson(json);
}
