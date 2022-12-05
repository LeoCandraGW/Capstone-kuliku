import 'package:capstone_kuliku/domain/entities/customer.dart';

import '../../common/failure.dart';
import 'package:dartz/dartz.dart';

abstract class CustomerRepository {
  Future<Either<Failure, List<Customer>>> getCustomerList();
}
