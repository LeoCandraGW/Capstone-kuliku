import 'package:capstone_kuliku/domain/repositories/kuli_repository.dart';

class GetFavoriteStatus {
  final KuliRepository repository;

  GetFavoriteStatus(this.repository);

  Future<bool> execute(int id) async {
    return repository.isAddedToFavorite(id);
  }
}