// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'todo_list_request_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_TodoListRequestDto _$TodoListRequestDtoFromJson(Map<String, dynamic> json) =>
    _TodoListRequestDto(
      pageNumber: (json['pageNumber'] as num).toInt(),
      pageSize: (json['pageSize'] as num).toInt(),
      todoName: json['todoName'] as String?,
      todoType: $enumDecodeNullable(_$TodoTypeEnumMap, json['todoType']),
      todoStatus: $enumDecodeNullable(_$TodoStatusEnumMap, json['todoStatus']),
      sortBy: $enumDecodeNullable(_$TodoSortFieldEnumMap, json['sortBy']),
      sortOrder: $enumDecodeNullable(_$TodoSortOrderEnumMap, json['sortOrder']),
    );

Map<String, dynamic> _$TodoListRequestDtoToJson(_TodoListRequestDto instance) =>
    <String, dynamic>{
      'pageNumber': instance.pageNumber,
      'pageSize': instance.pageSize,
      'todoName': ?instance.todoName,
      'todoType': ?_$TodoTypeEnumMap[instance.todoType],
      'todoStatus': ?_$TodoStatusEnumMap[instance.todoStatus],
      'sortBy': ?_$TodoSortFieldEnumMap[instance.sortBy],
      'sortOrder': ?_$TodoSortOrderEnumMap[instance.sortOrder],
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

const _$TodoSortFieldEnumMap = {
  TodoSortField.createdAt: 'createdAt',
  TodoSortField.updatedAt: 'updatedAt',
  TodoSortField.type: 'type',
  TodoSortField.status: 'status',
};

const _$TodoSortOrderEnumMap = {
  TodoSortOrder.asc: 'asc',
  TodoSortOrder.desc: 'desc',
};
