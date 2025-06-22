import 'package:sqflite/sqflite.dart';

class SQLiteDatabase {
  SQLiteDatabase._();

  static Future<Database> get database async {
    var databasePath = await getDatabasesPath();
    String path = '$databasePath/database.db';

    final db = await openDatabase(path, version: 1, onCreate: onCreate);

    return db;
  }

  static Future<void> onCreate(Database db, int version) async {
    await db.execute(
      '''
        CREATE TABLE products (
          id INTEGER PRIMARY KEY AUTOINCREMENT,
          title TEXT,
          desc TEXT,
          image TEXT,
          regularPrice REAL,
          price REAL,
          stock REAL,
          unit TEXT,
          sku TEXT,
          createdAt TEXT
        )
      ''',
    );
  }
}
