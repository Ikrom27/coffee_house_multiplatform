import 'package:coffee_house/data/LocalDataSource.dart';
import 'package:coffee_house/data/RemoteDataSource.dart';

import 'Models.dart';

class AppRepository {
  static RemoteDataSource remoteDataSource = RemoteDataSource();
  static LocalDataSource localDataSource = LocalDataSource();

  Future<List<ProductModel>> getMenuProducts(){
    return remoteDataSource.fetchProducts();
  }

  Future<List<ProductModel>> getCartProducts(){
    return localDataSource.getCartProducts();
  }
}