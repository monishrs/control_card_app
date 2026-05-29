import 'package:control_card_prototype/core/constants/enums.dart';
import 'package:control_card_prototype/domain/entities/article_entity.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'remote_article_state.freezed.dart';

@freezed
class RemoteArticleState with _$RemoteArticleState {
  const factory RemoteArticleState.initial() = RemoteArticleInitialState;
  const factory RemoteArticleState.loading() = RemoteArticleLoadingState;
  const factory RemoteArticleState.success(ArticleEntity articleEntity) =
      RemoteArticleSuccessState;
  const factory RemoteArticleState.error(StatusCode? error) =
      RemoteArticleErrorState;
}
