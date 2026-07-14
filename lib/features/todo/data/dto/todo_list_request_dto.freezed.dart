// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'todo_list_request_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$TodoListRequestDto {

 int get pageNumber; int get pageSize;@JsonKey(includeIfNull: false) String? get todoName;@JsonKey(includeIfNull: false) TodoType? get todoType;@JsonKey(includeIfNull: false) TodoStatus? get todoStatus;@JsonKey(includeIfNull: false) TodoSortField? get sortBy;@JsonKey(includeIfNull: false) TodoSortOrder? get sortOrder;
/// Create a copy of TodoListRequestDto
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$TodoListRequestDtoCopyWith<TodoListRequestDto> get copyWith => _$TodoListRequestDtoCopyWithImpl<TodoListRequestDto>(this as TodoListRequestDto, _$identity);

  /// Serializes this TodoListRequestDto to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is TodoListRequestDto&&(identical(other.pageNumber, pageNumber) || other.pageNumber == pageNumber)&&(identical(other.pageSize, pageSize) || other.pageSize == pageSize)&&(identical(other.todoName, todoName) || other.todoName == todoName)&&(identical(other.todoType, todoType) || other.todoType == todoType)&&(identical(other.todoStatus, todoStatus) || other.todoStatus == todoStatus)&&(identical(other.sortBy, sortBy) || other.sortBy == sortBy)&&(identical(other.sortOrder, sortOrder) || other.sortOrder == sortOrder));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,pageNumber,pageSize,todoName,todoType,todoStatus,sortBy,sortOrder);

@override
String toString() {
  return 'TodoListRequestDto(pageNumber: $pageNumber, pageSize: $pageSize, todoName: $todoName, todoType: $todoType, todoStatus: $todoStatus, sortBy: $sortBy, sortOrder: $sortOrder)';
}


}

/// @nodoc
abstract mixin class $TodoListRequestDtoCopyWith<$Res>  {
  factory $TodoListRequestDtoCopyWith(TodoListRequestDto value, $Res Function(TodoListRequestDto) _then) = _$TodoListRequestDtoCopyWithImpl;
@useResult
$Res call({
 int pageNumber, int pageSize,@JsonKey(includeIfNull: false) String? todoName,@JsonKey(includeIfNull: false) TodoType? todoType,@JsonKey(includeIfNull: false) TodoStatus? todoStatus,@JsonKey(includeIfNull: false) TodoSortField? sortBy,@JsonKey(includeIfNull: false) TodoSortOrder? sortOrder
});




}
/// @nodoc
class _$TodoListRequestDtoCopyWithImpl<$Res>
    implements $TodoListRequestDtoCopyWith<$Res> {
  _$TodoListRequestDtoCopyWithImpl(this._self, this._then);

  final TodoListRequestDto _self;
  final $Res Function(TodoListRequestDto) _then;

/// Create a copy of TodoListRequestDto
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? pageNumber = null,Object? pageSize = null,Object? todoName = freezed,Object? todoType = freezed,Object? todoStatus = freezed,Object? sortBy = freezed,Object? sortOrder = freezed,}) {
  return _then(_self.copyWith(
pageNumber: null == pageNumber ? _self.pageNumber : pageNumber // ignore: cast_nullable_to_non_nullable
as int,pageSize: null == pageSize ? _self.pageSize : pageSize // ignore: cast_nullable_to_non_nullable
as int,todoName: freezed == todoName ? _self.todoName : todoName // ignore: cast_nullable_to_non_nullable
as String?,todoType: freezed == todoType ? _self.todoType : todoType // ignore: cast_nullable_to_non_nullable
as TodoType?,todoStatus: freezed == todoStatus ? _self.todoStatus : todoStatus // ignore: cast_nullable_to_non_nullable
as TodoStatus?,sortBy: freezed == sortBy ? _self.sortBy : sortBy // ignore: cast_nullable_to_non_nullable
as TodoSortField?,sortOrder: freezed == sortOrder ? _self.sortOrder : sortOrder // ignore: cast_nullable_to_non_nullable
as TodoSortOrder?,
  ));
}

}


/// Adds pattern-matching-related methods to [TodoListRequestDto].
extension TodoListRequestDtoPatterns on TodoListRequestDto {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _TodoListRequestDto value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _TodoListRequestDto() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _TodoListRequestDto value)  $default,){
final _that = this;
switch (_that) {
case _TodoListRequestDto():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _TodoListRequestDto value)?  $default,){
final _that = this;
switch (_that) {
case _TodoListRequestDto() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int pageNumber,  int pageSize, @JsonKey(includeIfNull: false)  String? todoName, @JsonKey(includeIfNull: false)  TodoType? todoType, @JsonKey(includeIfNull: false)  TodoStatus? todoStatus, @JsonKey(includeIfNull: false)  TodoSortField? sortBy, @JsonKey(includeIfNull: false)  TodoSortOrder? sortOrder)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _TodoListRequestDto() when $default != null:
return $default(_that.pageNumber,_that.pageSize,_that.todoName,_that.todoType,_that.todoStatus,_that.sortBy,_that.sortOrder);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int pageNumber,  int pageSize, @JsonKey(includeIfNull: false)  String? todoName, @JsonKey(includeIfNull: false)  TodoType? todoType, @JsonKey(includeIfNull: false)  TodoStatus? todoStatus, @JsonKey(includeIfNull: false)  TodoSortField? sortBy, @JsonKey(includeIfNull: false)  TodoSortOrder? sortOrder)  $default,) {final _that = this;
switch (_that) {
case _TodoListRequestDto():
return $default(_that.pageNumber,_that.pageSize,_that.todoName,_that.todoType,_that.todoStatus,_that.sortBy,_that.sortOrder);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int pageNumber,  int pageSize, @JsonKey(includeIfNull: false)  String? todoName, @JsonKey(includeIfNull: false)  TodoType? todoType, @JsonKey(includeIfNull: false)  TodoStatus? todoStatus, @JsonKey(includeIfNull: false)  TodoSortField? sortBy, @JsonKey(includeIfNull: false)  TodoSortOrder? sortOrder)?  $default,) {final _that = this;
switch (_that) {
case _TodoListRequestDto() when $default != null:
return $default(_that.pageNumber,_that.pageSize,_that.todoName,_that.todoType,_that.todoStatus,_that.sortBy,_that.sortOrder);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _TodoListRequestDto implements TodoListRequestDto {
  const _TodoListRequestDto({required this.pageNumber, required this.pageSize, @JsonKey(includeIfNull: false) this.todoName, @JsonKey(includeIfNull: false) this.todoType, @JsonKey(includeIfNull: false) this.todoStatus, @JsonKey(includeIfNull: false) this.sortBy, @JsonKey(includeIfNull: false) this.sortOrder});
  factory _TodoListRequestDto.fromJson(Map<String, dynamic> json) => _$TodoListRequestDtoFromJson(json);

@override final  int pageNumber;
@override final  int pageSize;
@override@JsonKey(includeIfNull: false) final  String? todoName;
@override@JsonKey(includeIfNull: false) final  TodoType? todoType;
@override@JsonKey(includeIfNull: false) final  TodoStatus? todoStatus;
@override@JsonKey(includeIfNull: false) final  TodoSortField? sortBy;
@override@JsonKey(includeIfNull: false) final  TodoSortOrder? sortOrder;

/// Create a copy of TodoListRequestDto
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$TodoListRequestDtoCopyWith<_TodoListRequestDto> get copyWith => __$TodoListRequestDtoCopyWithImpl<_TodoListRequestDto>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$TodoListRequestDtoToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _TodoListRequestDto&&(identical(other.pageNumber, pageNumber) || other.pageNumber == pageNumber)&&(identical(other.pageSize, pageSize) || other.pageSize == pageSize)&&(identical(other.todoName, todoName) || other.todoName == todoName)&&(identical(other.todoType, todoType) || other.todoType == todoType)&&(identical(other.todoStatus, todoStatus) || other.todoStatus == todoStatus)&&(identical(other.sortBy, sortBy) || other.sortBy == sortBy)&&(identical(other.sortOrder, sortOrder) || other.sortOrder == sortOrder));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,pageNumber,pageSize,todoName,todoType,todoStatus,sortBy,sortOrder);

@override
String toString() {
  return 'TodoListRequestDto(pageNumber: $pageNumber, pageSize: $pageSize, todoName: $todoName, todoType: $todoType, todoStatus: $todoStatus, sortBy: $sortBy, sortOrder: $sortOrder)';
}


}

/// @nodoc
abstract mixin class _$TodoListRequestDtoCopyWith<$Res> implements $TodoListRequestDtoCopyWith<$Res> {
  factory _$TodoListRequestDtoCopyWith(_TodoListRequestDto value, $Res Function(_TodoListRequestDto) _then) = __$TodoListRequestDtoCopyWithImpl;
@override @useResult
$Res call({
 int pageNumber, int pageSize,@JsonKey(includeIfNull: false) String? todoName,@JsonKey(includeIfNull: false) TodoType? todoType,@JsonKey(includeIfNull: false) TodoStatus? todoStatus,@JsonKey(includeIfNull: false) TodoSortField? sortBy,@JsonKey(includeIfNull: false) TodoSortOrder? sortOrder
});




}
/// @nodoc
class __$TodoListRequestDtoCopyWithImpl<$Res>
    implements _$TodoListRequestDtoCopyWith<$Res> {
  __$TodoListRequestDtoCopyWithImpl(this._self, this._then);

  final _TodoListRequestDto _self;
  final $Res Function(_TodoListRequestDto) _then;

/// Create a copy of TodoListRequestDto
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? pageNumber = null,Object? pageSize = null,Object? todoName = freezed,Object? todoType = freezed,Object? todoStatus = freezed,Object? sortBy = freezed,Object? sortOrder = freezed,}) {
  return _then(_TodoListRequestDto(
pageNumber: null == pageNumber ? _self.pageNumber : pageNumber // ignore: cast_nullable_to_non_nullable
as int,pageSize: null == pageSize ? _self.pageSize : pageSize // ignore: cast_nullable_to_non_nullable
as int,todoName: freezed == todoName ? _self.todoName : todoName // ignore: cast_nullable_to_non_nullable
as String?,todoType: freezed == todoType ? _self.todoType : todoType // ignore: cast_nullable_to_non_nullable
as TodoType?,todoStatus: freezed == todoStatus ? _self.todoStatus : todoStatus // ignore: cast_nullable_to_non_nullable
as TodoStatus?,sortBy: freezed == sortBy ? _self.sortBy : sortBy // ignore: cast_nullable_to_non_nullable
as TodoSortField?,sortOrder: freezed == sortOrder ? _self.sortOrder : sortOrder // ignore: cast_nullable_to_non_nullable
as TodoSortOrder?,
  ));
}


}

// dart format on
