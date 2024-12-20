import 'package:coffee_house/data/Models.dart';
import 'package:sqflite/sqflite.dart';
import 'DatabaseManager.dart';
import 'Entity.dart';

class LocalDataSource {
  final DatabaseManager _dbManager;

  LocalDataSource(this._dbManager);

  Future<void> addProductToCart(ProductModel product) async {
    final db = await _dbManager.database;
    final existingProduct = await db.query(
      'cart',
      where: 'id = ?',
      whereArgs: [product.id],
    );

    if (existingProduct.isNotEmpty) {
      final currentCount = existingProduct.first['count'] as int;
      await db.update(
        'cart',
        {'count': currentCount + 1},
        where: 'id = ?',
        whereArgs: [product.id],
      );
    } else {
      final cartProduct = CartProductEntity.fromModel(product, count: 1);
      await db.insert(
        'cart',
        cartProduct.toJson(),
        conflictAlgorithm: ConflictAlgorithm.replace,
      );
    }
  }

  Future<void> removeProductFromCart(int productId) async {
    final db = await _dbManager.database;

    final existingProduct = await db.query(
      'cart',
      where: 'id = ?',
      whereArgs: [productId],
    );

    if (existingProduct.isNotEmpty) {
      final currentCount = existingProduct.first['count'] as int;

      if (currentCount > 1) {
        await db.update(
          'cart',
          {'count': currentCount - 1},
          where: 'id = ?',
          whereArgs: [productId],
        );
      } else {
        await db.delete(
          'cart',
          where: 'id = ?',
          whereArgs: [productId],
        );
      }
    }
  }

  Future<List<ProductModel>> getCartProducts() async {
    final db = await _dbManager.database;
    final maps = await db.query('cart');

    return maps.map((map) {
      final cartProduct = CartProductEntity.fromJson(map);
      return cartProduct.toModel();
    }).toList();
  }

  Future<void> clearCart() async {
    final db = await _dbManager.database;
    await db.delete('cart');
  }
}
