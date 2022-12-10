import 'package:capstone_kuliku/data/models/kuli_table.dart';
import 'package:sqflite/sqflite.dart';

class DatabaseHelper {
  static DatabaseHelper? _databaseHelper;
  DatabaseHelper._instance() {
    _databaseHelper = this;
  }
  factory DatabaseHelper() => _databaseHelper ?? DatabaseHelper._instance();

  static Database? _database;

  Future<Database?> get database async {
    _database ??= await _initDb();
    return _database;
  }

  static const String _tblFavorite = 'favorite';

  Future<Database> _initDb() async {
    final path = await getDatabasesPath();
    final databasePath = '$path/kuliku4.db';

    var db = await openDatabase(databasePath, version: 1, onCreate: _onCreate);
    return db;
  }

  void _onCreate(Database db, int version) async {
    await db.execute('''
      CREATE TABLE  $_tblFavorite (
        id INTEGER PRIMARY KEY,
        username TEXT,
        dailysal TEXT,
        image TEXT,
        alamat TEXT
      );
    ''');
  }

  Future<int> insertFavorite(KuliTable kuli) async {
    final db = await database;
    return await db!.insert(_tblFavorite, kuli.toJson());
  }

  Future<int> removeFavorite(KuliTable kuli) async {
    final db = await database;
    return await db!
        .delete(_tblFavorite, where: 'id = ?', whereArgs: [kuli.id]);
  }

  Future<Map<String, dynamic>?> getKuliById(int id) async {
    final db = await database;
    final results = await db!.query(
      _tblFavorite,
      where: 'id = ?',
      whereArgs: [id],
    );
    if (results.isNotEmpty) {
      return results.first;
    } else {
      return null;
    }
  }

  Future<List<Map<String, dynamic>>> getFavoriteKuli() async {
    final db = await database;
    final List<Map<String, dynamic>> results = await db!.query(_tblFavorite);
    return results;
  }
}
