import 'package:capstone_kuliku/data/datasource/carousel_remote_datasource.dart';
import 'package:capstone_kuliku/data/datasource/db/database_helper.dart';
import 'package:capstone_kuliku/data/datasource/kuli_local_datasource.dart';
import 'package:capstone_kuliku/data/datasource/kuli_remote_datasource.dart';
import 'package:capstone_kuliku/data/repositories/carousel_repository_impl.dart';
import 'package:capstone_kuliku/data/repositories/kuli_repository_impl.dart';
import 'package:capstone_kuliku/domain/repositories/carousel_repository.dart';
import 'package:capstone_kuliku/domain/repositories/kuli_repository.dart';
import 'package:capstone_kuliku/domain/usecases/get_carousel_list.dart';
import 'package:capstone_kuliku/domain/usecases/get_favourite_kuli.dart';
import 'package:capstone_kuliku/domain/usecases/get_favourite_status.dart';
import 'package:capstone_kuliku/domain/usecases/get_kuli_list.dart';
import 'package:capstone_kuliku/domain/usecases/get_kuli_skill.dart';
import 'package:capstone_kuliku/domain/usecases/remove_favourite.dart';
import 'package:capstone_kuliku/domain/usecases/save_favourite.dart';
import 'package:capstone_kuliku/presentation/bloc/carousel_bloc/carousel_bloc.dart';
import 'package:capstone_kuliku/presentation/bloc/kuli_bloc/kuli_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:http/io_client.dart';

import 'domain/usecases/get_kuli_detail.dart';

final locator = GetIt.instance;

void init() {
  //kuli
  locator.registerFactory(() => GetKuliListBloc(locator()));
  locator.registerFactory(() => DetailKuliBloc(locator()));
  locator.registerFactory(() => GetKuliSkillListBloc(locator()));
  locator.registerFactory(() => KuliFavoriteBloc(
        locator(),
        locator(),
        locator(),
        locator(),
      ));
  //carousel
  locator.registerFactory(() => GetCarouselListBloc(locator()));

  //use case
  locator.registerLazySingleton(() => GetKuliList(locator()));
  locator.registerLazySingleton(() => GetDetailKuli(locator()));
  locator.registerLazySingleton(() => GetKuliSkillList(locator()));
  locator.registerLazySingleton(() => SaveFavorite(locator()));
  locator.registerLazySingleton(() => RemoveFavorite(locator()));
  locator.registerLazySingleton(() => GetFavoriteStatus(locator()));
  locator.registerLazySingleton(() => GetFavoriteKuli(locator()));
  locator.registerLazySingleton(() => GetCarouselList(locator()));

  // repository
  locator.registerLazySingleton<KuliRepository>(() => KuliRepositoryImpl(
      remoteDataSource: locator(), localDataSource: locator()));
  locator.registerLazySingleton<CarouselRepository>(
      () => CarouselRepositoryImpl(remoteDataSource: locator()));

  //data source
  locator.registerLazySingleton<KuliRemoteDataSource>(
      () => KuliRemoteDataSourceImpl(client: locator()));
  locator.registerLazySingleton<KuliLocalDataSource>(
      () => KuliLocalDataSourceImpl(databaseHelper: locator()));
  locator.registerLazySingleton<CarouselRemoteDataSource>(
      () => CarouselRemoteDataSourceImpl(client: locator()));

  //helper
  locator.registerLazySingleton<DatabaseHelper>(() => DatabaseHelper());
  // external
  locator.registerLazySingleton(() => IOClient());
}
