// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'todo_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$TodoDto {

@JsonKey(name: "_id") String get id; String get name;// 列表条目不返回 content，故可空（见 Todo 实体说明）。
 String? get content; TodoType get type; TodoStatus get status; String get userId; DateTime get createdAt; DateTime get updatedAt;
/// Create a copy of TodoDto
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$TodoDtoCopyWith<TodoDto> get copyWith => _$TodoDtoCopyWithImpl<TodoDto>(this as TodoDto, _$identity);

  /// Serializes this TodoDto to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is TodoDto&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.content, content) || other.content == content)&&(identical(other.type, type) || other.type == type)&&(identical(other.status, status) || other.status == status)&&(identical(other.userId, userId) || other.userId == userId)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,name,content,type,status,userId,createdAt,updatedAt);

@override
String toString() {
  return 'TodoDto(id: $id, name: $name, content: $content, type: $type, status: $status, userId: $userId, createdAt: $createdAt, updatedAt: $updatedAt)';
}


}

/// @nodoc
abstract mixin class $TodoDtoCopyWith<$Res>  {
  factory $TodoDtoCopyWith(TodoDto value, $Res Function(TodoDto) _then) = _$TodoDtoCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: "_id") String id, String name, String? content, TodoType type, TodoStatus status, String userId, DateTime createdAt, DateTime updatedAt
});




}
/// @nodoc
class _$TodoDtoCopyWithImpl<$Res>
    implements $TodoDtoCopyWith<$Res> {
  _$TodoDtoCopyWithImpl(this._self, this._then);

  final TodoDto _self;
  final $Res Function(TodoDto) _then;

/// Create a copy of TodoDto
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? name = null,Object? content = freezed,Object? type = null,Object? status = null,Object? userId = null,Object? createdAt = null,Object? updatedAt = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,content: freezed == content ? _self.content : content // ignore: cast_nullable_to_non_nullable
as String?,type: null == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as TodoType,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as TodoStatus,userId: null == userId ? _self.userId : userId // ignore: cast_nullable_to_non_nullable
as String,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime,updatedAt: null == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as DateTime,
  ));
}

}


/// Adds pattern-matching-related methods to [TodoDto].
extension TodoDtoPatterns on TodoDto {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _TodoDto value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _TodoDto() when $default != null:
return $default(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _TodoDto value)  $default,){
final _that = this;
switch (_that) {
case _TodoDto():
return $default(_that);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _TodoDto value)?  $default,){
final _that = this;
switch (_that) {
case _TodoDto() when $default != null:
return $default(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(name: "_id")  String id,  String name,  String? content,  TodoType type,  TodoStatus status,  String userId,  DateTime createdAt,  DateTime updatedAt)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _TodoDto() when $default != null:
return $default(_that.id,_that.name,_that.content,_that.type,_that.status,_that.userId,_that.createdAt,_that.updatedAt);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(name: "_id")  String id,  String name,  String? content,  TodoType type,  TodoStatus status,  String userId,  DateTime createdAt,  DateTime updatedAt)  $default,) {final _that = this;
switch (_that) {
case _TodoDto():
return $default(_that.id,_that.name,_that.content,_that.type,_that.status,_that.userId,_that.createdAt,_that.updatedAt);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(name: "_id")  String id,  String name,  String? content,  TodoType type,  TodoStatus status,  String userId,  DateTime createdAt,  DateTime updatedAt)?  $default,) {final _that = this;
switch (_that) {
case _TodoDto() when $default != null:
return $default(_that.id,_that.name,_that.content,_that.type,_that.status,_that.userId,_that.createdAt,_that.updatedAt);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _TodoDto extends TodoDto {
  const _TodoDto({@JsonKey(name: "_id") required this.id, required this.name, this.content, required this.type, required this.status, required this.userId, required this.createdAt, required this.updatedAt}): super._();
  factory _TodoDto.fromJson(Map<String, dynamic> json) => _$TodoDtoFromJson(json);

@override@JsonKey(name: "_id") final  String id;
@override final  String name;
// 列表条目不返回 content，故可空（见 Todo 实体说明）。
@override final  String? content;
@override final  TodoType type;
@override final  TodoStatus status;
@override final  String userId;
@override final  DateTime createdAt;
@override final  DateTime updatedAt;

/// Create a copy of TodoDto
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$TodoDtoCopyWith<_TodoDto> get copyWith => __$TodoDtoCopyWithImpl<_TodoDto>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$TodoDtoToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _TodoDto&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.content, content) || other.content == content)&&(identical(other.type, type) || other.type == type)&&(identical(other.status, status) || other.status == status)&&(identical(other.userId, userId) || other.userId == userId)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,name,content,type,status,userId,createdAt,updatedAt);

@override
String toString() {
  return 'TodoDto(id: $id, name: $name, content: $content, type: $type, status: $status, userId: $userId, createdAt: $createdAt, updatedAt: $updatedAt)';
}


}

/// @nodoc
abstract mixin class _$TodoDtoCopyWith<$Res> implements $TodoDtoCopyWith<$Res> {
  factory _$TodoDtoCopyWith(_TodoDto value, $Res Function(_TodoDto) _then) = __$TodoDtoCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: "_id") String id, String name, String? content, TodoType type, TodoStatus status, String userId, DateTime createdAt, DateTime updatedAt
});




}
/// @nodoc
class __$TodoDtoCopyWithImpl<$Res>
    implements _$TodoDtoCopyWith<$Res> {
  __$TodoDtoCopyWithImpl(this._self, this._then);

  final _TodoDto _self;
  final $Res Function(_TodoDto) _then;

/// Create a copy of TodoDto
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? name = null,Object? content = freezed,Object? type = null,Object? status = null,Object? userId = null,Object? createdAt = null,Object? updatedAt = null,}) {
  return _then(_TodoDto(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,content: freezed == content ? _self.content : content // ignore: cast_nullable_to_non_nullable
as String?,type: null == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as TodoType,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as TodoStatus,userId: null == userId ? _self.userId : userId // ignore: cast_nullable_to_non_nullable
as String,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime,updatedAt: null == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as DateTime,
  ));
}


}

// dart format on
