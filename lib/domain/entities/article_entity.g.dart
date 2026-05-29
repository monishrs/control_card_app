// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'article_entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_ArticleEntity _$ArticleEntityFromJson(Map<String, dynamic> json) =>
    _ArticleEntity(
      status: json['status'] as String?,
      totalResults: (json['totalResults'] as num?)?.toInt(),
      articles: (json['articles'] as List<dynamic>?)
          ?.map((e) => ArticleEntityList.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$ArticleEntityToJson(_ArticleEntity instance) =>
    <String, dynamic>{
      'status': instance.status,
      'totalResults': instance.totalResults,
      'articles': instance.articles,
    };

_ArticleEntityList _$ArticleEntityListFromJson(Map<String, dynamic> json) =>
    _ArticleEntityList(
      source: json['source'] == null
          ? null
          : SourceEntity.fromJson(json['source'] as Map<String, dynamic>),
      author: json['author'] as String?,
      title: json['title'] as String?,
      description: json['description'] as String?,
      url: json['url'] as String?,
      urlToImage: json['urlToImage'] as String?,
      publishedAt: json['publishedAt'] == null
          ? null
          : DateTime.parse(json['publishedAt'] as String),
      content: json['content'] as String?,
    );

Map<String, dynamic> _$ArticleEntityListToJson(_ArticleEntityList instance) =>
    <String, dynamic>{
      'source': instance.source,
      'author': instance.author,
      'title': instance.title,
      'description': instance.description,
      'url': instance.url,
      'urlToImage': instance.urlToImage,
      'publishedAt': instance.publishedAt?.toIso8601String(),
      'content': instance.content,
    };

_SourceEntity _$SourceEntityFromJson(Map<String, dynamic> json) =>
    _SourceEntity(id: json['id'] as String?, name: json['name'] as String?);

Map<String, dynamic> _$SourceEntityToJson(_SourceEntity instance) =>
    <String, dynamic>{'id': instance.id, 'name': instance.name};
