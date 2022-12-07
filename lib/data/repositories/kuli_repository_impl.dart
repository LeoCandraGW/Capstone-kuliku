import 'dart:io';

import 'package:capstone_kuliku/common/exception.dart';
import 'package:capstone_kuliku/common/failure.dart';
import 'package:capstone_kuliku/data/datasource/kuli_remote_datasource.dart';
import 'package:capstone_kuliku/domain/entities/kuli.dart';
import 'package:capstone_kuliku/domain/entities/kuli_detail.dart';
import 'package:capstone_kuliku/domain/repositories/kuli_repository.dart';
import 'package:dartz/dartz.dart';

class KuliRepositoryImpl implements KuliRepository {
  final KuliRemoteDataSource remoteDataSource;

  KuliRepositoryImpl({required this.remoteDataSource});

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
}
