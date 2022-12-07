import 'package:capstone_kuliku/domain/entities/kuli.dart';
import 'package:capstone_kuliku/domain/repositories/kuli_repository.dart';
import 'package:dartz/dartz.dart';

import '../../common/failure.dart';

class GetKuliList {
  final KuliRepository repository;

  GetKuliList(this.repository);

  Future<Either<Failure, List<Kuli>>> execute() {
    return repository.getKuliList();
  }
}
