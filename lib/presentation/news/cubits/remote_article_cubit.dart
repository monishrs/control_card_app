import 'package:control_card_prototype/base/base_cubit.dart';
import 'package:control_card_prototype/core/resources/data_state.dart';
import 'package:control_card_prototype/domain/entities/article_entity.dart';
import 'package:control_card_prototype/domain/usecases/get_article_use_case.dart';
import 'package:control_card_prototype/presentation/news/cubits/remote_article_state.dart';

class RemoteArticleCubit extends BaseCubit<RemoteArticleState> {

  RemoteArticleCubit(this._getArticleUseCase)
    : super(const RemoteArticleState.initial());
  final GetArticleUseCase _getArticleUseCase;

  Future<void> getArticleList() async {
    if (isBusy) return;

    await run(() async {
      emit(const RemoteArticleState.loading());

      final DataState<ArticleEntity> dataState = await _getArticleUseCase.invoke();

      if (dataState is DataSuccess && dataState.data != null) {
        emit(RemoteArticleState.success(dataState.data!));
      } else if (dataState is DataFailed) {
        emit(RemoteArticleState.error(dataState.status));
      }
    });
  }
}
