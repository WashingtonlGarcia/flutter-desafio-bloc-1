import '../domain.dart';

abstract class AnimeRepository {
  Future<AnimePostReturn> getAnimePosts({required AnimePostDto dto});
}
