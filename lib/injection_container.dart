import 'package:clean_architecture/features/daily_news/data/data_sources/remote/news_api_service.dart';
import 'package:clean_architecture/features/daily_news/data/repository/article_repository_impl.dart';
import 'package:clean_architecture/features/daily_news/domain/usecases/get_article.dart';
import 'package:clean_architecture/features/daily_news/presentation/bloc/article/remote/bloc/remote_article_bloc.dart';
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';

import 'features/daily_news/domain/repository/article_repository.dart';

final sl = GetIt.instance; //Service Locator

Future<void> init() async {
  //! Features - Posts
  // sl.registerLazySingleton(() => PostsRepository());
  // sl.registerLazySingleton(() => PostsRemoteDataSource());
  // sl.registerLazySingleton(() => PostsLocalDataSource());

  // sl.registerLazySingleton(() => PostsBloc());

  sl.registerSingleton<Dio>(Dio());
  sl.registerSingleton<NewsApiService>(NewsApiService(sl()));

  sl.registerSingleton<ArticleRepository>(ArticleRepositoryImpl(sl()));

  // UserCases
  sl.registerSingleton(GetArticleUseCase(sl()));

  // Blocs
  sl.registerFactory<RemoteArticleBloc>(() => RemoteArticleBloc(sl()));
}
