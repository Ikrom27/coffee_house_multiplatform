import 'package:coffee_house/data/Models.dart';
import 'package:sqflite/sqflite.dart';
import 'DatabaseManager.dart';

class LocalDataSource {
  final DatabaseManager _dbManager;

  LocalDataSource(this._dbManager);

  Future<void> addProductToCart(ProductModel product) async {
    final db = await _dbManager.database;
    await db.insert(
      'cart',
      product.toJson(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  Future<void> removeProductFromCart(int productId) async {
    final db = await _dbManager.database;
    await db.delete(
      'cart',
      where: 'id = ?',
      whereArgs: [productId],
    );
  }

  Future<List<ProductModel>> getCartProducts() async {
    final db = await _dbManager.database;
    final maps = await db.query('cart');

    return List.generate(
      maps.length,
          (i) => ProductModel.fromJson(maps[i]),
    );
  }

  Future<void> clearCart() async {
    final db = await _dbManager.database;
    await db.delete('cart');
  }
}
