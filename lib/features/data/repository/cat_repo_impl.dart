import 'package:cat_trivia/core/error/failures.dart';
import 'package:cat_trivia/features/data/datasourse/cat_local_ds.dart';

import 'package:cat_trivia/features/domain/entity/cat_entity.dart';
import 'package:dartz/dartz.dart';

import '../../../core/error/exception.dart';
import '../../../core/network/network_info.dart';
import '../../domain/repository/cat_repo.dart';
import '../datasourse/cat_remote_ds.dart';

class CatRepoImpl implements CatRepo {
  final CatRemoteDataSource remoteDS;
  final CatLocalDataSource localDS;
  NetworkInfo info;

  CatRepoImpl(
      {required this.remoteDS, required this.info, required this.localDS});

  @override
  Future<Either<Failure, List<CatEntity>>> getFacts() async {
    if (await info.isConnected) {
      try {
        final result = await remoteDS.getFacts();
        localDS.catToCache(result);
        return Right(result);
      } on ServerException {
        return Left(ServerFailure());
      }
    } else {
      try {
        final result = await localDS.getCatFromCache();
        return Right(result);
      } on CacheException {
        return Left(CacheFailure());
      }
    }
  }

  @override
  Future<Either<Failure, CatEntity>> getOneFact() async {
    if (await info.isConnected) {
      try {
        final result = await remoteDS.getOneFact();
        return Right(result);
      } on ServerException {
        return Left(ServerFailure());
      }
    } else {
      return Left(ServerFailure());
    }
  }
}
