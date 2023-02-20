import 'package:cat_trivia/core/error/failures.dart';
import 'package:cat_trivia/features/domain/entity/random_image.dart';
import 'package:dartz/dartz.dart';

abstract class ImageRepo{
  Future<Either<Failure, RandomImageEntity>> getImage();
}