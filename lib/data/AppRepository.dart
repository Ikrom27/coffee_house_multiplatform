import 'package:coffee_house/data/LocalDataSource.dart';
import 'package:coffee_house/data/RemoteDataSource.dart';
import 'Models.dart';

class AppRepository {
  final RemoteDataSource _remoteDataSource;
  final LocalDataSource _localDataSource;

  AppRepository(this._remoteDataSource, this._localDataSource);

  Future<List<ProductModel>> getMenuProducts() {
    return _remoteDataSource.fetchProducts();
  }

  Future<List<ProductModel>> getCartProducts() {
    return _localDataSource.getCartProducts();
  }

  Future<void> addProductToCart(ProductModel product) {
    return _localDataSource.addProductToCart(product);
  }

  Future<void> removeProductFromCart(int productId) {
    return _localDataSource.removeProductFromCart(productId);
  }

  Future<void> clearCart() {
    return _localDataSource.clearCart();
  }
}
