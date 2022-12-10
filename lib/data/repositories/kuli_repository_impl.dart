import 'dart:io';

import 'package:capstone_kuliku/common/exception.dart';
import 'package:capstone_kuliku/common/failure.dart';
import 'package:capstone_kuliku/data/datasource/kuli_local_datasource.dart';
import 'package:capstone_kuliku/data/datasource/kuli_remote_datasource.dart';
import 'package:capstone_kuliku/data/models/kuli_table.dart';
import 'package:capstone_kuliku/domain/entities/kuli.dart';
import 'package:capstone_kuliku/domain/entities/kuli_detail.dart';
import 'package:capstone_kuliku/domain/repositories/kuli_repository.dart';
import 'package:dartz/dartz.dart';

class KuliRepositoryImpl implements KuliRepository {
  final KuliRemoteDataSource remoteDataSource;
  final KuliLocalDataSource localDataSource;

  KuliRepositoryImpl({required this.remoteDataSource, required this.localDataSource,});

  @override
  Future<Either<Failure, List<Kuli>>> getKuliList() async {
    try {
      final result = await remoteDataSource.getListKuli();
      return Right(result.map((model) => model.toEntity()).toList());
    } on ServerException {
      return Left(ServerFailure(''));
    } on SocketException {
      return Left(ConnectionFailure('Failed to connect to the network'));
    }
  }

  @override
  Future<Either<Failure, KuliDetail>> getDetailKuli(int id) async {
    try {
      final result = await remoteDataSource.getDetailKuli(id);
      return Right(result.toEntity());
    } on ServerException {
      return Left(ServerFailure(''));
    } on SocketException {
      return Left(ConnectionFailure('Failed to connect to the network'));
    }
  }

  @override
  Future<Either<Failure, List<Kuli>>> getKuliSkillList(String skill) async {
    try {
      final result = await remoteDataSource.getListKuliSkill(skill);
      return Right(result.map((model) => model.toEntity()).toList());
    } on ServerException {
      return Left(ServerFailure(''));
    } on SocketException {
      return Left(ConnectionFailure('Failed to connect to the network'));
    }
  }

  @override
  Future<Either<Failure, String>> saveFavorite(KuliDetail kuli) async {
    try {
      final result =
          await localDataSource.insertFavorite(KuliTable.fromEntity(kuli));
      return Right(result);
    } on DatabaseException catch (e) {
      return Left(DatabaseFailure(e.message));
    } catch (e) {
      throw e;
    }
  }

  @override
  Future<Either<Failure, String>> removeFavorite(KuliDetail kuli) async {
    try {
      final result =
          await localDataSource.removeFavorite(KuliTable.fromEntity(kuli));
      return Right(result);
    } on DatabaseException catch (e) {
      return Left(DatabaseFailure(e.message));
    }
  }

  @override
  Future<bool> isAddedToFavorite(int id) async {
    final result = await localDataSource.getKuliById(id);
    return result != null;
  }

  @override
  Future<Either<Failure, List<Kuli>>> getKuliFavorite() async {
    final result = await localDataSource.getFavoriteKuli();
    return Right(result.map((data) => data.toEntity()).toList());
  }
}
