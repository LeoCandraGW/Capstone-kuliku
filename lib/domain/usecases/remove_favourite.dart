import 'package:capstone_kuliku/common/failure.dart';
import 'package:capstone_kuliku/domain/entities/kuli_detail.dart';
import 'package:capstone_kuliku/domain/repositories/kuli_repository.dart';
import 'package:dartz/dartz.dart';

class RemoveFavorite {
  final KuliRepository repository;

  RemoveFavorite(this.repository);

  Future<Either<Failure, String>> execute(KuliDetail kuli) {
    return repository.removeFavorite(kuli);
  }
}