import 'package:clean_architecture/features/daily_news/domain/usecases/get_article.dart';
import 'package:clean_architecture/features/daily_news/presentation/bloc/article/remote/bloc/remote_article_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DailyNews extends StatelessWidget {
  const DailyNews({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Daily News'),
      ),
      body: BlocBuilder<RemoteArticleBloc, RemoteArticleState>(

        builder: (BuildContext context, RemoteArticleState state) {
          switch (state) {
            case RemoteArticleInitial():
              return const Center(child: CircularProgressIndicator());
            case RemoteArticleLoading():
              return const Center(child: CircularProgressIndicator());
            case RemoteArticleError():
              return const Center(child: Text('Error'));
            default:
              return const Center(child: Text('Default'));
          }
        },
      ),
    );
  }
}
