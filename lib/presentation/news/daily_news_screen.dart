import 'package:flutter/material.dart';
import 'package:control_card_prototype/config/localization/l10n/app_localizations.dart';
import 'package:control_card_prototype/core/common_widgets/common_loading_widget.dart';
import 'package:control_card_prototype/core/utils/response_status_manager.dart';
import 'package:control_card_prototype/core/utils/toast_utils.dart';
import 'package:control_card_prototype/domain/entities/article_entity.dart';
import 'package:control_card_prototype/presentation/news/cubits/remote_article_cubit.dart';
import 'package:control_card_prototype/presentation/news/cubits/remote_article_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DailyNews extends StatefulWidget {
  const DailyNews({super.key});

  @override
  State<DailyNews> createState() => _DailyNewsState();
}

class _DailyNewsState extends State<DailyNews> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) => _fetchArticles());
  }

  void _fetchArticles() {
    BlocProvider.of<RemoteArticleCubit>(context).getArticleList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(context),
      body: BlocConsumer<RemoteArticleCubit, RemoteArticleState>(
        listener: (BuildContext context, RemoteArticleState state) {
          state.map(
            loading: (_) => CommonLoadingWidget.show(context),
            success: (_) => CommonLoadingWidget.hide(context),
            error: (RemoteArticleErrorState state) {
              CommonLoadingWidget.hide(context);
              final String msg = StatusMessageMapper.getMessage(
                context,
                statusCode: state.error,
              );
              ToastUtil.showMessage(context, text: msg);
            },
            initial: (_) => CommonLoadingWidget.hide(context),
          );
        },
        builder: (BuildContext context, RemoteArticleState state) {
          return state.map(
            initial: (_) => _buildInitialOrEmptyWidget(),
            loading: (_) => _buildInitialOrEmptyWidget(),
            success: (RemoteArticleSuccessState state) => _buildSuccessWidget(state.articleEntity),
            error: (_) => _buildInitialOrEmptyWidget(),
          );
        },
      ),
    );
  }

  PreferredSizeWidget _buildAppBar(BuildContext context) {
    return AppBar(
      title: Text(
        AppLocalizations.of(context)!.app_name,
        style: const TextStyle(color: Colors.orange),
      ),
    );
  }

  Widget _buildSuccessWidget(ArticleEntity? articleEntity) {
    if (articleEntity != null &&
        articleEntity.articles != null &&
        articleEntity.articles!.isNotEmpty) {
      final List<ArticleEntityList> articles = articleEntity.articles!;
      return ListView.builder(
        itemCount: articles.length,
        itemBuilder: (BuildContext context, int index) {
          final ArticleEntityList article = articles[index];
          return ListTile(
            title: Text(
              article.title ?? AppLocalizations.of(context)!.noTitleAvailable,
            ),
            subtitle: article.description != null
                ? Text(article.description!)
                : null,
            leading: article.urlToImage != null
                ? Image.network(
                    article.urlToImage!,
                    width: 60,
                    height: 60,
                    fit: BoxFit.cover,
                    errorBuilder: (BuildContext context, Object error, StackTrace? stackTrace) =>
                        const Icon(Icons.error),
                  )
                : null,
          );
        },
      );
    } else {
      return Center(child: Text(AppLocalizations.of(context)!.noArticlesFound));
    }
  }

  Widget _buildInitialOrEmptyWidget() {
    return Container(); // also empty
  }
}
