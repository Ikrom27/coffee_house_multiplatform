import 'dart:io';
import 'package:flutter/foundation.dart';
import 'package:sqflite/sqflite.dart';
import 'package:sqflite_common_ffi/sqflite_ffi.dart';
import 'package:path/path.dart';

class DatabaseManager {
  static final DatabaseManager _instance = DatabaseManager._internal();
  static const dbName = 'coffee_cart.db';

  factory DatabaseManager() {
    if (!kIsWeb && Platform.isWindows) {
      sqfliteFfiInit();
      databaseFactory = databaseFactoryFfi;
    }
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
    final dbPath = await _getDatabasePath();
    return await _openDatabase(dbPath);
  }

  Future<String> _getDatabasePath() async {
    if (kIsWeb) {
      throw UnsupportedError('Local database is not supported on the web.');
    }

    if (Platform.isWindows) {
      final dbPath = Directory.current.path;
      return join(dbPath, dbName);
    } else {
      final dbPath = await getDatabasesPath();
      return join(dbPath, dbName);
    }
  }

  Future<Database> _openDatabase(String path) async {
    if (Platform.isWindows) {
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
                image_url TEXT,
                count INTEGER DEFAULT 1
              )
            ''');
          },
        ),
      );
    } else {
      return await openDatabase(
        path,
        version: 1,
        onCreate: (db, version) async {
          await db.execute('''
              CREATE TABLE cart (
                id INTEGER PRIMARY KEY,
                name TEXT,
                price REAL,
                description TEXT,
                image_url TEXT,
                count INTEGER DEFAULT 1
              )
            ''');
        },
      );
    }
  }
}