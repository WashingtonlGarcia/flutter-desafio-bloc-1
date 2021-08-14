import '../../infra/http/http_client.dart';
import '../models/anime_model.dart';
import 'anime_remote_data_source.dart';

class AnimeRemoteDataSourceImpl extends AnimeRemoteDataSource {
  final HttpClient httpClient;

  AnimeRemoteDataSourceImpl({required this.httpClient});

  @override
  Future<List<AnimeModel>> getAnimePosts({required int page}) async {
    final HttpResponse response = await httpClient.get(url: 'https://www.intoxianime.com/?rest_route=/wp/v2/posts&page=$page&per_page=20');
    return (response.data as List).cast<Map<String, dynamic>>().map((Map<String, dynamic> map) => AnimeModel.fromMap(map: map)).toList();
  }
}
