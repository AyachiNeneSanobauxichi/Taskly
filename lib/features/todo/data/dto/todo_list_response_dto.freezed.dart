// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'todo_list_response_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$TodoListResponseDto {

 List<TodoDto> get docs; int get totalDocs; int get limit; int get totalPages; int get page; int get pagingCounter; bool get hasPrevPage; bool get hasNextPage; int? get prevPage; int? get nextPage;
/// Create a copy of TodoListResponseDto
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$TodoListResponseDtoCopyWith<TodoListResponseDto> get copyWith => _$TodoListResponseDtoCopyWithImpl<TodoListResponseDto>(this as TodoListResponseDto, _$identity);

  /// Serializes this TodoListResponseDto to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is TodoListResponseDto&&const DeepCollectionEquality().equals(other.docs, docs)&&(identical(other.totalDocs, totalDocs) || other.totalDocs == totalDocs)&&(identical(other.limit, limit) || other.limit == limit)&&(identical(other.totalPages, totalPages) || other.totalPages == totalPages)&&(identical(other.page, page) || other.page == page)&&(identical(other.pagingCounter, pagingCounter) || other.pagingCounter == pagingCounter)&&(identical(other.hasPrevPage, hasPrevPage) || other.hasPrevPage == hasPrevPage)&&(identical(other.hasNextPage, hasNextPage) || other.hasNextPage == hasNextPage)&&(identical(other.prevPage, prevPage) || other.prevPage == prevPage)&&(identical(other.nextPage, nextPage) || other.nextPage == nextPage));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(docs),totalDocs,limit,totalPages,page,pagingCounter,hasPrevPage,hasNextPage,prevPage,nextPage);

@override
String toString() {
  return 'TodoListResponseDto(docs: $docs, totalDocs: $totalDocs, limit: $limit, totalPages: $totalPages, page: $page, pagingCounter: $pagingCounter, hasPrevPage: $hasPrevPage, hasNextPage: $hasNextPage, prevPage: $prevPage, nextPage: $nextPage)';
}


}

/// @nodoc
abstract mixin class $TodoListResponseDtoCopyWith<$Res>  {
  factory $TodoListResponseDtoCopyWith(TodoListResponseDto value, $Res Function(TodoListResponseDto) _then) = _$TodoListResponseDtoCopyWithImpl;
@useResult
$Res call({
 List<TodoDto> docs, int totalDocs, int limit, int totalPages, int page, int pagingCounter, bool hasPrevPage, bool hasNextPage, int? prevPage, int? nextPage
});




}
/// @nodoc
class _$TodoListResponseDtoCopyWithImpl<$Res>
    implements $TodoListResponseDtoCopyWith<$Res> {
  _$TodoListResponseDtoCopyWithImpl(this._self, this._then);

  final TodoListResponseDto _self;
  final $Res Function(TodoListResponseDto) _then;

/// Create a copy of TodoListResponseDto
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? docs = null,Object? totalDocs = null,Object? limit = null,Object? totalPages = null,Object? page = null,Object? pagingCounter = null,Object? hasPrevPage = null,Object? hasNextPage = null,Object? prevPage = freezed,Object? nextPage = freezed,}) {
  return _then(_self.copyWith(
docs: null == docs ? _self.docs : docs // ignore: cast_nullable_to_non_nullable
as List<TodoDto>,totalDocs: null == totalDocs ? _self.totalDocs : totalDocs // ignore: cast_nullable_to_non_nullable
as int,limit: null == limit ? _self.limit : limit // ignore: cast_nullable_to_non_nullable
as int,totalPages: null == totalPages ? _self.totalPages : totalPages // ignore: cast_nullable_to_non_nullable
as int,page: null == page ? _self.page : page // ignore: cast_nullable_to_non_nullable
as int,pagingCounter: null == pagingCounter ? _self.pagingCounter : pagingCounter // ignore: cast_nullable_to_non_nullable
as int,hasPrevPage: null == hasPrevPage ? _self.hasPrevPage : hasPrevPage // ignore: cast_nullable_to_non_nullable
as bool,hasNextPage: null == hasNextPage ? _self.hasNextPage : hasNextPage // ignore: cast_nullable_to_non_nullable
as bool,prevPage: freezed == prevPage ? _self.prevPage : prevPage // ignore: cast_nullable_to_non_nullable
as int?,nextPage: freezed == nextPage ? _self.nextPage : nextPage // ignore: cast_nullable_to_non_nullable
as int?,
  ));
}

}


/// Adds pattern-matching-related methods to [TodoListResponseDto].
extension TodoListResponseDtoPatterns on TodoListResponseDto {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _TodoListResponseDto value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _TodoListResponseDto() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _TodoListResponseDto value)  $default,){
final _that = this;
switch (_that) {
case _TodoListResponseDto():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _TodoListResponseDto value)?  $default,){
final _that = this;
switch (_that) {
case _TodoListResponseDto() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( List<TodoDto> docs,  int totalDocs,  int limit,  int totalPages,  int page,  int pagingCounter,  bool hasPrevPage,  bool hasNextPage,  int? prevPage,  int? nextPage)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _TodoListResponseDto() when $default != null:
return $default(_that.docs,_that.totalDocs,_that.limit,_that.totalPages,_that.page,_that.pagingCounter,_that.hasPrevPage,_that.hasNextPage,_that.prevPage,_that.nextPage);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( List<TodoDto> docs,  int totalDocs,  int limit,  int totalPages,  int page,  int pagingCounter,  bool hasPrevPage,  bool hasNextPage,  int? prevPage,  int? nextPage)  $default,) {final _that = this;
switch (_that) {
case _TodoListResponseDto():
return $default(_that.docs,_that.totalDocs,_that.limit,_that.totalPages,_that.page,_that.pagingCounter,_that.hasPrevPage,_that.hasNextPage,_that.prevPage,_that.nextPage);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( List<TodoDto> docs,  int totalDocs,  int limit,  int totalPages,  int page,  int pagingCounter,  bool hasPrevPage,  bool hasNextPage,  int? prevPage,  int? nextPage)?  $default,) {final _that = this;
switch (_that) {
case _TodoListResponseDto() when $default != null:
return $default(_that.docs,_that.totalDocs,_that.limit,_that.totalPages,_that.page,_that.pagingCounter,_that.hasPrevPage,_that.hasNextPage,_that.prevPage,_that.nextPage);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _TodoListResponseDto extends TodoListResponseDto {
  const _TodoListResponseDto({required final  List<TodoDto> docs, required this.totalDocs, required this.limit, required this.totalPages, required this.page, required this.pagingCounter, required this.hasPrevPage, required this.hasNextPage, this.prevPage, this.nextPage}): _docs = docs,super._();
  factory _TodoListResponseDto.fromJson(Map<String, dynamic> json) => _$TodoListResponseDtoFromJson(json);

 final  List<TodoDto> _docs;
@override List<TodoDto> get docs {
  if (_docs is EqualUnmodifiableListView) return _docs;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_docs);
}

@override final  int totalDocs;
@override final  int limit;
@override final  int totalPages;
@override final  int page;
@override final  int pagingCounter;
@override final  bool hasPrevPage;
@override final  bool hasNextPage;
@override final  int? prevPage;
@override final  int? nextPage;

/// Create a copy of TodoListResponseDto
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$TodoListResponseDtoCopyWith<_TodoListResponseDto> get copyWith => __$TodoListResponseDtoCopyWithImpl<_TodoListResponseDto>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$TodoListResponseDtoToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _TodoListResponseDto&&const DeepCollectionEquality().equals(other._docs, _docs)&&(identical(other.totalDocs, totalDocs) || other.totalDocs == totalDocs)&&(identical(other.limit, limit) || other.limit == limit)&&(identical(other.totalPages, totalPages) || other.totalPages == totalPages)&&(identical(other.page, page) || other.page == page)&&(identical(other.pagingCounter, pagingCounter) || other.pagingCounter == pagingCounter)&&(identical(other.hasPrevPage, hasPrevPage) || other.hasPrevPage == hasPrevPage)&&(identical(other.hasNextPage, hasNextPage) || other.hasNextPage == hasNextPage)&&(identical(other.prevPage, prevPage) || other.prevPage == prevPage)&&(identical(other.nextPage, nextPage) || other.nextPage == nextPage));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_docs),totalDocs,limit,totalPages,page,pagingCounter,hasPrevPage,hasNextPage,prevPage,nextPage);

@override
String toString() {
  return 'TodoListResponseDto(docs: $docs, totalDocs: $totalDocs, limit: $limit, totalPages: $totalPages, page: $page, pagingCounter: $pagingCounter, hasPrevPage: $hasPrevPage, hasNextPage: $hasNextPage, prevPage: $prevPage, nextPage: $nextPage)';
}


}

/// @nodoc
abstract mixin class _$TodoListResponseDtoCopyWith<$Res> implements $TodoListResponseDtoCopyWith<$Res> {
  factory _$TodoListResponseDtoCopyWith(_TodoListResponseDto value, $Res Function(_TodoListResponseDto) _then) = __$TodoListResponseDtoCopyWithImpl;
@override @useResult
$Res call({
 List<TodoDto> docs, int totalDocs, int limit, int totalPages, int page, int pagingCounter, bool hasPrevPage, bool hasNextPage, int? prevPage, int? nextPage
});




}
/// @nodoc
class __$TodoListResponseDtoCopyWithImpl<$Res>
    implements _$TodoListResponseDtoCopyWith<$Res> {
  __$TodoListResponseDtoCopyWithImpl(this._self, this._then);

  final _TodoListResponseDto _self;
  final $Res Function(_TodoListResponseDto) _then;

/// Create a copy of TodoListResponseDto
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? docs = null,Object? totalDocs = null,Object? limit = null,Object? totalPages = null,Object? page = null,Object? pagingCounter = null,Object? hasPrevPage = null,Object? hasNextPage = null,Object? prevPage = freezed,Object? nextPage = freezed,}) {
  return _then(_TodoListResponseDto(
docs: null == docs ? _self._docs : docs // ignore: cast_nullable_to_non_nullable
as List<TodoDto>,totalDocs: null == totalDocs ? _self.totalDocs : totalDocs // ignore: cast_nullable_to_non_nullable
as int,limit: null == limit ? _self.limit : limit // ignore: cast_nullable_to_non_nullable
as int,totalPages: null == totalPages ? _self.totalPages : totalPages // ignore: cast_nullable_to_non_nullable
as int,page: null == page ? _self.page : page // ignore: cast_nullable_to_non_nullable
as int,pagingCounter: null == pagingCounter ? _self.pagingCounter : pagingCounter // ignore: cast_nullable_to_non_nullable
as int,hasPrevPage: null == hasPrevPage ? _self.hasPrevPage : hasPrevPage // ignore: cast_nullable_to_non_nullable
as bool,hasNextPage: null == hasNextPage ? _self.hasNextPage : hasNextPage // ignore: cast_nullable_to_non_nullable
as bool,prevPage: freezed == prevPage ? _self.prevPage : prevPage // ignore: cast_nullable_to_non_nullable
as int?,nextPage: freezed == nextPage ? _self.nextPage : nextPage // ignore: cast_nullable_to_non_nullable
as int?,
  ));
}


}

// dart format on
