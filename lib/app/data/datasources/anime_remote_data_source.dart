import '../models/anime_model.dart';

abstract class AnimeRemoteDataSource {
  Future<List<AnimeModel>> getAnimePosts({required int page});
}
