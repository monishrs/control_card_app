import 'package:control_card_prototype/core/constants/constants.dart';
import 'package:control_card_prototype/core/constants/enums.dart';
import 'package:control_card_prototype/core/resources/data_state.dart';
import 'package:control_card_prototype/core/utils/response_handler.dart';
import 'package:control_card_prototype/data/data_sources/remote/news_api_service.dart';
import 'package:control_card_prototype/data/models/article_model.dart'; // Assuming you have an ArticleModel
import 'package:control_card_prototype/domain/entities/article_entity.dart';
import 'package:control_card_prototype/domain/repository/article_repository.dart';
import 'package:retrofit/retrofit.dart';

class ArticleRepositoryImpl implements ArticleRepository {
  ArticleRepositoryImpl(this._newsApiService);
  final NewsApiService _newsApiService;

  @override
  Future<DataState<ArticleEntity>> getNewsArticle() async {
    if (newsAPIKey.isEmpty) {
      return DataFailed<ArticleEntity>(status: StatusCode.internalError);
    }

    return await safeApiCall<ArticleEntity>(checkInternet: true, () async {
      final HttpResponse<ArticleModel> httpResponse = await _newsApiService
          .getNewsArticle(
            apiKey: newsAPIKey,
            category: categoryQuery,
            country: countryQuery,
          );

      final DataState<ArticleEntity> result =
          handleResponse<ArticleModel, ArticleEntity>(
            response: httpResponse,
            toEntity: ArticleEntity.fromModel,
          );
      return result;
    });
  }
}
