import 'package:cat_trivia/features/data/datasourse/cat_remote_ds.dart';
import 'package:cat_trivia/features/data/repository/cat_repo_impl.dart';
import 'package:cat_trivia/features/domain/repository/cat_repo.dart';
import 'package:cat_trivia/features/domain/usecase/get_facts_usecase.dart';
import 'package:cat_trivia/features/presentation/bloc/cat_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';

import '../core/network/network_info.dart';
import 'package:http/http.dart' as http;

final GetIt sl = GetIt.instance;

Future<void> init() async {
  sl.registerFactory(() => CatBloc(sl()));

  sl.registerLazySingleton(() => GetFacts(repo: sl()));

  sl.registerLazySingleton<CatRepo>(
    () => CatRepoImpl(remoteDS: sl(), info: sl()),
  );

  sl.registerLazySingleton<CatRemoteDataSource>(
    () => CatRemoteDataSourceImple(client: sl()),
  );

  sl.registerLazySingleton<NetworkInfo>(() => NetworkInfoImpl(sl()));

  sl.registerLazySingleton(() => http.Client());

  sl.registerLazySingleton(() => InternetConnectionChecker());
}
