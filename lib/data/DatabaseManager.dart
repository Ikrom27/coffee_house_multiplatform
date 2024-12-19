import 'package:sqflite_common_ffi/sqflite_ffi.dart';
import 'package:path/path.dart';

class DatabaseManager {
  static final DatabaseManager _instance = DatabaseManager._internal();
  static const dbName = 'coffee_cart.db';

  factory DatabaseManager() {
    sqfliteFfiInit();
    databaseFactory = databaseFactoryFfi;
    return _instance;
  }

  DatabaseManager._internal();

  Database? _database;

  Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await _initDatabase();
    return _database!;
  }

  Future<Database> _initDatabase() async {
    final dbPath = await databaseFactory.getDatabasesPath();
    final path = join(dbPath, dbName);

    return await databaseFactory.openDatabase(
      path,
      options: OpenDatabaseOptions(
        version: 1,
        onCreate: (db, version) async {
          await db.execute('''
            CREATE TABLE cart (
              id INTEGER PRIMARY KEY,
              name TEXT,
              price REAL,
              description TEXT,
              image_url TEXT
            )
          ''');
        },
      ),
    );
  }

  Future<void> deleteDatabase() async {
    final dbPath = await databaseFactory.getDatabasesPath();
    final path = join(dbPath, dbName);
    await databaseFactory.deleteDatabase(path);
  }
}