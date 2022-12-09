import 'package:capstone_kuliku/domain/entities/carousel.dart';
import 'package:capstone_kuliku/domain/entities/customer.dart';
import 'package:capstone_kuliku/domain/repositories/carousel_repository.dart';
import 'package:dartz/dartz.dart';

import '../../common/failure.dart';
import '../repositories/customer_repository.dart';

class GetCarouselList {
  final CarouselRepository repository;

  GetCarouselList(this.repository);

  Future<Either<Failure, List<Carousel>>> execute() {
    return repository.getCarouselList();
  }
}
