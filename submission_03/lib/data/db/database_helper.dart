import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:submission_03/domain/restaurant_list/restaurant.dart';

class DatabaseHelper {
  //create singleton
  static final DatabaseHelper _instance = DatabaseHelper.internal();
  DatabaseHelper.internal();
  factory DatabaseHelper() => _instance;
  static const String _tableBookmark = 'Bookmark';
  static const String _columnId = 'id';
  static const String _columnName = 'name';
  static const String _columnDescription = 'description';
  static const String _columnPictureId = 'pictureId';
  static const String _columnCity = 'city';
  static const String _columnRating = 'rating';

  static Database? _database;
  Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await initDatabase();
    return _database!;
  }

  Future<Database> initDatabase() async {
    var path = await getDatabasesPath();
    var db = openDatabase(
      join(path, 'restaurants.db'),
      version: 1,
      onCreate: (db, version) async {
        await db.execute('''CREATE TABLE $_tableBookmark (
            $_columnId TEXT PRIMARY KEY,
            $_columnName TEXT,
            $_columnDescription TEXT,
            $_columnPictureId TEXT,
            $_columnCity TEXT,
            $_columnRating REAL)
            ''');
      },
    );
    return db;
  }

  Future insertBookmark(Restaurant restaurant) async {
    var db = await database;
    var result = await db.insert(
      _tableBookmark,
      restaurant.toJson(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
    return result;
  }

  Future<List<Restaurant>> getBookmark() async {
    var db = await database;
    var result = await db.query(_tableBookmark);
    return result.map((item) => Restaurant.fromJson(item)).toList();
  }

  Future<Map> getBookmarkById(String id) async {
    var db = await database;
    var result = await db
        .query(_tableBookmark, where: '$_columnId = ?', whereArgs: [id]);
    return result.isNotEmpty ? result.first : {};
  }

  Future removeBookmark(String id) async {
    var db = await database;
    var result = await db
        .delete(_tableBookmark, where: '$_columnId = ?', whereArgs: [id]);
    return result;
  }
}
