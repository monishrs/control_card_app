import 'package:control_card_prototype/domain/entities/article_entity.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'article_model.freezed.dart';

part 'article_model.g.dart';

@freezed
abstract class ArticleModel with _$ArticleModel {
  const factory ArticleModel({
    String? status,
    int? totalResults,
    List<ArticleModelList>? articles,
  }) = _ArticleModel;

  factory ArticleModel.fromJson(Map<String, dynamic> json) =>
      _$ArticleModelFromJson(json);
}

extension ArticleModelToEntity on ArticleModel {
  ArticleEntity toEntity() {
    return ArticleEntity(
      status: status,
      totalResults: totalResults,
      articles: articles?.map((ArticleModelList e) => e.toEntity()).toList(),
    );
  }
}

@freezed
abstract class ArticleModelList with _$ArticleModelList {
  const factory ArticleModelList({
    SourceModel? source,
    String? author,
    String? title,
    String? description,
    String? url,
    String? urlToImage,
    DateTime? publishedAt,
    String? content,
  }) = _ArticleModelList;

  factory ArticleModelList.fromJson(Map<String, dynamic> json) =>
      _$ArticleModelListFromJson(json);
}

extension ArticleModelListToEntity on ArticleModelList {
  ArticleEntityList toEntity() {
    return ArticleEntityList(
      source: source?.toEntity(),
      author: author,
      title: title,
      description: description,
      url: url,
      urlToImage: urlToImage,
      publishedAt: publishedAt,
      content: content,
    );
  }
}

@freezed
abstract class SourceModel with _$SourceModel {
  const factory SourceModel({String? id, String? name}) = _SourceModel;

  factory SourceModel.fromJson(Map<String, dynamic> json) =>
      _$SourceModelFromJson(json);
}

extension SourceModelToEntity on SourceModel {
  SourceEntity toEntity() {
    return SourceEntity(id: id, name: name);
  }
}
