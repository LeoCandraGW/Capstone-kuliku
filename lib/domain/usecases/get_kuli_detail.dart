
import 'package:capstone_kuliku/domain/entities/kuli_detail.dart';
import 'package:capstone_kuliku/domain/repositories/kuli_repository.dart';

import 'package:dartz/dartz.dart';

import '../../common/failure.dart';

class GetDetailKuli {
  final KuliRepository repository;

  GetDetailKuli(this.repository);

  Future<Either<Failure, KuliDetail>> execute(int id) {
    return repository.getDetailKuli(id);
  }
}
