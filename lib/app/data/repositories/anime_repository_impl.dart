import 'package:dartz/dartz.dart';

import '../../core/errors/exceptions.dart';
import '../../core/errors/failures.dart';
import '../../domain/entities/anime_entity.dart';
import '../../domain/repositories/anime_repository.dart';
import '../datasources/anime_remote_data_source.dart';

class AnimeRepositoryImpl implements AnimeRepository {
  final AnimeRemoteDataSource dataSource;

  AnimeRepositoryImpl({required this.dataSource});

  @override
  Future<Either<Failure, List<AnimeEntity>>> getAnimePosts({required int page}) async {
    try {
      final response = await dataSource.getAnimePosts(page: page);
      return Right(response);
    } on ServerException {
      return Left(ServerFailure());
    } on BadRequestException {
      return Left(BadRequestFailure());
    }
  }
}
