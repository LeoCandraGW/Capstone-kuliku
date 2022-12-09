import 'package:capstone_kuliku/domain/entities/carousel.dart';
import 'package:capstone_kuliku/domain/entities/customer.dart';

import '../../common/failure.dart';
import 'package:dartz/dartz.dart';

abstract class CarouselRepository {
  Future<Either<Failure, List<Carousel>>> getCarouselList();
}
