import '../infra.dart';

abstract class AnimeRemoteDataSource {
  Future<List<AnimeEntity>> getAnimePosts({required AnimePostDto dto});
}
