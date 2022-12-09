import 'dart:io';

import 'package:capstone_kuliku/common/exception.dart';
import 'package:capstone_kuliku/common/failure.dart';
import 'package:capstone_kuliku/data/datasource/carousel_remote_datasource.dart';
import 'package:capstone_kuliku/data/datasource/customer_remote_datasource.dart';
import 'package:capstone_kuliku/domain/entities/carousel.dart';
import 'package:capstone_kuliku/domain/repositories/carousel_repository.dart';
import 'package:dartz/dartz.dart';

import '../../domain/entities/customer.dart';
import '../../domain/repositories/customer_repository.dart';

class CarouselRepositoryImpl implements CarouselRepository {
  final CarouselRemoteDataSource remoteDataSource;

  CarouselRepositoryImpl({required this.remoteDataSource});

  @override
  Future<Either<Failure, List<Carousel>>> getCarouselList() async {
    try {
      final result = await remoteDataSource.getListCarousel();
      return Right(result.map((model) => model.toEntity()).toList());
    } on ServerException {
      return Left(ServerFailure(''));
    } on SocketException {
      return Left(ConnectionFailure('Failed to connect to the network'));
    }
  }
}
