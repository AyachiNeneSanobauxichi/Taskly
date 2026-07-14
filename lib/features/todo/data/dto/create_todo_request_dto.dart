import "package:freezed_annotation/freezed_annotation.dart";
import "package:todo_app_v1/features/todo/domain/index.dart";

part "create_todo_request_dto.freezed.dart";
part "create_todo_request_dto.g.dart";

/// `POST /todo/create` 请求体。
@freezed
abstract class CreateTodoRequestDto with _$CreateTodoRequestDto {
  const factory CreateTodoRequestDto({
    required String name,
    required String content,
    required TodoType type,
    required TodoStatus status,
  }) = _CreateTodoRequestDto;

  factory CreateTodoRequestDto.fromJson(Map<String, dynamic> json) =>
      _$CreateTodoRequestDtoFromJson(json);
}
