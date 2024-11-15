import 'package:coffee_house/data/LocalDataSource.dart';
import 'package:coffee_house/data/RemoteDataSource.dart';

import 'Models.dart';

class AppRepository {
  final RemoteDataSource _remoteDataSource;
  final LocalDataSource _localDataSource;

  AppRepository(this._remoteDataSource, this._localDataSource);

  Future<List<ProductModel>> getMenuProducts(){
    return _remoteDataSource.fetchProducts();
  }

  Future<List<ProductModel>> getCartProducts(){
    return _localDataSource.getCartProducts();
  }
}