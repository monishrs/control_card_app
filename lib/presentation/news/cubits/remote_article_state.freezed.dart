// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'remote_article_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$RemoteArticleState {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is RemoteArticleState);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'RemoteArticleState()';
}


}

/// @nodoc
class $RemoteArticleStateCopyWith<$Res>  {
$RemoteArticleStateCopyWith(RemoteArticleState _, $Res Function(RemoteArticleState) __);
}


/// Adds pattern-matching-related methods to [RemoteArticleState].
extension RemoteArticleStatePatterns on RemoteArticleState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( RemoteArticleInitialState value)?  initial,TResult Function( RemoteArticleLoadingState value)?  loading,TResult Function( RemoteArticleSuccessState value)?  success,TResult Function( RemoteArticleErrorState value)?  error,required TResult orElse(),}){
final _that = this;
switch (_that) {
case RemoteArticleInitialState() when initial != null:
return initial(_that);case RemoteArticleLoadingState() when loading != null:
return loading(_that);case RemoteArticleSuccessState() when success != null:
return success(_that);case RemoteArticleErrorState() when error != null:
return error(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( RemoteArticleInitialState value)  initial,required TResult Function( RemoteArticleLoadingState value)  loading,required TResult Function( RemoteArticleSuccessState value)  success,required TResult Function( RemoteArticleErrorState value)  error,}){
final _that = this;
switch (_that) {
case RemoteArticleInitialState():
return initial(_that);case RemoteArticleLoadingState():
return loading(_that);case RemoteArticleSuccessState():
return success(_that);case RemoteArticleErrorState():
return error(_that);case _:
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( RemoteArticleInitialState value)?  initial,TResult? Function( RemoteArticleLoadingState value)?  loading,TResult? Function( RemoteArticleSuccessState value)?  success,TResult? Function( RemoteArticleErrorState value)?  error,}){
final _that = this;
switch (_that) {
case RemoteArticleInitialState() when initial != null:
return initial(_that);case RemoteArticleLoadingState() when loading != null:
return loading(_that);case RemoteArticleSuccessState() when success != null:
return success(_that);case RemoteArticleErrorState() when error != null:
return error(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  initial,TResult Function()?  loading,TResult Function( ArticleEntity articleEntity)?  success,TResult Function( StatusCode? error)?  error,required TResult orElse(),}) {final _that = this;
switch (_that) {
case RemoteArticleInitialState() when initial != null:
return initial();case RemoteArticleLoadingState() when loading != null:
return loading();case RemoteArticleSuccessState() when success != null:
return success(_that.articleEntity);case RemoteArticleErrorState() when error != null:
return error(_that.error);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  initial,required TResult Function()  loading,required TResult Function( ArticleEntity articleEntity)  success,required TResult Function( StatusCode? error)  error,}) {final _that = this;
switch (_that) {
case RemoteArticleInitialState():
return initial();case RemoteArticleLoadingState():
return loading();case RemoteArticleSuccessState():
return success(_that.articleEntity);case RemoteArticleErrorState():
return error(_that.error);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  initial,TResult? Function()?  loading,TResult? Function( ArticleEntity articleEntity)?  success,TResult? Function( StatusCode? error)?  error,}) {final _that = this;
switch (_that) {
case RemoteArticleInitialState() when initial != null:
return initial();case RemoteArticleLoadingState() when loading != null:
return loading();case RemoteArticleSuccessState() when success != null:
return success(_that.articleEntity);case RemoteArticleErrorState() when error != null:
return error(_that.error);case _:
  return null;

}
}

}

/// @nodoc


class RemoteArticleInitialState implements RemoteArticleState {
  const RemoteArticleInitialState();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is RemoteArticleInitialState);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'RemoteArticleState.initial()';
}


}




/// @nodoc


class RemoteArticleLoadingState implements RemoteArticleState {
  const RemoteArticleLoadingState();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is RemoteArticleLoadingState);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'RemoteArticleState.loading()';
}


}




/// @nodoc


class RemoteArticleSuccessState implements RemoteArticleState {
  const RemoteArticleSuccessState(this.articleEntity);
  

 final  ArticleEntity articleEntity;

/// Create a copy of RemoteArticleState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$RemoteArticleSuccessStateCopyWith<RemoteArticleSuccessState> get copyWith => _$RemoteArticleSuccessStateCopyWithImpl<RemoteArticleSuccessState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is RemoteArticleSuccessState&&(identical(other.articleEntity, articleEntity) || other.articleEntity == articleEntity));
}


@override
int get hashCode => Object.hash(runtimeType,articleEntity);

@override
String toString() {
  return 'RemoteArticleState.success(articleEntity: $articleEntity)';
}


}

/// @nodoc
abstract mixin class $RemoteArticleSuccessStateCopyWith<$Res> implements $RemoteArticleStateCopyWith<$Res> {
  factory $RemoteArticleSuccessStateCopyWith(RemoteArticleSuccessState value, $Res Function(RemoteArticleSuccessState) _then) = _$RemoteArticleSuccessStateCopyWithImpl;
@useResult
$Res call({
 ArticleEntity articleEntity
});


$ArticleEntityCopyWith<$Res> get articleEntity;

}
/// @nodoc
class _$RemoteArticleSuccessStateCopyWithImpl<$Res>
    implements $RemoteArticleSuccessStateCopyWith<$Res> {
  _$RemoteArticleSuccessStateCopyWithImpl(this._self, this._then);

  final RemoteArticleSuccessState _self;
  final $Res Function(RemoteArticleSuccessState) _then;

/// Create a copy of RemoteArticleState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? articleEntity = null,}) {
  return _then(RemoteArticleSuccessState(
null == articleEntity ? _self.articleEntity : articleEntity // ignore: cast_nullable_to_non_nullable
as ArticleEntity,
  ));
}

/// Create a copy of RemoteArticleState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ArticleEntityCopyWith<$Res> get articleEntity {
  
  return $ArticleEntityCopyWith<$Res>(_self.articleEntity, (value) {
    return _then(_self.copyWith(articleEntity: value));
  });
}
}

/// @nodoc


class RemoteArticleErrorState implements RemoteArticleState {
  const RemoteArticleErrorState(this.error);
  

 final  StatusCode? error;

/// Create a copy of RemoteArticleState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$RemoteArticleErrorStateCopyWith<RemoteArticleErrorState> get copyWith => _$RemoteArticleErrorStateCopyWithImpl<RemoteArticleErrorState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is RemoteArticleErrorState&&(identical(other.error, error) || other.error == error));
}


@override
int get hashCode => Object.hash(runtimeType,error);

@override
String toString() {
  return 'RemoteArticleState.error(error: $error)';
}


}

/// @nodoc
abstract mixin class $RemoteArticleErrorStateCopyWith<$Res> implements $RemoteArticleStateCopyWith<$Res> {
  factory $RemoteArticleErrorStateCopyWith(RemoteArticleErrorState value, $Res Function(RemoteArticleErrorState) _then) = _$RemoteArticleErrorStateCopyWithImpl;
@useResult
$Res call({
 StatusCode? error
});




}
/// @nodoc
class _$RemoteArticleErrorStateCopyWithImpl<$Res>
    implements $RemoteArticleErrorStateCopyWith<$Res> {
  _$RemoteArticleErrorStateCopyWithImpl(this._self, this._then);

  final RemoteArticleErrorState _self;
  final $Res Function(RemoteArticleErrorState) _then;

/// Create a copy of RemoteArticleState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? error = freezed,}) {
  return _then(RemoteArticleErrorState(
freezed == error ? _self.error : error // ignore: cast_nullable_to_non_nullable
as StatusCode?,
  ));
}


}

// dart format on
