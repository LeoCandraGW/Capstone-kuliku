import 'package:capstone_kuliku/domain/entities/kuli.dart';
import 'package:capstone_kuliku/domain/repositories/kuli_repository.dart';
import 'package:dartz/dartz.dart';

import '../../common/failure.dart';

class GetKuliSkillList {
  final KuliRepository repository;

  GetKuliSkillList(this.repository);

  Future<Either<Failure, List<Kuli>>> execute(String skill) {
    return repository.getKuliSkillList(skill);
  }
}
