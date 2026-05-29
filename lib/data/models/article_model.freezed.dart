// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'article_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$ArticleModel {

 String? get status; int? get totalResults; List<ArticleModelList>? get articles;
/// Create a copy of ArticleModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ArticleModelCopyWith<ArticleModel> get copyWith => _$ArticleModelCopyWithImpl<ArticleModel>(this as ArticleModel, _$identity);

  /// Serializes this ArticleModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ArticleModel&&(identical(other.status, status) || other.status == status)&&(identical(other.totalResults, totalResults) || other.totalResults == totalResults)&&const DeepCollectionEquality().equals(other.articles, articles));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,status,totalResults,const DeepCollectionEquality().hash(articles));

@override
String toString() {
  return 'ArticleModel(status: $status, totalResults: $totalResults, articles: $articles)';
}


}

/// @nodoc
abstract mixin class $ArticleModelCopyWith<$Res>  {
  factory $ArticleModelCopyWith(ArticleModel value, $Res Function(ArticleModel) _then) = _$ArticleModelCopyWithImpl;
@useResult
$Res call({
 String? status, int? totalResults, List<ArticleModelList>? articles
});




}
/// @nodoc
class _$ArticleModelCopyWithImpl<$Res>
    implements $ArticleModelCopyWith<$Res> {
  _$ArticleModelCopyWithImpl(this._self, this._then);

  final ArticleModel _self;
  final $Res Function(ArticleModel) _then;

/// Create a copy of ArticleModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? status = freezed,Object? totalResults = freezed,Object? articles = freezed,}) {
  return _then(_self.copyWith(
status: freezed == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as String?,totalResults: freezed == totalResults ? _self.totalResults : totalResults // ignore: cast_nullable_to_non_nullable
as int?,articles: freezed == articles ? _self.articles : articles // ignore: cast_nullable_to_non_nullable
as List<ArticleModelList>?,
  ));
}

}


/// Adds pattern-matching-related methods to [ArticleModel].
extension ArticleModelPatterns on ArticleModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ArticleModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ArticleModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ArticleModel value)  $default,){
final _that = this;
switch (_that) {
case _ArticleModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ArticleModel value)?  $default,){
final _that = this;
switch (_that) {
case _ArticleModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String? status,  int? totalResults,  List<ArticleModelList>? articles)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ArticleModel() when $default != null:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String? status,  int? totalResults,  List<ArticleModelList>? articles)  $default,) {final _that = this;
switch (_that) {
case _ArticleModel():
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String? status,  int? totalResults,  List<ArticleModelList>? articles)?  $default,) {final _that = this;
switch (_that) {
case _ArticleModel() when $default != null:
return $default(_that.status,_that.totalResults,_that.articles);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _ArticleModel implements ArticleModel {
  const _ArticleModel({this.status, this.totalResults, final  List<ArticleModelList>? articles}): _articles = articles;
  factory _ArticleModel.fromJson(Map<String, dynamic> json) => _$ArticleModelFromJson(json);

@override final  String? status;
@override final  int? totalResults;
 final  List<ArticleModelList>? _articles;
@override List<ArticleModelList>? get articles {
  final value = _articles;
  if (value == null) return null;
  if (_articles is EqualUnmodifiableListView) return _articles;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(value);
}


/// Create a copy of ArticleModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ArticleModelCopyWith<_ArticleModel> get copyWith => __$ArticleModelCopyWithImpl<_ArticleModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ArticleModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ArticleModel&&(identical(other.status, status) || other.status == status)&&(identical(other.totalResults, totalResults) || other.totalResults == totalResults)&&const DeepCollectionEquality().equals(other._articles, _articles));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,status,totalResults,const DeepCollectionEquality().hash(_articles));

@override
String toString() {
  return 'ArticleModel(status: $status, totalResults: $totalResults, articles: $articles)';
}


}

/// @nodoc
abstract mixin class _$ArticleModelCopyWith<$Res> implements $ArticleModelCopyWith<$Res> {
  factory _$ArticleModelCopyWith(_ArticleModel value, $Res Function(_ArticleModel) _then) = __$ArticleModelCopyWithImpl;
@override @useResult
$Res call({
 String? status, int? totalResults, List<ArticleModelList>? articles
});




}
/// @nodoc
class __$ArticleModelCopyWithImpl<$Res>
    implements _$ArticleModelCopyWith<$Res> {
  __$ArticleModelCopyWithImpl(this._self, this._then);

  final _ArticleModel _self;
  final $Res Function(_ArticleModel) _then;

/// Create a copy of ArticleModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? status = freezed,Object? totalResults = freezed,Object? articles = freezed,}) {
  return _then(_ArticleModel(
status: freezed == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as String?,totalResults: freezed == totalResults ? _self.totalResults : totalResults // ignore: cast_nullable_to_non_nullable
as int?,articles: freezed == articles ? _self._articles : articles // ignore: cast_nullable_to_non_nullable
as List<ArticleModelList>?,
  ));
}


}


/// @nodoc
mixin _$ArticleModelList {

 SourceModel? get source; String? get author; String? get title; String? get description; String? get url; String? get urlToImage; DateTime? get publishedAt; String? get content;
/// Create a copy of ArticleModelList
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ArticleModelListCopyWith<ArticleModelList> get copyWith => _$ArticleModelListCopyWithImpl<ArticleModelList>(this as ArticleModelList, _$identity);

  /// Serializes this ArticleModelList to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ArticleModelList&&(identical(other.source, source) || other.source == source)&&(identical(other.author, author) || other.author == author)&&(identical(other.title, title) || other.title == title)&&(identical(other.description, description) || other.description == description)&&(identical(other.url, url) || other.url == url)&&(identical(other.urlToImage, urlToImage) || other.urlToImage == urlToImage)&&(identical(other.publishedAt, publishedAt) || other.publishedAt == publishedAt)&&(identical(other.content, content) || other.content == content));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,source,author,title,description,url,urlToImage,publishedAt,content);

@override
String toString() {
  return 'ArticleModelList(source: $source, author: $author, title: $title, description: $description, url: $url, urlToImage: $urlToImage, publishedAt: $publishedAt, content: $content)';
}


}

/// @nodoc
abstract mixin class $ArticleModelListCopyWith<$Res>  {
  factory $ArticleModelListCopyWith(ArticleModelList value, $Res Function(ArticleModelList) _then) = _$ArticleModelListCopyWithImpl;
@useResult
$Res call({
 SourceModel? source, String? author, String? title, String? description, String? url, String? urlToImage, DateTime? publishedAt, String? content
});


$SourceModelCopyWith<$Res>? get source;

}
/// @nodoc
class _$ArticleModelListCopyWithImpl<$Res>
    implements $ArticleModelListCopyWith<$Res> {
  _$ArticleModelListCopyWithImpl(this._self, this._then);

  final ArticleModelList _self;
  final $Res Function(ArticleModelList) _then;

/// Create a copy of ArticleModelList
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? source = freezed,Object? author = freezed,Object? title = freezed,Object? description = freezed,Object? url = freezed,Object? urlToImage = freezed,Object? publishedAt = freezed,Object? content = freezed,}) {
  return _then(_self.copyWith(
source: freezed == source ? _self.source : source // ignore: cast_nullable_to_non_nullable
as SourceModel?,author: freezed == author ? _self.author : author // ignore: cast_nullable_to_non_nullable
as String?,title: freezed == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String?,description: freezed == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String?,url: freezed == url ? _self.url : url // ignore: cast_nullable_to_non_nullable
as String?,urlToImage: freezed == urlToImage ? _self.urlToImage : urlToImage // ignore: cast_nullable_to_non_nullable
as String?,publishedAt: freezed == publishedAt ? _self.publishedAt : publishedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,content: freezed == content ? _self.content : content // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}
/// Create a copy of ArticleModelList
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$SourceModelCopyWith<$Res>? get source {
    if (_self.source == null) {
    return null;
  }

  return $SourceModelCopyWith<$Res>(_self.source!, (value) {
    return _then(_self.copyWith(source: value));
  });
}
}


/// Adds pattern-matching-related methods to [ArticleModelList].
extension ArticleModelListPatterns on ArticleModelList {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ArticleModelList value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ArticleModelList() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ArticleModelList value)  $default,){
final _that = this;
switch (_that) {
case _ArticleModelList():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ArticleModelList value)?  $default,){
final _that = this;
switch (_that) {
case _ArticleModelList() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( SourceModel? source,  String? author,  String? title,  String? description,  String? url,  String? urlToImage,  DateTime? publishedAt,  String? content)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ArticleModelList() when $default != null:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( SourceModel? source,  String? author,  String? title,  String? description,  String? url,  String? urlToImage,  DateTime? publishedAt,  String? content)  $default,) {final _that = this;
switch (_that) {
case _ArticleModelList():
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( SourceModel? source,  String? author,  String? title,  String? description,  String? url,  String? urlToImage,  DateTime? publishedAt,  String? content)?  $default,) {final _that = this;
switch (_that) {
case _ArticleModelList() when $default != null:
return $default(_that.source,_that.author,_that.title,_that.description,_that.url,_that.urlToImage,_that.publishedAt,_that.content);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _ArticleModelList implements ArticleModelList {
  const _ArticleModelList({this.source, this.author, this.title, this.description, this.url, this.urlToImage, this.publishedAt, this.content});
  factory _ArticleModelList.fromJson(Map<String, dynamic> json) => _$ArticleModelListFromJson(json);

@override final  SourceModel? source;
@override final  String? author;
@override final  String? title;
@override final  String? description;
@override final  String? url;
@override final  String? urlToImage;
@override final  DateTime? publishedAt;
@override final  String? content;

/// Create a copy of ArticleModelList
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ArticleModelListCopyWith<_ArticleModelList> get copyWith => __$ArticleModelListCopyWithImpl<_ArticleModelList>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ArticleModelListToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ArticleModelList&&(identical(other.source, source) || other.source == source)&&(identical(other.author, author) || other.author == author)&&(identical(other.title, title) || other.title == title)&&(identical(other.description, description) || other.description == description)&&(identical(other.url, url) || other.url == url)&&(identical(other.urlToImage, urlToImage) || other.urlToImage == urlToImage)&&(identical(other.publishedAt, publishedAt) || other.publishedAt == publishedAt)&&(identical(other.content, content) || other.content == content));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,source,author,title,description,url,urlToImage,publishedAt,content);

@override
String toString() {
  return 'ArticleModelList(source: $source, author: $author, title: $title, description: $description, url: $url, urlToImage: $urlToImage, publishedAt: $publishedAt, content: $content)';
}


}

/// @nodoc
abstract mixin class _$ArticleModelListCopyWith<$Res> implements $ArticleModelListCopyWith<$Res> {
  factory _$ArticleModelListCopyWith(_ArticleModelList value, $Res Function(_ArticleModelList) _then) = __$ArticleModelListCopyWithImpl;
@override @useResult
$Res call({
 SourceModel? source, String? author, String? title, String? description, String? url, String? urlToImage, DateTime? publishedAt, String? content
});


@override $SourceModelCopyWith<$Res>? get source;

}
/// @nodoc
class __$ArticleModelListCopyWithImpl<$Res>
    implements _$ArticleModelListCopyWith<$Res> {
  __$ArticleModelListCopyWithImpl(this._self, this._then);

  final _ArticleModelList _self;
  final $Res Function(_ArticleModelList) _then;

/// Create a copy of ArticleModelList
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? source = freezed,Object? author = freezed,Object? title = freezed,Object? description = freezed,Object? url = freezed,Object? urlToImage = freezed,Object? publishedAt = freezed,Object? content = freezed,}) {
  return _then(_ArticleModelList(
source: freezed == source ? _self.source : source // ignore: cast_nullable_to_non_nullable
as SourceModel?,author: freezed == author ? _self.author : author // ignore: cast_nullable_to_non_nullable
as String?,title: freezed == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String?,description: freezed == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String?,url: freezed == url ? _self.url : url // ignore: cast_nullable_to_non_nullable
as String?,urlToImage: freezed == urlToImage ? _self.urlToImage : urlToImage // ignore: cast_nullable_to_non_nullable
as String?,publishedAt: freezed == publishedAt ? _self.publishedAt : publishedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,content: freezed == content ? _self.content : content // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

/// Create a copy of ArticleModelList
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$SourceModelCopyWith<$Res>? get source {
    if (_self.source == null) {
    return null;
  }

  return $SourceModelCopyWith<$Res>(_self.source!, (value) {
    return _then(_self.copyWith(source: value));
  });
}
}


/// @nodoc
mixin _$SourceModel {

 String? get id; String? get name;
/// Create a copy of SourceModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SourceModelCopyWith<SourceModel> get copyWith => _$SourceModelCopyWithImpl<SourceModel>(this as SourceModel, _$identity);

  /// Serializes this SourceModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SourceModel&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,name);

@override
String toString() {
  return 'SourceModel(id: $id, name: $name)';
}


}

/// @nodoc
abstract mixin class $SourceModelCopyWith<$Res>  {
  factory $SourceModelCopyWith(SourceModel value, $Res Function(SourceModel) _then) = _$SourceModelCopyWithImpl;
@useResult
$Res call({
 String? id, String? name
});




}
/// @nodoc
class _$SourceModelCopyWithImpl<$Res>
    implements $SourceModelCopyWith<$Res> {
  _$SourceModelCopyWithImpl(this._self, this._then);

  final SourceModel _self;
  final $Res Function(SourceModel) _then;

/// Create a copy of SourceModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = freezed,Object? name = freezed,}) {
  return _then(_self.copyWith(
id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String?,name: freezed == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [SourceModel].
extension SourceModelPatterns on SourceModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _SourceModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _SourceModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _SourceModel value)  $default,){
final _that = this;
switch (_that) {
case _SourceModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _SourceModel value)?  $default,){
final _that = this;
switch (_that) {
case _SourceModel() when $default != null:
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
case _SourceModel() when $default != null:
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
case _SourceModel():
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
case _SourceModel() when $default != null:
return $default(_that.id,_that.name);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _SourceModel implements SourceModel {
  const _SourceModel({this.id, this.name});
  factory _SourceModel.fromJson(Map<String, dynamic> json) => _$SourceModelFromJson(json);

@override final  String? id;
@override final  String? name;

/// Create a copy of SourceModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$SourceModelCopyWith<_SourceModel> get copyWith => __$SourceModelCopyWithImpl<_SourceModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$SourceModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _SourceModel&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,name);

@override
String toString() {
  return 'SourceModel(id: $id, name: $name)';
}


}

/// @nodoc
abstract mixin class _$SourceModelCopyWith<$Res> implements $SourceModelCopyWith<$Res> {
  factory _$SourceModelCopyWith(_SourceModel value, $Res Function(_SourceModel) _then) = __$SourceModelCopyWithImpl;
@override @useResult
$Res call({
 String? id, String? name
});




}
/// @nodoc
class __$SourceModelCopyWithImpl<$Res>
    implements _$SourceModelCopyWith<$Res> {
  __$SourceModelCopyWithImpl(this._self, this._then);

  final _SourceModel _self;
  final $Res Function(_SourceModel) _then;

/// Create a copy of SourceModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = freezed,Object? name = freezed,}) {
  return _then(_SourceModel(
id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String?,name: freezed == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on
