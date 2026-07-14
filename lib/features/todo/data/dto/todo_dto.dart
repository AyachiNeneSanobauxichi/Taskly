import "package:freezed_annotation/freezed_annotation.dart";
import "package:todo_app_v1/features/todo/domain/index.dart";

part "todo_dto.freezed.dart";
part "todo_dto.g.dart";

/// 任务响应 DTO（信封解包后的 `data`，或列表 `docs` 中的一项）。
/// 后端主键字段名为 `_id`，映射为领域侧的 [id]。
@freezed
abstract class TodoDto with _$TodoDto {
  const TodoDto._();

  const factory TodoDto({
    @JsonKey(name: "_id") required String id,
    required String name,
    // 列表条目不返回 content，故可空（见 Todo 实体说明）。
    String? content,
    required TodoType type,
    required TodoStatus status,
    required String userId,
    required DateTime createdAt,
    required DateTime updatedAt,
  }) = _TodoDto;

  factory TodoDto.fromJson(Map<String, dynamic> json) =>
      _$TodoDtoFromJson(json);

  Todo toEntity() => Todo(
    id: id,
    name: name,
    content: content,
    type: type,
    status: status,
    userId: userId,
    createdAt: createdAt,
    updatedAt: updatedAt,
  );
}
