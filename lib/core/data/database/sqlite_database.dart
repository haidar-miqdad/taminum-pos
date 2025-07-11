import 'package:sqflite/sqflite.dart';

class SQLiteDatabase {
  SQLiteDatabase._();

  static Future<Database> get database async {
    var databasePath = await getDatabasesPath();
    String path = '$databasePath/taminum4.db';

    final db = await openDatabase(path, version: 1, onCreate: onCreate);

    return db;
  }

  static Future<void> onCreate(Database db, int version) async {
    await db.execute('''
      CREATE TABLE products(
      id INTEGER PRIMARY KEY AUTOINCREMENT,
      title TEXT,
      description TEXT,
      imageUrl TEXT,
      regularPrice REAL,
      itemPrice REAL,
      stock REAL,
      unit TEXT,
      note TEXT,
      customerName TEXT,
      sku TEXT,
      createdAt TEXT
      )
      ''');

    await db.execute('''
      CREATE TABLE transactions(
      id INTEGER PRIMARY KEY AUTOINCREMENT,
      referenceId TEXT UNIQUE,
      type TEXT,
      qrString TEXT,
      qrId REAL,
      amount REAL,
      discount REAL,
      payAmount REAL,
      paymentType TEXT,
      createdAt TEXT
      )
      ''');

    await db.execute('''
      CREATE TABLE items(
      id INTEGER PRIMARY KEY AUTOINCREMENT,
      qty REAL,
      note TEXT,
      title TEXT,
      description TEXT,
      imageUrl BLOB,
      regularPrice REAL,
      itemPrice REAL,
      stock REAL,
      unit TEXT,
      sku TEXT,
      transactionId INTEGER,
      customerName TEXT,
      FOREIGN KEY (transactionId) REFERENCES transactions(id)
      )
      ''');
  }
}
