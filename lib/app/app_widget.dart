import 'package:desafio_bloc_1/app/core/http/http_client.dart';
import 'package:desafio_bloc_1/app/core/http/http_client_impl.dart';
import 'package:desafio_bloc_1/app/features/anime/presentation/blocs/anime/anime_bloc.dart';
import 'package:desafio_bloc_1/app/features/anime/presentation/routes/app_routes.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'features/anime/external/external.dart';

class AppWidget extends StatelessWidget {
  const AppWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // DI
    return MultiRepositoryProvider(
      providers: [
        RepositoryProvider(create: (context) => Dio()),
        RepositoryProvider<HttpClient>(create: (context) => HttpClientImpl(dio: context.read())),
        RepositoryProvider<AnimeRemoteDataSource>(create: (context) => AnimeRemoteDataSourceImpl(httpClient: context.read())),
        RepositoryProvider<AnimeRepository>(create: (context) => AnimeRepositoryImpl(dataSource: context.read())),
        RepositoryProvider<GetAnimePost>(create: (context) => GetAnimePostImpl(repository: context.read())),
      ],
      child: MultiBlocProvider(
        providers: [
          BlocProvider(create: (context) => AnimeBloc(usecase: context.read())),
        ],
        child: const MaterialApp(
          title: 'Desafio Bloc 1',
          onGenerateRoute: AppRoutes.onGenerateRoute,
        ),
      ),
    );
  }
}
