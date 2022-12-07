import 'package:capstone_kuliku/domain/entities/customer.dart';
import 'package:dartz/dartz.dart';

import '../../common/failure.dart';
import '../repositories/customer_repository.dart';

class GetCustomerList {
  final CustomerRepository repository;

  GetCustomerList(this.repository);

  Future<Either<Failure, List<Customer>>> execute() {
    return repository.getCustomerList();
  }
}
