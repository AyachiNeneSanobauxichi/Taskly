// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'update_todo_request_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_UpdateTodoRequestDto _$UpdateTodoRequestDtoFromJson(
  Map<String, dynamic> json,
) => _UpdateTodoRequestDto(
  id: json['id'] as String,
  name: json['name'] as String?,
  content: json['content'] as String?,
  type: $enumDecodeNullable(_$TodoTypeEnumMap, json['type']),
  status: $enumDecodeNullable(_$TodoStatusEnumMap, json['status']),
);

Map<String, dynamic> _$UpdateTodoRequestDtoToJson(
  _UpdateTodoRequestDto instance,
) => <String, dynamic>{
  'id': instance.id,
  'name': ?instance.name,
  'content': ?instance.content,
  'type': ?_$TodoTypeEnumMap[instance.type],
  'status': ?_$TodoStatusEnumMap[instance.status],
};

const _$TodoTypeEnumMap = {
  TodoType.normal: 'normal',
  TodoType.important: 'important',
  TodoType.urgent: 'urgent',
  TodoType.unknown: null,
};

const _$TodoStatusEnumMap = {
  TodoStatus.pending: 'pending',
  TodoStatus.completed: 'completed',
  TodoStatus.doing: 'doing',
  TodoStatus.deleted: 'deleted',
  TodoStatus.unknown: null,
};
