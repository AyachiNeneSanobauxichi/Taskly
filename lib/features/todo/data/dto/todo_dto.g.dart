// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'todo_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_TodoDto _$TodoDtoFromJson(Map<String, dynamic> json) => _TodoDto(
  id: json['_id'] as String,
  name: json['name'] as String,
  content: json['content'] as String?,
  type: $enumDecode(_$TodoTypeEnumMap, json['type']),
  status: $enumDecode(_$TodoStatusEnumMap, json['status']),
  userId: json['userId'] as String,
  createdAt: DateTime.parse(json['createdAt'] as String),
  updatedAt: DateTime.parse(json['updatedAt'] as String),
);

Map<String, dynamic> _$TodoDtoToJson(_TodoDto instance) => <String, dynamic>{
  '_id': instance.id,
  'name': instance.name,
  'content': instance.content,
  'type': _$TodoTypeEnumMap[instance.type],
  'status': _$TodoStatusEnumMap[instance.status],
  'userId': instance.userId,
  'createdAt': instance.createdAt.toIso8601String(),
  'updatedAt': instance.updatedAt.toIso8601String(),
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
