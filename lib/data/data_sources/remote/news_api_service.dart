import 'package:dio/dio.dart';
import 'package:control_card_prototype/core/constants/constants.dart';
import 'package:control_card_prototype/data/models/article_model.dart';
import 'package:retrofit/retrofit.dart';

part 'news_api_service.g.dart';

@RestApi(baseUrl: baseUrl)
abstract class NewsApiService {
  factory NewsApiService(Dio dio) = _NewsApiService;

  @GET('/top-headlines')
  Future<HttpResponse<ArticleModel>> getNewsArticle({
    @Query('apiKey') String? apiKey,
    @Query('country') String? country,
    @Query('category') String? category,
  });
}
