import 'package:capstone_kuliku/data/datasource/kuli_remote_datasource.dart';
import 'package:capstone_kuliku/data/repositories/kuli_repository_impl.dart';
import 'package:capstone_kuliku/domain/repositories/kuli_repository.dart';
import 'package:capstone_kuliku/presentation/bloc/kuli_bloc.dart';
import 'package:get_it/get_it.dart';

final locator = GetIt.instance;

void init() {
  //bloC
  locator.registerFactory(() => GetKuliListBloc(locator()));

  //usecase
  locator.registerLazySingleton(() => GetKuliListBloc(locator()));

  //repository
  locator.registerLazySingleton<KuliRepository>(
      () => KuliRepositoryImpl(remoteDataSource: locator()));

  //datasource
  locator.registerLazySingleton<KuliRemoteDataSource>(
      () => KuliRemoteDataSourceImpl(client: locator()));
}
