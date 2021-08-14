import 'package:dartz/dartz.dart';

import '../../core/errors/failures.dart';
import '../entities/anime_entity.dart';

abstract class AnimeRepository {
  Future<Either<Failure, List<AnimeEntity>>> getAnimePosts({required int page});
}
