import 'dart:io';

import 'package:capstone_kuliku/common/exception.dart';
import 'package:capstone_kuliku/common/failure.dart';
import 'package:capstone_kuliku/data/datasource/customer_remote_datasource.dart';
import 'package:dartz/dartz.dart';

import '../../domain/entities/customer.dart';
import '../../domain/repositories/customer_repository.dart';

class CustomerRepositoryImpl implements CustomerRepository {
  final CustomerRemoteDataSource remoteDataSource;

  CustomerRepositoryImpl({required this.remoteDataSource});

  @override
  Future<Either<Failure, List<Customer>>> getCustomerList() async {
    try {
      final result = await remoteDataSource.getListCustomer();
      return Right(result.map((model) => model.toEntity()).toList());
    } on ServerException {
      return Left(ServerFailure(''));
    } on SocketException {
      return Left(ConnectionFailure('Failed to connect to the network'));
    }
  }
}
