import 'package:coffee_house/data/LocalDataSource.dart';
import 'package:coffee_house/data/RemoteDataSource.dart';

import 'Models.dart';

class AppRepository {
  static final RemoteDataSource _remoteDataSource = RemoteDataSource();
  static final LocalDataSource _localDataSource = LocalDataSource();

  Future<List<ProductModel>> getMenuProducts(){
    return _remoteDataSource.fetchProducts();
  }

  Future<List<ProductModel>> getCartProducts(){
    return _localDataSource.getCartProducts();
  }
}