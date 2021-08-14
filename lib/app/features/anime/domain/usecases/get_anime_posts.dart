import '../domain.dart';

abstract class GetAnimePost {
  Future<AnimePostReturn> call({required AnimePostDto dto});
}

class GetAnimePostImpl extends GetAnimePost {
  final AnimeRepository repository;

  GetAnimePostImpl({required this.repository});

  @override
  Future<AnimePostReturn> call({required AnimePostDto dto}) async {
    if (dto.page < 1) {
      return Left(ServerFailure());
    }
    return repository.getAnimePosts(dto: dto);
  }
}
