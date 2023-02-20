import 'package:dartz/dartz.dart';

import '../../../core/error/failures.dart';
import '../../../core/usecase/use_case.dart';
import '../entity/cat_entity.dart';
import '../repository/cat_repo.dart';

class GetOneFact extends UseCase<CatEntity, NoParams> {
  CatRepo repo;

  GetOneFact({required this.repo});

  @override
  Future<Either<Failure, CatEntity>> call(NoParams params) async {
    return await repo.getOneFact();
  }
}
