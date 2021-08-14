import '../infra.dart';

class AnimeRepositoryImpl implements AnimeRepository {
  final AnimeRemoteDataSource dataSource;

  AnimeRepositoryImpl({required this.dataSource});

  @override
  Future<AnimePostReturn> getAnimePosts({required AnimePostDto dto}) async {
    try {
      final response = await dataSource.getAnimePosts(dto: dto);
      return Right(response);
    } on ServerException {
      return Left(ServerFailure());
    } on BadRequestException {
      return Left(BadRequestFailure());
    }
  }
}
