import 'package:desafio_bloc_1/app/data/datasources/anime_remote_data_source_impl.dart';
import 'package:desafio_bloc_1/app/data/repositories/anime_repository_impl.dart';
import 'package:desafio_bloc_1/app/domain/usecases/get_anime_posts.dart';
import 'package:desafio_bloc_1/app/infra/http/http_client_impl.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'presentation/routes/app_routes.dart';

class AppWidget extends StatelessWidget {
  const AppWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return RepositoryProvider(
      create: (context) =>
          GetAnimePost(repository: AnimeRepositoryImpl(dataSource: AnimeRemoteDataSourceImpl(httpClient: HttpClientImpl(dio: Dio())))),
      child: const MaterialApp(
        onGenerateRoute: AppRoutes.onGenerateRoute,
      ),
    );
  }
}
