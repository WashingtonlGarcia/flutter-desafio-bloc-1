import 'package:dartz/dartz.dart';
import '../../core/errors/failures.dart';
import '../../core/usecases/usecases.dart';
import '../entities/anime_entity.dart';
import '../repositories/anime_repository.dart';

class GetAnimePost extends Usecases<List<AnimeEntity>, AnimePostParams> {
  final AnimeRepository repository;

  GetAnimePost({required this.repository});

  @override
  Future<Either<Failure, List<AnimeEntity>>> call({required AnimePostParams params}) {
    return repository.getAnimePosts(page: params.page);
  }
}

class AnimePostParams extends Params {
  final int page;

  AnimePostParams({required this.page});
}
