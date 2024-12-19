import 'dart:io';
import 'package:flutter/foundation.dart';
import 'package:sqflite/sqflite.dart' as sqflite;
import 'package:sqflite_common_ffi/sqflite_ffi.dart';
import 'package:path/path.dart';
import 'Models.dart';

class LocalDataSource {
  static final LocalDataSource _instance = LocalDataSource._internal();

  factory LocalDataSource() => _instance;

  LocalDataSource._internal();

  sqflite.Database? _database;

  Future<sqflite.Database> get database async {
    if (_database != null) return _database!;
    _database = await _initDatabase();
    return _database!;
  }

  Future<sqflite.Database> _initDatabase() async {
    if (kIsWeb) {
      throw UnsupportedError('Local database is not supported on the web.');
    }

    if (Platform.isAndroid || Platform.isIOS) {
      final dbPath = await sqflite.getDatabasesPath();
      final path = join(dbPath, 'coffee_cart.db');
      return await sqflite.openDatabase(
        path,
        version: 1,
        onCreate: (db, version) async {
          await db.execute('''
            CREATE TABLE cart (
              id INTEGER PRIMARY KEY,
              name TEXT,
              price REAL,
              description TEXT,
              imageUrl TEXT
            )
          ''');
        },
      );
    } else {
      sqfliteFfiInit();
      databaseFactory = databaseFactoryFfi;
      final dbPath = join(Directory.current.path, 'coffee_cart.db');
      return await databaseFactory.openDatabase(
        dbPath,
        options: OpenDatabaseOptions(
          version: 1,
          onCreate: (db, version) async {
            await db.execute('''
              CREATE TABLE cart (
                id INTEGER PRIMARY KEY,
                name TEXT,
                price REAL,
                description TEXT,
                imageUrl TEXT
              )
            ''');
          },
        ),
      );
    }
  }

  Future<void> addProductToCart(ProductModel product) async {
    final db = await database;
    await db.insert(
      'cart',
      product.toJson(),
      conflictAlgorithm: sqflite.ConflictAlgorithm.replace,
    );
  }

  Future<void> removeProductFromCart(int productId) async {
    final db = await database;
    await db.delete(
      'cart',
      where: 'id = ?',
      whereArgs: [productId],
    );
  }

  Future<List<ProductModel>> getCartProducts() async {
    final db = await database;
    final maps = await db.query('cart');

    return List.generate(
      maps.length,
          (i) => ProductModel.fromJson(maps[i]),
    );
  }

  Future<void> clearCart() async {
    final db = await database;
    await db.delete('cart');
  }
}
