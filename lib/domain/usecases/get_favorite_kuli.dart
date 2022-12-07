import 'package:capstone_kuliku/common/failure.dart';
import 'package:capstone_kuliku/domain/entities/kuli.dart';
import 'package:capstone_kuliku/domain/repositories/kuli_repository.dart';
import 'package:dartz/dartz.dart';

class GetFavoriteKuli {
  final KuliRepository _repository;

  GetFavoriteKuli(this._repository);

  Future<Either<Failure, List<Kuli>>> execute() {
    return _repository.getKuliFavorite();
  }
}
