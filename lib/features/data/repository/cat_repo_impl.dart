import 'package:cat_trivia/core/error/failures.dart';

import 'package:cat_trivia/features/domain/entity/cat_entity.dart';
import 'package:dartz/dartz.dart';

import '../../../core/error/exception.dart';
import '../../../core/network/network_info.dart';
import '../../domain/repository/cat_repo.dart';
import '../datasourse/cat_remote_ds.dart';

class CatRepoImpl implements CatRepo{
  final CatRemoteDataSource remoteDS;
  NetworkInfo info;

  CatRepoImpl({required this.remoteDS, required this.info});


  @override
  Future<Either<Failure, List<CatEntity>>> getFacts()async {
    if (await info.isConnected) {
      try {
        final result = await remoteDS.getFacts();
        return Right(result);
      } on ServerException {
        return Left(ServerFailure());
      }
    } else {
      return Left(ServerFailure());
    }
  }


}