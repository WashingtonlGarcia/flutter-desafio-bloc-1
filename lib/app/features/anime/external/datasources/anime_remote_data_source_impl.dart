import '../../../../core/http/http_client.dart';
import '../external.dart';

class AnimeRemoteDataSourceImpl extends AnimeRemoteDataSource {
  final HttpClient httpClient;

  AnimeRemoteDataSourceImpl({required this.httpClient});

  @override
  Future<List<AnimeEntity>> getAnimePosts({required AnimePostDto dto}) async {
    final HttpResponse response = await httpClient.get(url: 'https://www.intoxianime.com/?rest_route=/wp/v2/posts&page=${dto.page}&per_page=20');
    return AnimeAdapter.fromList(list: (response.data as List).cast<Map<String, dynamic>>());
  }
}
