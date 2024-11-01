import 'package:coffee_house/data/Models.dart';

List<ProductModel> CardTestData = [
  ProductModel(
      id: 1,
      name: "Americano",
      price: 90,
      description: "bestCoffe",
      imageUrl: "https://avatars.mds.yandex.net/get-altay/11381866/2a0000018c58b41338dee13b0dbe5c852462/XXL_height"
  ),
  ProductModel(
      id: 2,
      name: "Americano",
      price: 90,
      description: "bestCoffe",
      imageUrl: "https://avatars.mds.yandex.net/get-altay/11381866/2a0000018c58b41338dee13b0dbe5c852462/XXL_height"
  ),
  ProductModel(
      id: 3,
      name: "Americano",
      price: 90,
      description: "bestCoffe",
      imageUrl: "https://avatars.mds.yandex.net/get-altay/11381866/2a0000018c58b41338dee13b0dbe5c852462/XXL_height"
  ),
  ProductModel(
      id: 4,
      name: "Americano",
      price: 90,
      description: "bestCoffe",
      imageUrl: "https://avatars.mds.yandex.net/get-altay/11381866/2a0000018c58b41338dee13b0dbe5c852462/XXL_height"
  ),
];

class LocalDataSource {
  Future<List<ProductModel>> getCartProducts() {
    return Future.delayed(const Duration(seconds: 3), () => CardTestData);
  }
}