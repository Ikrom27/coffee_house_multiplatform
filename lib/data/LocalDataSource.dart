import 'package:sqflite/sqflite.dart';
import 'DatabaseManager.dart';
import 'models/CartProductModel.dart';
import 'models/OrderModel.dart';

class LocalDataSource {
  final DatabaseManager _dbManager;

  LocalDataSource(this._dbManager);

  Future<void> addProductToCart(CartProductModel cartProduct) async {
    final db = await _dbManager.database;
    final existingProduct = await db.query(
      'cart',
      where: 'id = ?',
      whereArgs: [cartProduct.id],
    );

    if (existingProduct.isNotEmpty) {
      final currentCount = existingProduct.first['count'] as int;
      await db.update(
        'cart',
        {'count': currentCount + cartProduct.count},
        where: 'id = ?',
        whereArgs: [cartProduct.id],
      );
    } else {
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
      await db.delete(
        'cart',
        where: 'id = ?',
        whereArgs: [productId],
      );
    }
  }

  Future<List<CartProductModel>> getCartProducts() async {
    final db = await _dbManager.database;
    final maps = await db.query('cart');

    return maps.map((map) => CartProductModel.fromJson(map)).toList();
  }

  Future<void> clearCart() async {
    final db = await _dbManager.database;
    await db.delete('cart');
  }

  Future<void> saveOrder(OrderModel order) async {
    final db = await _dbManager.database;
    await db.insert(
      'orders',
      order.toJson(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  Future<List<OrderModel>> getOrders() async {
    final db = await _dbManager.database;
    final maps = await db.query('orders');
    return maps.map((map) => OrderModel.fromJson(map)).toList();
  }

}
