import 'package:dartz/dartz.dart';

import 'entities/anime_entity.dart';
import 'errors/failures.dart';

export 'package:dartz/dartz.dart' hide State;

export 'dtos/anime_post_dto.dart';
export 'entities/anime_entity.dart';
export 'errors/failures.dart';
export 'repositories/anime_repository.dart';
export 'usecases/get_anime_posts.dart';

typedef AnimePostReturn = Either<Failure, List<AnimeEntity>>;
