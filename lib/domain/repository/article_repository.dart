import 'package:control_card_prototype/core/resources/data_state.dart';
import 'package:control_card_prototype/domain/entities/article_entity.dart';

abstract class ArticleRepository {
  Future<DataState<ArticleEntity>> getNewsArticle();
}
