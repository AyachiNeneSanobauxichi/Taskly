// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'todo_page.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$TodoPage {

 List<Todo> get items; int get totalDocs; int get limit; int get totalPages; int get page; int get pagingCounter; bool get hasPrevPage; bool get hasNextPage; int? get prevPage; int? get nextPage;
/// Create a copy of TodoPage
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$TodoPageCopyWith<TodoPage> get copyWith => _$TodoPageCopyWithImpl<TodoPage>(this as TodoPage, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is TodoPage&&const DeepCollectionEquality().equals(other.items, items)&&(identical(other.totalDocs, totalDocs) || other.totalDocs == totalDocs)&&(identical(other.limit, limit) || other.limit == limit)&&(identical(other.totalPages, totalPages) || other.totalPages == totalPages)&&(identical(other.page, page) || other.page == page)&&(identical(other.pagingCounter, pagingCounter) || other.pagingCounter == pagingCounter)&&(identical(other.hasPrevPage, hasPrevPage) || other.hasPrevPage == hasPrevPage)&&(identical(other.hasNextPage, hasNextPage) || other.hasNextPage == hasNextPage)&&(identical(other.prevPage, prevPage) || other.prevPage == prevPage)&&(identical(other.nextPage, nextPage) || other.nextPage == nextPage));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(items),totalDocs,limit,totalPages,page,pagingCounter,hasPrevPage,hasNextPage,prevPage,nextPage);

@override
String toString() {
  return 'TodoPage(items: $items, totalDocs: $totalDocs, limit: $limit, totalPages: $totalPages, page: $page, pagingCounter: $pagingCounter, hasPrevPage: $hasPrevPage, hasNextPage: $hasNextPage, prevPage: $prevPage, nextPage: $nextPage)';
}


}

/// @nodoc
abstract mixin class $TodoPageCopyWith<$Res>  {
  factory $TodoPageCopyWith(TodoPage value, $Res Function(TodoPage) _then) = _$TodoPageCopyWithImpl;
@useResult
$Res call({
 List<Todo> items, int totalDocs, int limit, int totalPages, int page, int pagingCounter, bool hasPrevPage, bool hasNextPage, int? prevPage, int? nextPage
});




}
/// @nodoc
class _$TodoPageCopyWithImpl<$Res>
    implements $TodoPageCopyWith<$Res> {
  _$TodoPageCopyWithImpl(this._self, this._then);

  final TodoPage _self;
  final $Res Function(TodoPage) _then;

/// Create a copy of TodoPage
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? items = null,Object? totalDocs = null,Object? limit = null,Object? totalPages = null,Object? page = null,Object? pagingCounter = null,Object? hasPrevPage = null,Object? hasNextPage = null,Object? prevPage = freezed,Object? nextPage = freezed,}) {
  return _then(_self.copyWith(
items: null == items ? _self.items : items // ignore: cast_nullable_to_non_nullable
as List<Todo>,totalDocs: null == totalDocs ? _self.totalDocs : totalDocs // ignore: cast_nullable_to_non_nullable
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


/// Adds pattern-matching-related methods to [TodoPage].
extension TodoPagePatterns on TodoPage {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _TodoPage value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _TodoPage() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _TodoPage value)  $default,){
final _that = this;
switch (_that) {
case _TodoPage():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _TodoPage value)?  $default,){
final _that = this;
switch (_that) {
case _TodoPage() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( List<Todo> items,  int totalDocs,  int limit,  int totalPages,  int page,  int pagingCounter,  bool hasPrevPage,  bool hasNextPage,  int? prevPage,  int? nextPage)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _TodoPage() when $default != null:
return $default(_that.items,_that.totalDocs,_that.limit,_that.totalPages,_that.page,_that.pagingCounter,_that.hasPrevPage,_that.hasNextPage,_that.prevPage,_that.nextPage);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( List<Todo> items,  int totalDocs,  int limit,  int totalPages,  int page,  int pagingCounter,  bool hasPrevPage,  bool hasNextPage,  int? prevPage,  int? nextPage)  $default,) {final _that = this;
switch (_that) {
case _TodoPage():
return $default(_that.items,_that.totalDocs,_that.limit,_that.totalPages,_that.page,_that.pagingCounter,_that.hasPrevPage,_that.hasNextPage,_that.prevPage,_that.nextPage);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( List<Todo> items,  int totalDocs,  int limit,  int totalPages,  int page,  int pagingCounter,  bool hasPrevPage,  bool hasNextPage,  int? prevPage,  int? nextPage)?  $default,) {final _that = this;
switch (_that) {
case _TodoPage() when $default != null:
return $default(_that.items,_that.totalDocs,_that.limit,_that.totalPages,_that.page,_that.pagingCounter,_that.hasPrevPage,_that.hasNextPage,_that.prevPage,_that.nextPage);case _:
  return null;

}
}

}

/// @nodoc


class _TodoPage implements TodoPage {
  const _TodoPage({required final  List<Todo> items, required this.totalDocs, required this.limit, required this.totalPages, required this.page, required this.pagingCounter, required this.hasPrevPage, required this.hasNextPage, this.prevPage, this.nextPage}): _items = items;
  

 final  List<Todo> _items;
@override List<Todo> get items {
  if (_items is EqualUnmodifiableListView) return _items;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_items);
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

/// Create a copy of TodoPage
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$TodoPageCopyWith<_TodoPage> get copyWith => __$TodoPageCopyWithImpl<_TodoPage>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _TodoPage&&const DeepCollectionEquality().equals(other._items, _items)&&(identical(other.totalDocs, totalDocs) || other.totalDocs == totalDocs)&&(identical(other.limit, limit) || other.limit == limit)&&(identical(other.totalPages, totalPages) || other.totalPages == totalPages)&&(identical(other.page, page) || other.page == page)&&(identical(other.pagingCounter, pagingCounter) || other.pagingCounter == pagingCounter)&&(identical(other.hasPrevPage, hasPrevPage) || other.hasPrevPage == hasPrevPage)&&(identical(other.hasNextPage, hasNextPage) || other.hasNextPage == hasNextPage)&&(identical(other.prevPage, prevPage) || other.prevPage == prevPage)&&(identical(other.nextPage, nextPage) || other.nextPage == nextPage));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_items),totalDocs,limit,totalPages,page,pagingCounter,hasPrevPage,hasNextPage,prevPage,nextPage);

@override
String toString() {
  return 'TodoPage(items: $items, totalDocs: $totalDocs, limit: $limit, totalPages: $totalPages, page: $page, pagingCounter: $pagingCounter, hasPrevPage: $hasPrevPage, hasNextPage: $hasNextPage, prevPage: $prevPage, nextPage: $nextPage)';
}


}

/// @nodoc
abstract mixin class _$TodoPageCopyWith<$Res> implements $TodoPageCopyWith<$Res> {
  factory _$TodoPageCopyWith(_TodoPage value, $Res Function(_TodoPage) _then) = __$TodoPageCopyWithImpl;
@override @useResult
$Res call({
 List<Todo> items, int totalDocs, int limit, int totalPages, int page, int pagingCounter, bool hasPrevPage, bool hasNextPage, int? prevPage, int? nextPage
});




}
/// @nodoc
class __$TodoPageCopyWithImpl<$Res>
    implements _$TodoPageCopyWith<$Res> {
  __$TodoPageCopyWithImpl(this._self, this._then);

  final _TodoPage _self;
  final $Res Function(_TodoPage) _then;

/// Create a copy of TodoPage
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? items = null,Object? totalDocs = null,Object? limit = null,Object? totalPages = null,Object? page = null,Object? pagingCounter = null,Object? hasPrevPage = null,Object? hasNextPage = null,Object? prevPage = freezed,Object? nextPage = freezed,}) {
  return _then(_TodoPage(
items: null == items ? _self._items : items // ignore: cast_nullable_to_non_nullable
as List<Todo>,totalDocs: null == totalDocs ? _self.totalDocs : totalDocs // ignore: cast_nullable_to_non_nullable
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
