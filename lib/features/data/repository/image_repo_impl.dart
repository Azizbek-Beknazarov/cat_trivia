import 'package:cat_trivia/core/error/failures.dart';
import 'package:cat_trivia/features/data/datasourse/image_remote_ds.dart';
import 'package:cat_trivia/features/domain/entity/random_image.dart';
import 'package:cat_trivia/features/domain/repository/image_repo.dart';
import 'package:dartz/dartz.dart';

import '../../../core/error/exception.dart';
import '../../../core/network/network_info.dart';

class ImageRepoImpl implements ImageRepo{
  final ImageRemoteDataSource remoteDS;
  NetworkInfo info;

  ImageRepoImpl({required this.remoteDS, required this.info});

  @override
  Future<Either<Failure, RandomImageEntity>> getImage()async {
    if (await info.isConnected) {
      try {
        final result = await remoteDS.getImage();
        return Right(result);
      } on ServerException {
        return Left(ServerFailure());
      }
    } else {
      return Left(ServerFailure());
    }
  }
}