part of 'remote_article_bloc.dart';

sealed class RemoteArticleState extends Equatable {
  final DioException? error;
  final List<ArticleEntity>? articles;

  const RemoteArticleState({this.error, this.articles});

  @override
  List<Object> get props => [];
}

final class RemoteArticleInitial extends RemoteArticleState {}

final class RemoteArticleError extends RemoteArticleState {
  const RemoteArticleError(DioException error) : super(error: error);
}

final class RemoteArticleDone extends RemoteArticleState {
  const RemoteArticleDone(List<ArticleEntity> articles)
      : super(articles: articles);
}

final class RemoteArticleLoading extends RemoteArticleState {}
