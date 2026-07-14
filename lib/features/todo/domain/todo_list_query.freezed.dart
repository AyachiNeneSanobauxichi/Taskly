// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'todo_list_query.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$TodoListQuery {

 int get pageNumber; int get pageSize; String? get name; TodoType? get type; TodoStatus? get status; TodoSortField? get sortField; TodoSortOrder? get sortOrder;
/// Create a copy of TodoListQuery
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$TodoListQueryCopyWith<TodoListQuery> get copyWith => _$TodoListQueryCopyWithImpl<TodoListQuery>(this as TodoListQuery, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is TodoListQuery&&(identical(other.pageNumber, pageNumber) || other.pageNumber == pageNumber)&&(identical(other.pageSize, pageSize) || other.pageSize == pageSize)&&(identical(other.name, name) || other.name == name)&&(identical(other.type, type) || other.type == type)&&(identical(other.status, status) || other.status == status)&&(identical(other.sortField, sortField) || other.sortField == sortField)&&(identical(other.sortOrder, sortOrder) || other.sortOrder == sortOrder));
}


@override
int get hashCode => Object.hash(runtimeType,pageNumber,pageSize,name,type,status,sortField,sortOrder);

@override
String toString() {
  return 'TodoListQuery(pageNumber: $pageNumber, pageSize: $pageSize, name: $name, type: $type, status: $status, sortField: $sortField, sortOrder: $sortOrder)';
}


}

/// @nodoc
abstract mixin class $TodoListQueryCopyWith<$Res>  {
  factory $TodoListQueryCopyWith(TodoListQuery value, $Res Function(TodoListQuery) _then) = _$TodoListQueryCopyWithImpl;
@useResult
$Res call({
 int pageNumber, int pageSize, String? name, TodoType? type, TodoStatus? status, TodoSortField? sortField, TodoSortOrder? sortOrder
});




}
/// @nodoc
class _$TodoListQueryCopyWithImpl<$Res>
    implements $TodoListQueryCopyWith<$Res> {
  _$TodoListQueryCopyWithImpl(this._self, this._then);

  final TodoListQuery _self;
  final $Res Function(TodoListQuery) _then;

/// Create a copy of TodoListQuery
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? pageNumber = null,Object? pageSize = null,Object? name = freezed,Object? type = freezed,Object? status = freezed,Object? sortField = freezed,Object? sortOrder = freezed,}) {
  return _then(_self.copyWith(
pageNumber: null == pageNumber ? _self.pageNumber : pageNumber // ignore: cast_nullable_to_non_nullable
as int,pageSize: null == pageSize ? _self.pageSize : pageSize // ignore: cast_nullable_to_non_nullable
as int,name: freezed == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String?,type: freezed == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as TodoType?,status: freezed == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as TodoStatus?,sortField: freezed == sortField ? _self.sortField : sortField // ignore: cast_nullable_to_non_nullable
as TodoSortField?,sortOrder: freezed == sortOrder ? _self.sortOrder : sortOrder // ignore: cast_nullable_to_non_nullable
as TodoSortOrder?,
  ));
}

}


/// Adds pattern-matching-related methods to [TodoListQuery].
extension TodoListQueryPatterns on TodoListQuery {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _TodoListQuery value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _TodoListQuery() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _TodoListQuery value)  $default,){
final _that = this;
switch (_that) {
case _TodoListQuery():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _TodoListQuery value)?  $default,){
final _that = this;
switch (_that) {
case _TodoListQuery() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int pageNumber,  int pageSize,  String? name,  TodoType? type,  TodoStatus? status,  TodoSortField? sortField,  TodoSortOrder? sortOrder)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _TodoListQuery() when $default != null:
return $default(_that.pageNumber,_that.pageSize,_that.name,_that.type,_that.status,_that.sortField,_that.sortOrder);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int pageNumber,  int pageSize,  String? name,  TodoType? type,  TodoStatus? status,  TodoSortField? sortField,  TodoSortOrder? sortOrder)  $default,) {final _that = this;
switch (_that) {
case _TodoListQuery():
return $default(_that.pageNumber,_that.pageSize,_that.name,_that.type,_that.status,_that.sortField,_that.sortOrder);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int pageNumber,  int pageSize,  String? name,  TodoType? type,  TodoStatus? status,  TodoSortField? sortField,  TodoSortOrder? sortOrder)?  $default,) {final _that = this;
switch (_that) {
case _TodoListQuery() when $default != null:
return $default(_that.pageNumber,_that.pageSize,_that.name,_that.type,_that.status,_that.sortField,_that.sortOrder);case _:
  return null;

}
}

}

/// @nodoc


class _TodoListQuery implements TodoListQuery {
  const _TodoListQuery({this.pageNumber = 1, this.pageSize = 10, this.name, this.type, this.status, this.sortField, this.sortOrder});
  

@override@JsonKey() final  int pageNumber;
@override@JsonKey() final  int pageSize;
@override final  String? name;
@override final  TodoType? type;
@override final  TodoStatus? status;
@override final  TodoSortField? sortField;
@override final  TodoSortOrder? sortOrder;

/// Create a copy of TodoListQuery
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$TodoListQueryCopyWith<_TodoListQuery> get copyWith => __$TodoListQueryCopyWithImpl<_TodoListQuery>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _TodoListQuery&&(identical(other.pageNumber, pageNumber) || other.pageNumber == pageNumber)&&(identical(other.pageSize, pageSize) || other.pageSize == pageSize)&&(identical(other.name, name) || other.name == name)&&(identical(other.type, type) || other.type == type)&&(identical(other.status, status) || other.status == status)&&(identical(other.sortField, sortField) || other.sortField == sortField)&&(identical(other.sortOrder, sortOrder) || other.sortOrder == sortOrder));
}


@override
int get hashCode => Object.hash(runtimeType,pageNumber,pageSize,name,type,status,sortField,sortOrder);

@override
String toString() {
  return 'TodoListQuery(pageNumber: $pageNumber, pageSize: $pageSize, name: $name, type: $type, status: $status, sortField: $sortField, sortOrder: $sortOrder)';
}


}

/// @nodoc
abstract mixin class _$TodoListQueryCopyWith<$Res> implements $TodoListQueryCopyWith<$Res> {
  factory _$TodoListQueryCopyWith(_TodoListQuery value, $Res Function(_TodoListQuery) _then) = __$TodoListQueryCopyWithImpl;
@override @useResult
$Res call({
 int pageNumber, int pageSize, String? name, TodoType? type, TodoStatus? status, TodoSortField? sortField, TodoSortOrder? sortOrder
});




}
/// @nodoc
class __$TodoListQueryCopyWithImpl<$Res>
    implements _$TodoListQueryCopyWith<$Res> {
  __$TodoListQueryCopyWithImpl(this._self, this._then);

  final _TodoListQuery _self;
  final $Res Function(_TodoListQuery) _then;

/// Create a copy of TodoListQuery
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? pageNumber = null,Object? pageSize = null,Object? name = freezed,Object? type = freezed,Object? status = freezed,Object? sortField = freezed,Object? sortOrder = freezed,}) {
  return _then(_TodoListQuery(
pageNumber: null == pageNumber ? _self.pageNumber : pageNumber // ignore: cast_nullable_to_non_nullable
as int,pageSize: null == pageSize ? _self.pageSize : pageSize // ignore: cast_nullable_to_non_nullable
as int,name: freezed == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String?,type: freezed == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as TodoType?,status: freezed == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as TodoStatus?,sortField: freezed == sortField ? _self.sortField : sortField // ignore: cast_nullable_to_non_nullable
as TodoSortField?,sortOrder: freezed == sortOrder ? _self.sortOrder : sortOrder // ignore: cast_nullable_to_non_nullable
as TodoSortOrder?,
  ));
}


}

// dart format on
