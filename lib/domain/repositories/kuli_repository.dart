import '../../common/failure.dart';
import '../entities/kuli.dart';
import 'package:dartz/dartz.dart';

abstract class KuliRepository {
  Future<Either<Failure, List<Kuli>>> getKuliList();
}
