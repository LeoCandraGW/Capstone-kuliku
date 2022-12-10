import 'package:capstone_kuliku/domain/entities/kuli_detail.dart';

import '../../common/failure.dart';
import '../entities/kuli.dart';
import 'package:dartz/dartz.dart';

abstract class KuliRepository {
  Future<Either<Failure, List<Kuli>>> getKuliList();
  Future<Either<Failure, KuliDetail>> getDetailKuli(int id);
  Future<Either<Failure, List<Kuli>>> getKuliSkillList(String id);
  Future<Either<Failure, String>> saveFavorite(KuliDetail kuli);
  Future<Either<Failure, String>> removeFavorite(KuliDetail kuli);
  Future<bool> isAddedToFavorite(int id);
  Future<Either<Failure, List<Kuli>>> getKuliFavorite();
}
