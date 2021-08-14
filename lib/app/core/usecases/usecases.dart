import 'package:dartz/dartz.dart';
import '../errors/failures.dart';

abstract class Usecases<Response, P extends Params> {
  Future<Either<Failure, Response>> call({required P params});
}

abstract class Params {}

class NotParams extends Params {}
