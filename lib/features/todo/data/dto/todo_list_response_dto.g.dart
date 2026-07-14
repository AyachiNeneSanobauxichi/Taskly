// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'todo_list_response_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_TodoListResponseDto _$TodoListResponseDtoFromJson(Map<String, dynamic> json) =>
    _TodoListResponseDto(
      docs: (json['docs'] as List<dynamic>)
          .map((e) => TodoDto.fromJson(e as Map<String, dynamic>))
          .toList(),
      totalDocs: (json['totalDocs'] as num).toInt(),
      limit: (json['limit'] as num).toInt(),
      totalPages: (json['totalPages'] as num).toInt(),
      page: (json['page'] as num).toInt(),
      pagingCounter: (json['pagingCounter'] as num).toInt(),
      hasPrevPage: json['hasPrevPage'] as bool,
      hasNextPage: json['hasNextPage'] as bool,
      prevPage: (json['prevPage'] as num?)?.toInt(),
      nextPage: (json['nextPage'] as num?)?.toInt(),
    );

Map<String, dynamic> _$TodoListResponseDtoToJson(
  _TodoListResponseDto instance,
) => <String, dynamic>{
  'docs': instance.docs,
  'totalDocs': instance.totalDocs,
  'limit': instance.limit,
  'totalPages': instance.totalPages,
  'page': instance.page,
  'pagingCounter': instance.pagingCounter,
  'hasPrevPage': instance.hasPrevPage,
  'hasNextPage': instance.hasNextPage,
  'prevPage': instance.prevPage,
  'nextPage': instance.nextPage,
};
