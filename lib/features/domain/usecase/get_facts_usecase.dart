import 'package:cat_trivia/core/error/failures.dart';
import 'package:cat_trivia/core/usecase/use_case.dart';
import 'package:cat_trivia/features/domain/entity/cat_entity.dart';
import 'package:cat_trivia/features/domain/repository/cat_repo.dart';
import 'package:dartz/dartz.dart';

class GetFacts extends UseCase<List<CatEntity>, NoParams> {
  CatRepo repo;

  GetFacts({required this.repo});

  @override
  Future<Either<Failure, List<CatEntity>>> call(NoParams params) async {
    return await repo.getFacts();
  }
}
