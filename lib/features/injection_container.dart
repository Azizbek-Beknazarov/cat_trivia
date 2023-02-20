import 'package:cat_trivia/features/data/datasourse/cat_remote_ds.dart';
import 'package:cat_trivia/features/data/repository/cat_repo_impl.dart';
import 'package:cat_trivia/features/data/repository/image_repo_impl.dart';
import 'package:cat_trivia/features/domain/repository/cat_repo.dart';
import 'package:cat_trivia/features/domain/repository/image_repo.dart';
import 'package:cat_trivia/features/domain/usecase/get_facts_usecase.dart';
import 'package:cat_trivia/features/domain/usecase/get_one_fact_usecase.dart';
import 'package:cat_trivia/features/presentation/bloc/cat_bloc.dart';
import 'package:cat_trivia/features/presentation/bloc/image_bloc/image_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';

import '../core/network/network_info.dart';
import 'package:http/http.dart' as http;

import 'data/datasourse/image_remote_ds.dart';
import 'domain/usecase/image_usecase.dart';

final GetIt sl = GetIt.instance;

Future<void> init() async {
  //bloc
  sl.registerFactory(() => CatBloc(sl(),sl()));
  sl.registerFactory(() => ImageBloc(sl()));

  //usecase
  sl.registerLazySingleton(() => GetFacts(repo: sl()));
  sl.registerLazySingleton(() => GetOneFact(repo: sl()));

  sl.registerLazySingleton(() => GetImageUseCase(repo: sl()));



  //repo
  sl.registerLazySingleton<CatRepo>(
    () => CatRepoImpl(remoteDS: sl(), info: sl()),
  );
  sl.registerLazySingleton<ImageRepo>(
        () => ImageRepoImpl(remoteDS: sl(), info: sl()),
  );

  //datasource
  sl.registerLazySingleton<CatRemoteDataSource>(
    () => CatRemoteDataSourceImple(client: sl()),
  );
  sl.registerLazySingleton<ImageRemoteDataSource>(
    () => ImageRemoteDataSourceImpl(client: sl()),
  );

  //external
  sl.registerLazySingleton<NetworkInfo>(() => NetworkInfoImpl(sl()));

  sl.registerLazySingleton(() => http.Client());

  sl.registerLazySingleton(() => InternetConnectionChecker());
}
