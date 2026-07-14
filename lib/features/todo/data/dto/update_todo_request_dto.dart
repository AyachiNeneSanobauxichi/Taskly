import "package:freezed_annotation/freezed_annotation.dart";
import "package:todo_app_v1/features/todo/domain/index.dart";

part "update_todo_request_dto.freezed.dart";
part "update_todo_request_dto.g.dart";

/// `PATCH /todo/update` 请求体。[id] 定位记录，其余字段部分更新：
/// 仅传需修改的字段，空字段不序列化（契约已确认为部分更新）。
@freezed
abstract class UpdateTodoRequestDto with _$UpdateTodoRequestDto {
  const factory UpdateTodoRequestDto({
    required String id,
    @JsonKey(includeIfNull: false) String? name,
    @JsonKey(includeIfNull: false) String? content,
    @JsonKey(includeIfNull: false) TodoType? type,
    @JsonKey(includeIfNull: false) TodoStatus? status,
  }) = _UpdateTodoRequestDto;

  factory UpdateTodoRequestDto.fromJson(Map<String, dynamic> json) =>
      _$UpdateTodoRequestDtoFromJson(json);
}
