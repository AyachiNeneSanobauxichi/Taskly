// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'update_todo_request_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$UpdateTodoRequestDto {

 String get id;@JsonKey(includeIfNull: false) String? get name;@JsonKey(includeIfNull: false) String? get content;@JsonKey(includeIfNull: false) TodoType? get type;@JsonKey(includeIfNull: false) TodoStatus? get status;
/// Create a copy of UpdateTodoRequestDto
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$UpdateTodoRequestDtoCopyWith<UpdateTodoRequestDto> get copyWith => _$UpdateTodoRequestDtoCopyWithImpl<UpdateTodoRequestDto>(this as UpdateTodoRequestDto, _$identity);

  /// Serializes this UpdateTodoRequestDto to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is UpdateTodoRequestDto&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.content, content) || other.content == content)&&(identical(other.type, type) || other.type == type)&&(identical(other.status, status) || other.status == status));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,name,content,type,status);

@override
String toString() {
  return 'UpdateTodoRequestDto(id: $id, name: $name, content: $content, type: $type, status: $status)';
}


}

/// @nodoc
abstract mixin class $UpdateTodoRequestDtoCopyWith<$Res>  {
  factory $UpdateTodoRequestDtoCopyWith(UpdateTodoRequestDto value, $Res Function(UpdateTodoRequestDto) _then) = _$UpdateTodoRequestDtoCopyWithImpl;
@useResult
$Res call({
 String id,@JsonKey(includeIfNull: false) String? name,@JsonKey(includeIfNull: false) String? content,@JsonKey(includeIfNull: false) TodoType? type,@JsonKey(includeIfNull: false) TodoStatus? status
});




}
/// @nodoc
class _$UpdateTodoRequestDtoCopyWithImpl<$Res>
    implements $UpdateTodoRequestDtoCopyWith<$Res> {
  _$UpdateTodoRequestDtoCopyWithImpl(this._self, this._then);

  final UpdateTodoRequestDto _self;
  final $Res Function(UpdateTodoRequestDto) _then;

/// Create a copy of UpdateTodoRequestDto
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? name = freezed,Object? content = freezed,Object? type = freezed,Object? status = freezed,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,name: freezed == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String?,content: freezed == content ? _self.content : content // ignore: cast_nullable_to_non_nullable
as String?,type: freezed == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as TodoType?,status: freezed == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as TodoStatus?,
  ));
}

}


/// Adds pattern-matching-related methods to [UpdateTodoRequestDto].
extension UpdateTodoRequestDtoPatterns on UpdateTodoRequestDto {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _UpdateTodoRequestDto value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _UpdateTodoRequestDto() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _UpdateTodoRequestDto value)  $default,){
final _that = this;
switch (_that) {
case _UpdateTodoRequestDto():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _UpdateTodoRequestDto value)?  $default,){
final _that = this;
switch (_that) {
case _UpdateTodoRequestDto() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id, @JsonKey(includeIfNull: false)  String? name, @JsonKey(includeIfNull: false)  String? content, @JsonKey(includeIfNull: false)  TodoType? type, @JsonKey(includeIfNull: false)  TodoStatus? status)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _UpdateTodoRequestDto() when $default != null:
return $default(_that.id,_that.name,_that.content,_that.type,_that.status);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id, @JsonKey(includeIfNull: false)  String? name, @JsonKey(includeIfNull: false)  String? content, @JsonKey(includeIfNull: false)  TodoType? type, @JsonKey(includeIfNull: false)  TodoStatus? status)  $default,) {final _that = this;
switch (_that) {
case _UpdateTodoRequestDto():
return $default(_that.id,_that.name,_that.content,_that.type,_that.status);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id, @JsonKey(includeIfNull: false)  String? name, @JsonKey(includeIfNull: false)  String? content, @JsonKey(includeIfNull: false)  TodoType? type, @JsonKey(includeIfNull: false)  TodoStatus? status)?  $default,) {final _that = this;
switch (_that) {
case _UpdateTodoRequestDto() when $default != null:
return $default(_that.id,_that.name,_that.content,_that.type,_that.status);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _UpdateTodoRequestDto implements UpdateTodoRequestDto {
  const _UpdateTodoRequestDto({required this.id, @JsonKey(includeIfNull: false) this.name, @JsonKey(includeIfNull: false) this.content, @JsonKey(includeIfNull: false) this.type, @JsonKey(includeIfNull: false) this.status});
  factory _UpdateTodoRequestDto.fromJson(Map<String, dynamic> json) => _$UpdateTodoRequestDtoFromJson(json);

@override final  String id;
@override@JsonKey(includeIfNull: false) final  String? name;
@override@JsonKey(includeIfNull: false) final  String? content;
@override@JsonKey(includeIfNull: false) final  TodoType? type;
@override@JsonKey(includeIfNull: false) final  TodoStatus? status;

/// Create a copy of UpdateTodoRequestDto
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$UpdateTodoRequestDtoCopyWith<_UpdateTodoRequestDto> get copyWith => __$UpdateTodoRequestDtoCopyWithImpl<_UpdateTodoRequestDto>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$UpdateTodoRequestDtoToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _UpdateTodoRequestDto&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.content, content) || other.content == content)&&(identical(other.type, type) || other.type == type)&&(identical(other.status, status) || other.status == status));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,name,content,type,status);

@override
String toString() {
  return 'UpdateTodoRequestDto(id: $id, name: $name, content: $content, type: $type, status: $status)';
}


}

/// @nodoc
abstract mixin class _$UpdateTodoRequestDtoCopyWith<$Res> implements $UpdateTodoRequestDtoCopyWith<$Res> {
  factory _$UpdateTodoRequestDtoCopyWith(_UpdateTodoRequestDto value, $Res Function(_UpdateTodoRequestDto) _then) = __$UpdateTodoRequestDtoCopyWithImpl;
@override @useResult
$Res call({
 String id,@JsonKey(includeIfNull: false) String? name,@JsonKey(includeIfNull: false) String? content,@JsonKey(includeIfNull: false) TodoType? type,@JsonKey(includeIfNull: false) TodoStatus? status
});




}
/// @nodoc
class __$UpdateTodoRequestDtoCopyWithImpl<$Res>
    implements _$UpdateTodoRequestDtoCopyWith<$Res> {
  __$UpdateTodoRequestDtoCopyWithImpl(this._self, this._then);

  final _UpdateTodoRequestDto _self;
  final $Res Function(_UpdateTodoRequestDto) _then;

/// Create a copy of UpdateTodoRequestDto
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? name = freezed,Object? content = freezed,Object? type = freezed,Object? status = freezed,}) {
  return _then(_UpdateTodoRequestDto(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,name: freezed == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String?,content: freezed == content ? _self.content : content // ignore: cast_nullable_to_non_nullable
as String?,type: freezed == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as TodoType?,status: freezed == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as TodoStatus?,
  ));
}


}

// dart format on
