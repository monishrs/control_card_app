import 'package:control_card_prototype/data/models/article_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'article_entity.freezed.dart';
part 'article_entity.g.dart';

@freezed
abstract class ArticleEntity with _$ArticleEntity {
  const factory ArticleEntity({
    String? status,
    int? totalResults,
    List<ArticleEntityList>? articles,
  }) = _ArticleEntity;

  factory ArticleEntity.fromJson(Map<String, dynamic> json) =>
      _$ArticleEntityFromJson(json);

  factory ArticleEntity.fromModel(ArticleModel model) => ArticleEntity(
    status: model.status,
    totalResults: model.totalResults,
    articles: model.articles?.map(ArticleEntityList.fromModel).toList(),
  );
}

@freezed
abstract class ArticleEntityList with _$ArticleEntityList {
  const factory ArticleEntityList({
    SourceEntity? source,
    String? author,
    String? title,
    String? description,
    String? url,
    String? urlToImage,
    DateTime? publishedAt,
    String? content,
  }) = _ArticleEntityList;

  factory ArticleEntityList.fromJson(Map<String, dynamic> json) =>
      _$ArticleEntityListFromJson(json);

  factory ArticleEntityList.fromModel(ArticleModelList model) =>
      ArticleEntityList(
        source: model.source != null
            ? SourceEntity.fromModel(model.source!)
            : null,
        author: model.author,
        title: model.title,
        description: model.description,
        url: model.url,
        urlToImage: model.urlToImage,
        publishedAt: model.publishedAt,
        content: model.content,
      );
}

@freezed
abstract class SourceEntity with _$SourceEntity {
  const factory SourceEntity({String? id, String? name}) = _SourceEntity;

  factory SourceEntity.fromJson(Map<String, dynamic> json) =>
      _$SourceEntityFromJson(json);

  factory SourceEntity.fromModel(SourceModel model) =>
      SourceEntity(id: model.id, name: model.name);
}
