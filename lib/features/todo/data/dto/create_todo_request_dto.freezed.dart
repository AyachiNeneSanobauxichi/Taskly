// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'create_todo_request_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$CreateTodoRequestDto {

 String get name; String get content; TodoType get type; TodoStatus get status;
/// Create a copy of CreateTodoRequestDto
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CreateTodoRequestDtoCopyWith<CreateTodoRequestDto> get copyWith => _$CreateTodoRequestDtoCopyWithImpl<CreateTodoRequestDto>(this as CreateTodoRequestDto, _$identity);

  /// Serializes this CreateTodoRequestDto to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CreateTodoRequestDto&&(identical(other.name, name) || other.name == name)&&(identical(other.content, content) || other.content == content)&&(identical(other.type, type) || other.type == type)&&(identical(other.status, status) || other.status == status));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,name,content,type,status);

@override
String toString() {
  return 'CreateTodoRequestDto(name: $name, content: $content, type: $type, status: $status)';
}


}

/// @nodoc
abstract mixin class $CreateTodoRequestDtoCopyWith<$Res>  {
  factory $CreateTodoRequestDtoCopyWith(CreateTodoRequestDto value, $Res Function(CreateTodoRequestDto) _then) = _$CreateTodoRequestDtoCopyWithImpl;
@useResult
$Res call({
 String name, String content, TodoType type, TodoStatus status
});




}
/// @nodoc
class _$CreateTodoRequestDtoCopyWithImpl<$Res>
    implements $CreateTodoRequestDtoCopyWith<$Res> {
  _$CreateTodoRequestDtoCopyWithImpl(this._self, this._then);

  final CreateTodoRequestDto _self;
  final $Res Function(CreateTodoRequestDto) _then;

/// Create a copy of CreateTodoRequestDto
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? name = null,Object? content = null,Object? type = null,Object? status = null,}) {
  return _then(_self.copyWith(
name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,content: null == content ? _self.content : content // ignore: cast_nullable_to_non_nullable
as String,type: null == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as TodoType,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as TodoStatus,
  ));
}

}


/// Adds pattern-matching-related methods to [CreateTodoRequestDto].
extension CreateTodoRequestDtoPatterns on CreateTodoRequestDto {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _CreateTodoRequestDto value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _CreateTodoRequestDto() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _CreateTodoRequestDto value)  $default,){
final _that = this;
switch (_that) {
case _CreateTodoRequestDto():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _CreateTodoRequestDto value)?  $default,){
final _that = this;
switch (_that) {
case _CreateTodoRequestDto() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String name,  String content,  TodoType type,  TodoStatus status)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _CreateTodoRequestDto() when $default != null:
return $default(_that.name,_that.content,_that.type,_that.status);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String name,  String content,  TodoType type,  TodoStatus status)  $default,) {final _that = this;
switch (_that) {
case _CreateTodoRequestDto():
return $default(_that.name,_that.content,_that.type,_that.status);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String name,  String content,  TodoType type,  TodoStatus status)?  $default,) {final _that = this;
switch (_that) {
case _CreateTodoRequestDto() when $default != null:
return $default(_that.name,_that.content,_that.type,_that.status);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _CreateTodoRequestDto implements CreateTodoRequestDto {
  const _CreateTodoRequestDto({required this.name, required this.content, required this.type, required this.status});
  factory _CreateTodoRequestDto.fromJson(Map<String, dynamic> json) => _$CreateTodoRequestDtoFromJson(json);

@override final  String name;
@override final  String content;
@override final  TodoType type;
@override final  TodoStatus status;

/// Create a copy of CreateTodoRequestDto
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$CreateTodoRequestDtoCopyWith<_CreateTodoRequestDto> get copyWith => __$CreateTodoRequestDtoCopyWithImpl<_CreateTodoRequestDto>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$CreateTodoRequestDtoToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _CreateTodoRequestDto&&(identical(other.name, name) || other.name == name)&&(identical(other.content, content) || other.content == content)&&(identical(other.type, type) || other.type == type)&&(identical(other.status, status) || other.status == status));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,name,content,type,status);

@override
String toString() {
  return 'CreateTodoRequestDto(name: $name, content: $content, type: $type, status: $status)';
}


}

/// @nodoc
abstract mixin class _$CreateTodoRequestDtoCopyWith<$Res> implements $CreateTodoRequestDtoCopyWith<$Res> {
  factory _$CreateTodoRequestDtoCopyWith(_CreateTodoRequestDto value, $Res Function(_CreateTodoRequestDto) _then) = __$CreateTodoRequestDtoCopyWithImpl;
@override @useResult
$Res call({
 String name, String content, TodoType type, TodoStatus status
});




}
/// @nodoc
class __$CreateTodoRequestDtoCopyWithImpl<$Res>
    implements _$CreateTodoRequestDtoCopyWith<$Res> {
  __$CreateTodoRequestDtoCopyWithImpl(this._self, this._then);

  final _CreateTodoRequestDto _self;
  final $Res Function(_CreateTodoRequestDto) _then;

/// Create a copy of CreateTodoRequestDto
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? name = null,Object? content = null,Object? type = null,Object? status = null,}) {
  return _then(_CreateTodoRequestDto(
name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,content: null == content ? _self.content : content // ignore: cast_nullable_to_non_nullable
as String,type: null == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as TodoType,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as TodoStatus,
  ));
}


}

// dart format on
