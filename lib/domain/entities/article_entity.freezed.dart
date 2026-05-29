// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'article_entity.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$ArticleEntity {

 String? get status; int? get totalResults; List<ArticleEntityList>? get articles;
/// Create a copy of ArticleEntity
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ArticleEntityCopyWith<ArticleEntity> get copyWith => _$ArticleEntityCopyWithImpl<ArticleEntity>(this as ArticleEntity, _$identity);

  /// Serializes this ArticleEntity to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ArticleEntity&&(identical(other.status, status) || other.status == status)&&(identical(other.totalResults, totalResults) || other.totalResults == totalResults)&&const DeepCollectionEquality().equals(other.articles, articles));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,status,totalResults,const DeepCollectionEquality().hash(articles));

@override
String toString() {
  return 'ArticleEntity(status: $status, totalResults: $totalResults, articles: $articles)';
}


}

/// @nodoc
abstract mixin class $ArticleEntityCopyWith<$Res>  {
  factory $ArticleEntityCopyWith(ArticleEntity value, $Res Function(ArticleEntity) _then) = _$ArticleEntityCopyWithImpl;
@useResult
$Res call({
 String? status, int? totalResults, List<ArticleEntityList>? articles
});




}
/// @nodoc
class _$ArticleEntityCopyWithImpl<$Res>
    implements $ArticleEntityCopyWith<$Res> {
  _$ArticleEntityCopyWithImpl(this._self, this._then);

  final ArticleEntity _self;
  final $Res Function(ArticleEntity) _then;

/// Create a copy of ArticleEntity
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? status = freezed,Object? totalResults = freezed,Object? articles = freezed,}) {
  return _then(_self.copyWith(
status: freezed == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as String?,totalResults: freezed == totalResults ? _self.totalResults : totalResults // ignore: cast_nullable_to_non_nullable
as int?,articles: freezed == articles ? _self.articles : articles // ignore: cast_nullable_to_non_nullable
as List<ArticleEntityList>?,
  ));
}

}


/// Adds pattern-matching-related methods to [ArticleEntity].
extension ArticleEntityPatterns on ArticleEntity {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ArticleEntity value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ArticleEntity() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ArticleEntity value)  $default,){
final _that = this;
switch (_that) {
case _ArticleEntity():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ArticleEntity value)?  $default,){
final _that = this;
switch (_that) {
case _ArticleEntity() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String? status,  int? totalResults,  List<ArticleEntityList>? articles)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ArticleEntity() when $default != null:
return $default(_that.status,_that.totalResults,_that.articles);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String? status,  int? totalResults,  List<ArticleEntityList>? articles)  $default,) {final _that = this;
switch (_that) {
case _ArticleEntity():
return $default(_that.status,_that.totalResults,_that.articles);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String? status,  int? totalResults,  List<ArticleEntityList>? articles)?  $default,) {final _that = this;
switch (_that) {
case _ArticleEntity() when $default != null:
return $default(_that.status,_that.totalResults,_that.articles);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _ArticleEntity implements ArticleEntity {
  const _ArticleEntity({this.status, this.totalResults, final  List<ArticleEntityList>? articles}): _articles = articles;
  factory _ArticleEntity.fromJson(Map<String, dynamic> json) => _$ArticleEntityFromJson(json);

@override final  String? status;
@override final  int? totalResults;
 final  List<ArticleEntityList>? _articles;
@override List<ArticleEntityList>? get articles {
  final value = _articles;
  if (value == null) return null;
  if (_articles is EqualUnmodifiableListView) return _articles;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(value);
}


/// Create a copy of ArticleEntity
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ArticleEntityCopyWith<_ArticleEntity> get copyWith => __$ArticleEntityCopyWithImpl<_ArticleEntity>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ArticleEntityToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ArticleEntity&&(identical(other.status, status) || other.status == status)&&(identical(other.totalResults, totalResults) || other.totalResults == totalResults)&&const DeepCollectionEquality().equals(other._articles, _articles));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,status,totalResults,const DeepCollectionEquality().hash(_articles));

@override
String toString() {
  return 'ArticleEntity(status: $status, totalResults: $totalResults, articles: $articles)';
}


}

/// @nodoc
abstract mixin class _$ArticleEntityCopyWith<$Res> implements $ArticleEntityCopyWith<$Res> {
  factory _$ArticleEntityCopyWith(_ArticleEntity value, $Res Function(_ArticleEntity) _then) = __$ArticleEntityCopyWithImpl;
@override @useResult
$Res call({
 String? status, int? totalResults, List<ArticleEntityList>? articles
});




}
/// @nodoc
class __$ArticleEntityCopyWithImpl<$Res>
    implements _$ArticleEntityCopyWith<$Res> {
  __$ArticleEntityCopyWithImpl(this._self, this._then);

  final _ArticleEntity _self;
  final $Res Function(_ArticleEntity) _then;

/// Create a copy of ArticleEntity
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? status = freezed,Object? totalResults = freezed,Object? articles = freezed,}) {
  return _then(_ArticleEntity(
status: freezed == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as String?,totalResults: freezed == totalResults ? _self.totalResults : totalResults // ignore: cast_nullable_to_non_nullable
as int?,articles: freezed == articles ? _self._articles : articles // ignore: cast_nullable_to_non_nullable
as List<ArticleEntityList>?,
  ));
}


}


/// @nodoc
mixin _$ArticleEntityList {

 SourceEntity? get source; String? get author; String? get title; String? get description; String? get url; String? get urlToImage; DateTime? get publishedAt; String? get content;
/// Create a copy of ArticleEntityList
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ArticleEntityListCopyWith<ArticleEntityList> get copyWith => _$ArticleEntityListCopyWithImpl<ArticleEntityList>(this as ArticleEntityList, _$identity);

  /// Serializes this ArticleEntityList to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ArticleEntityList&&(identical(other.source, source) || other.source == source)&&(identical(other.author, author) || other.author == author)&&(identical(other.title, title) || other.title == title)&&(identical(other.description, description) || other.description == description)&&(identical(other.url, url) || other.url == url)&&(identical(other.urlToImage, urlToImage) || other.urlToImage == urlToImage)&&(identical(other.publishedAt, publishedAt) || other.publishedAt == publishedAt)&&(identical(other.content, content) || other.content == content));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,source,author,title,description,url,urlToImage,publishedAt,content);

@override
String toString() {
  return 'ArticleEntityList(source: $source, author: $author, title: $title, description: $description, url: $url, urlToImage: $urlToImage, publishedAt: $publishedAt, content: $content)';
}


}

/// @nodoc
abstract mixin class $ArticleEntityListCopyWith<$Res>  {
  factory $ArticleEntityListCopyWith(ArticleEntityList value, $Res Function(ArticleEntityList) _then) = _$ArticleEntityListCopyWithImpl;
@useResult
$Res call({
 SourceEntity? source, String? author, String? title, String? description, String? url, String? urlToImage, DateTime? publishedAt, String? content
});


$SourceEntityCopyWith<$Res>? get source;

}
/// @nodoc
class _$ArticleEntityListCopyWithImpl<$Res>
    implements $ArticleEntityListCopyWith<$Res> {
  _$ArticleEntityListCopyWithImpl(this._self, this._then);

  final ArticleEntityList _self;
  final $Res Function(ArticleEntityList) _then;

/// Create a copy of ArticleEntityList
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? source = freezed,Object? author = freezed,Object? title = freezed,Object? description = freezed,Object? url = freezed,Object? urlToImage = freezed,Object? publishedAt = freezed,Object? content = freezed,}) {
  return _then(_self.copyWith(
source: freezed == source ? _self.source : source // ignore: cast_nullable_to_non_nullable
as SourceEntity?,author: freezed == author ? _self.author : author // ignore: cast_nullable_to_non_nullable
as String?,title: freezed == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String?,description: freezed == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String?,url: freezed == url ? _self.url : url // ignore: cast_nullable_to_non_nullable
as String?,urlToImage: freezed == urlToImage ? _self.urlToImage : urlToImage // ignore: cast_nullable_to_non_nullable
as String?,publishedAt: freezed == publishedAt ? _self.publishedAt : publishedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,content: freezed == content ? _self.content : content // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}
/// Create a copy of ArticleEntityList
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$SourceEntityCopyWith<$Res>? get source {
    if (_self.source == null) {
    return null;
  }

  return $SourceEntityCopyWith<$Res>(_self.source!, (value) {
    return _then(_self.copyWith(source: value));
  });
}
}


/// Adds pattern-matching-related methods to [ArticleEntityList].
extension ArticleEntityListPatterns on ArticleEntityList {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ArticleEntityList value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ArticleEntityList() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ArticleEntityList value)  $default,){
final _that = this;
switch (_that) {
case _ArticleEntityList():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ArticleEntityList value)?  $default,){
final _that = this;
switch (_that) {
case _ArticleEntityList() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( SourceEntity? source,  String? author,  String? title,  String? description,  String? url,  String? urlToImage,  DateTime? publishedAt,  String? content)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ArticleEntityList() when $default != null:
return $default(_that.source,_that.author,_that.title,_that.description,_that.url,_that.urlToImage,_that.publishedAt,_that.content);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( SourceEntity? source,  String? author,  String? title,  String? description,  String? url,  String? urlToImage,  DateTime? publishedAt,  String? content)  $default,) {final _that = this;
switch (_that) {
case _ArticleEntityList():
return $default(_that.source,_that.author,_that.title,_that.description,_that.url,_that.urlToImage,_that.publishedAt,_that.content);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( SourceEntity? source,  String? author,  String? title,  String? description,  String? url,  String? urlToImage,  DateTime? publishedAt,  String? content)?  $default,) {final _that = this;
switch (_that) {
case _ArticleEntityList() when $default != null:
return $default(_that.source,_that.author,_that.title,_that.description,_that.url,_that.urlToImage,_that.publishedAt,_that.content);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _ArticleEntityList implements ArticleEntityList {
  const _ArticleEntityList({this.source, this.author, this.title, this.description, this.url, this.urlToImage, this.publishedAt, this.content});
  factory _ArticleEntityList.fromJson(Map<String, dynamic> json) => _$ArticleEntityListFromJson(json);

@override final  SourceEntity? source;
@override final  String? author;
@override final  String? title;
@override final  String? description;
@override final  String? url;
@override final  String? urlToImage;
@override final  DateTime? publishedAt;
@override final  String? content;

/// Create a copy of ArticleEntityList
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ArticleEntityListCopyWith<_ArticleEntityList> get copyWith => __$ArticleEntityListCopyWithImpl<_ArticleEntityList>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ArticleEntityListToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ArticleEntityList&&(identical(other.source, source) || other.source == source)&&(identical(other.author, author) || other.author == author)&&(identical(other.title, title) || other.title == title)&&(identical(other.description, description) || other.description == description)&&(identical(other.url, url) || other.url == url)&&(identical(other.urlToImage, urlToImage) || other.urlToImage == urlToImage)&&(identical(other.publishedAt, publishedAt) || other.publishedAt == publishedAt)&&(identical(other.content, content) || other.content == content));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,source,author,title,description,url,urlToImage,publishedAt,content);

@override
String toString() {
  return 'ArticleEntityList(source: $source, author: $author, title: $title, description: $description, url: $url, urlToImage: $urlToImage, publishedAt: $publishedAt, content: $content)';
}


}

/// @nodoc
abstract mixin class _$ArticleEntityListCopyWith<$Res> implements $ArticleEntityListCopyWith<$Res> {
  factory _$ArticleEntityListCopyWith(_ArticleEntityList value, $Res Function(_ArticleEntityList) _then) = __$ArticleEntityListCopyWithImpl;
@override @useResult
$Res call({
 SourceEntity? source, String? author, String? title, String? description, String? url, String? urlToImage, DateTime? publishedAt, String? content
});


@override $SourceEntityCopyWith<$Res>? get source;

}
/// @nodoc
class __$ArticleEntityListCopyWithImpl<$Res>
    implements _$ArticleEntityListCopyWith<$Res> {
  __$ArticleEntityListCopyWithImpl(this._self, this._then);

  final _ArticleEntityList _self;
  final $Res Function(_ArticleEntityList) _then;

/// Create a copy of ArticleEntityList
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? source = freezed,Object? author = freezed,Object? title = freezed,Object? description = freezed,Object? url = freezed,Object? urlToImage = freezed,Object? publishedAt = freezed,Object? content = freezed,}) {
  return _then(_ArticleEntityList(
source: freezed == source ? _self.source : source // ignore: cast_nullable_to_non_nullable
as SourceEntity?,author: freezed == author ? _self.author : author // ignore: cast_nullable_to_non_nullable
as String?,title: freezed == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String?,description: freezed == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String?,url: freezed == url ? _self.url : url // ignore: cast_nullable_to_non_nullable
as String?,urlToImage: freezed == urlToImage ? _self.urlToImage : urlToImage // ignore: cast_nullable_to_non_nullable
as String?,publishedAt: freezed == publishedAt ? _self.publishedAt : publishedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,content: freezed == content ? _self.content : content // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

/// Create a copy of ArticleEntityList
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$SourceEntityCopyWith<$Res>? get source {
    if (_self.source == null) {
    return null;
  }

  return $SourceEntityCopyWith<$Res>(_self.source!, (value) {
    return _then(_self.copyWith(source: value));
  });
}
}


/// @nodoc
mixin _$SourceEntity {

 String? get id; String? get name;
/// Create a copy of SourceEntity
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SourceEntityCopyWith<SourceEntity> get copyWith => _$SourceEntityCopyWithImpl<SourceEntity>(this as SourceEntity, _$identity);

  /// Serializes this SourceEntity to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SourceEntity&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,name);

@override
String toString() {
  return 'SourceEntity(id: $id, name: $name)';
}


}

/// @nodoc
abstract mixin class $SourceEntityCopyWith<$Res>  {
  factory $SourceEntityCopyWith(SourceEntity value, $Res Function(SourceEntity) _then) = _$SourceEntityCopyWithImpl;
@useResult
$Res call({
 String? id, String? name
});




}
/// @nodoc
class _$SourceEntityCopyWithImpl<$Res>
    implements $SourceEntityCopyWith<$Res> {
  _$SourceEntityCopyWithImpl(this._self, this._then);

  final SourceEntity _self;
  final $Res Function(SourceEntity) _then;

/// Create a copy of SourceEntity
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = freezed,Object? name = freezed,}) {
  return _then(_self.copyWith(
id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String?,name: freezed == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [SourceEntity].
extension SourceEntityPatterns on SourceEntity {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _SourceEntity value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _SourceEntity() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _SourceEntity value)  $default,){
final _that = this;
switch (_that) {
case _SourceEntity():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _SourceEntity value)?  $default,){
final _that = this;
switch (_that) {
case _SourceEntity() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String? id,  String? name)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _SourceEntity() when $default != null:
return $default(_that.id,_that.name);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String? id,  String? name)  $default,) {final _that = this;
switch (_that) {
case _SourceEntity():
return $default(_that.id,_that.name);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String? id,  String? name)?  $default,) {final _that = this;
switch (_that) {
case _SourceEntity() when $default != null:
return $default(_that.id,_that.name);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _SourceEntity implements SourceEntity {
  const _SourceEntity({this.id, this.name});
  factory _SourceEntity.fromJson(Map<String, dynamic> json) => _$SourceEntityFromJson(json);

@override final  String? id;
@override final  String? name;

/// Create a copy of SourceEntity
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$SourceEntityCopyWith<_SourceEntity> get copyWith => __$SourceEntityCopyWithImpl<_SourceEntity>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$SourceEntityToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _SourceEntity&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,name);

@override
String toString() {
  return 'SourceEntity(id: $id, name: $name)';
}


}

/// @nodoc
abstract mixin class _$SourceEntityCopyWith<$Res> implements $SourceEntityCopyWith<$Res> {
  factory _$SourceEntityCopyWith(_SourceEntity value, $Res Function(_SourceEntity) _then) = __$SourceEntityCopyWithImpl;
@override @useResult
$Res call({
 String? id, String? name
});




}
/// @nodoc
class __$SourceEntityCopyWithImpl<$Res>
    implements _$SourceEntityCopyWith<$Res> {
  __$SourceEntityCopyWithImpl(this._self, this._then);

  final _SourceEntity _self;
  final $Res Function(_SourceEntity) _then;

/// Create a copy of SourceEntity
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = freezed,Object? name = freezed,}) {
  return _then(_SourceEntity(
id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String?,name: freezed == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on
