import 'package:coffee_house/data/RemoteDataSource.dart';

import 'Models.dart';

class AppRepository {
  static RemoteDataSource removeDataSource = RemoteDataSource();

  List<ProductModel> getProducts(){
    return removeDataSource.fetchProducts();
  }
}