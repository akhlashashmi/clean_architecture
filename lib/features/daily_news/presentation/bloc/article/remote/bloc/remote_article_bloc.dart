import 'dart:async';

import 'package:clean_architecture/core/resources/data_state.dart';
import 'package:clean_architecture/features/daily_news/domain/entities/article.dart';
import 'package:clean_architecture/features/daily_news/domain/usecases/get_article.dart';
import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'remote_article_event.dart';
part 'remote_article_state.dart';

class RemoteArticleBloc extends Bloc<RemoteArticleEvent, RemoteArticleState> {
  final GetArticleUseCase getArticleUseCase;
  RemoteArticleBloc(this.getArticleUseCase) : super(RemoteArticleInitial()) {
    on<ArticleFetchedEvent>(onArticleFetched);
  }

  FutureOr<void> onArticleFetched(
    ArticleFetchedEvent event,
    Emitter<RemoteArticleState> emit,
  ) async {
    emit(RemoteArticleLoading());
    final dataState = await getArticleUseCase();
    if (dataState is DataSuccess && dataState.data!.isNotEmpty) {
      emit(RemoteArticleDone(dataState.data!));
    }
    if (dataState is DataFailed) {
      emit(RemoteArticleError(dataState.error!));
    }
  }
}
