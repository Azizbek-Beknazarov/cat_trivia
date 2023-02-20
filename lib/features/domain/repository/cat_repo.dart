import 'package:cat_trivia/features/domain/entity/cat_entity.dart';
import 'package:dartz/dartz.dart';

import '../../../core/error/failures.dart';

abstract class CatRepo {
  Future<Either<Failure, List<CatEntity>>> getFacts();
}
