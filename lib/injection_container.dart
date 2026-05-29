import 'package:dio/dio.dart';
import 'package:control_card_prototype/data/data_sources/remote/news_api_service.dart';
import 'package:control_card_prototype/data/repository/article_repository_impl.dart';
import 'package:control_card_prototype/domain/repository/article_repository.dart';
import 'package:control_card_prototype/domain/usecases/get_article_use_case.dart';
import 'package:control_card_prototype/presentation/news/cubits/remote_article_cubit.dart';
import 'package:get_it/get_it.dart';

final GetIt instance = GetIt.instance;

Future<void> initializeDependencies() async {
  final Dio dio = Dio();
  dio.interceptors.add(LogInterceptor(requestBody: true, responseBody: true));

  instance.registerSingleton<Dio>(dio);

  instance.registerSingleton<NewsApiService>(NewsApiService(instance()));

  instance.registerSingleton<ArticleRepository>(
    ArticleRepositoryImpl(instance()),
  );

  instance.registerSingleton<GetArticleUseCase>(GetArticleUseCase(instance()));

  //Blocs need to register as factory
  //Presentation bloc should not register as a singleton
  //Bloc will return the new instance when the state changes
  instance.registerFactory<RemoteArticleCubit>(
    () => RemoteArticleCubit(instance()),
  );
}
