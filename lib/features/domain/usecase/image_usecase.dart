import 'package:cat_trivia/core/error/failures.dart';
import 'package:cat_trivia/core/usecase/use_case.dart';
import 'package:cat_trivia/features/domain/entity/random_image.dart';
import 'package:cat_trivia/features/domain/repository/image_repo.dart';
import 'package:dartz/dartz.dart';

class GetImageUseCase extends UseCase<RandomImageEntity, NoParams> {
  ImageRepo repo;

  GetImageUseCase({required this.repo});

  @override
  Future<Either<Failure, RandomImageEntity>> call(NoParams params) async {
    return await repo.getImage();
  }
}
