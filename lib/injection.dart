import 'package:capstone_kuliku/data/datasource/kuli_remote_datasource.dart';
import 'package:capstone_kuliku/data/repositories/kuli_repository_impl.dart';
import 'package:capstone_kuliku/domain/repositories/kuli_repository.dart';
import 'package:capstone_kuliku/domain/usecases/get_kuli_list.dart';
import 'package:capstone_kuliku/presentation/bloc/kuli_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:http/io_client.dart';

import 'domain/usecases/get_kuli_detail.dart';

final locator = GetIt.instance;

void init() {
  //kuli
  locator.registerFactory(() => GetKuliListBloc(locator()));
  locator.registerFactory(() => DetailKuliBloc(locator()));

  //use case
  locator.registerLazySingleton(() => GetKuliList(locator()));
  locator.registerLazySingleton(() => GetDetailKuli(locator()));

  // repository
  locator.registerLazySingleton<KuliRepository>(
      () => KuliRepositoryImpl(remoteDataSource: locator()));

  //data source
  locator.registerLazySingleton<KuliRemoteDataSource>(
    () => KuliRemoteDataSourceImpl(client: locator()));
    
  // external
  locator.registerLazySingleton(() => IOClient());
}

