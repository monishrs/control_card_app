import 'package:control_card_prototype/core/resources/data_state.dart';
import 'package:control_card_prototype/core/usecases/usecase.dart';
import 'package:control_card_prototype/domain/entities/article_entity.dart';
import 'package:control_card_prototype/domain/repository/article_repository.dart';

class GetArticleUseCase implements UseCase<DataState<ArticleEntity>, void> {
  GetArticleUseCase(this._articleRepository);
  final ArticleRepository _articleRepository;
  @override
  Future<DataState<ArticleEntity>> invoke({void params}) {
    return _articleRepository.getNewsArticle();
  }
}
