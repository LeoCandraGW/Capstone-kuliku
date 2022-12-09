import 'package:capstone_kuliku/common/exception.dart';
import 'package:capstone_kuliku/data/datasource/db/database_helper.dart';
import 'package:capstone_kuliku/data/models/kuli_table.dart';

abstract class KuliLocalDataSource {
  Future<String> insertFavorite(KuliTable kuli);
  Future<String> removeFavorite(KuliTable kuli);
  Future<KuliTable?> getKuliById(int id);
  Future<List<KuliTable>> getFavoriteKuli();
}

class KuliLocalDataSourceImpl implements KuliLocalDataSource {
  final DatabaseHelper databaseHelper;

  KuliLocalDataSourceImpl({required this.databaseHelper});

  @override
  Future<String> insertFavorite(KuliTable kuli) async {
    try {
      await databaseHelper.insertFavorite(kuli);
      return 'Added to Favorite';
    } catch (e) {
      throw DatabaseException(e.toString());
    }
  }

  @override
  Future<String> removeFavorite(KuliTable kuli) async {
    try {
      databaseHelper.removeFavorite(kuli);
      return 'Removed from Favorite';
    } catch (e) {
      throw DatabaseException(e.toString());
    }
  }

  @override
  Future<KuliTable?> getKuliById(int id) async {
    final result = await databaseHelper.getKuliById(id);
    if (result != null) {
      return KuliTable.fromMap(result);
    } else {
      return null;
    }
  }

  @override
  Future<List<KuliTable>> getFavoriteKuli() async {
    final result = await databaseHelper.getFavoriteKuli();
    return result.map((data) => KuliTable.fromMap(data)).toList();
  }
}