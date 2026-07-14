// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'create_todo_request_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_CreateTodoRequestDto _$CreateTodoRequestDtoFromJson(
  Map<String, dynamic> json,
) => _CreateTodoRequestDto(
  name: json['name'] as String,
  content: json['content'] as String,
  type: $enumDecode(_$TodoTypeEnumMap, json['type']),
  status: $enumDecode(_$TodoStatusEnumMap, json['status']),
);

Map<String, dynamic> _$CreateTodoRequestDtoToJson(
  _CreateTodoRequestDto instance,
) => <String, dynamic>{
  'name': instance.name,
  'content': instance.content,
  'type': _$TodoTypeEnumMap[instance.type],
  'status': _$TodoStatusEnumMap[instance.status],
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
