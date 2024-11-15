import 'package:coffee_house/data/Models.dart';

List<ProductModel> MenuTestData = [
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
      imageUrl: "https://puzzleit.ru/files/puzzles/153/152863/_original.jpg"
  ),
  ProductModel(
      id: 3,
      name: "Americano",
      price: 90,
      description: "bestCoffe",
      imageUrl: "https://avatars.mds.yandex.net/i?id=bf46d7626d890b0fac4aa23773887f4f_l-5647863-images-thumbs&n=13"
  ),
  ProductModel(
      id: 4,
      name: "Americano",
      price: 90,
      description: "bestCoffe",
      imageUrl: "https://avatars.mds.yandex.net/i?id=3cb280cbc31d2937d7574161ea40f228_l-4565320-images-thumbs&n=13"
  ),
  ProductModel(
      id: 4,
      name: "Americano",
      price: 90,
      description: "bestCoffe",
      imageUrl: "https://avatars.mds.yandex.net/i?id=2b9620c174c1749f1402b9d8037d0089_l-5356399-images-thumbs&n=13"
  ),
  ProductModel(
      id: 4,
      name: "Americano",
      price: 90,
      description: "bestCoffe",
      imageUrl: "https://raivbel.by/upload/iblock/992/992f824b818d5741bbb00b9ff54c415b.jpg"
  ),
];

class RemoteDataSource {
  Future<List<ProductModel>> fetchProducts() {
    return Future.delayed(const Duration(seconds: 3), () => MenuTestData);
  }
}