import 'package:capstone_kuliku/data/datasource/db/database_helper.dart';
import 'package:capstone_kuliku/data/datasource/kuli_local_datasource.dart';
import 'package:capstone_kuliku/data/datasource/kuli_remote_datasource.dart';
import 'package:capstone_kuliku/data/repositories/kuli_repository_impl.dart';
import 'package:capstone_kuliku/domain/repositories/kuli_repository.dart';
import 'package:capstone_kuliku/domain/usecases/get_favorite_kuli.dart';
import 'package:capstone_kuliku/domain/usecases/get_favorite_status.dart';
import 'package:capstone_kuliku/domain/usecases/get_kuli_list.dart';
import 'package:capstone_kuliku/domain/usecases/remove_favorite.dart';
import 'package:capstone_kuliku/domain/usecases/save_favorite.dart';
import 'package:capstone_kuliku/presentation/bloc/kuli_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:http/io_client.dart';

import 'domain/usecases/get_kuli_detail.dart';

final locator = GetIt.instance;

void init() {
  //bloc
  locator.registerFactory(() => GetKuliListBloc(locator()));
  locator.registerFactory(() => DetailKuliBloc(locator()));
  locator.registerFactory(() => KuliFavoriteBloc(
        locator(),
        locator(),
        locator(),
        locator(),
      ));

  //use case
  locator.registerLazySingleton(() => GetKuliList(locator()));
  locator.registerLazySingleton(() => GetDetailKuli(locator()));
  locator.registerLazySingleton(() => SaveFavorite(locator()));
  locator.registerLazySingleton(() => RemoveFavorite(locator()));
  locator.registerLazySingleton(() => GetFavoriteStatus(locator()));
  locator.registerLazySingleton(() => GetFavoriteKuli(locator()));

  // repository
  locator.registerLazySingleton<KuliRepository>(() => KuliRepositoryImpl(
      remoteDataSource: locator(), localDataSource: locator()));

  //data source
  locator.registerLazySingleton<KuliRemoteDataSource>(
      () => KuliRemoteDataSourceImpl(client: locator()));
  locator.registerLazySingleton<KuliLocalDataSource>(
      () => KuliLocalDataSourceImpl(databaseHelper: locator()));

  //helper
  locator.registerLazySingleton<DatabaseHelper>(() => DatabaseHelper());
  // external
  locator.registerLazySingleton(() => IOClient());
}
