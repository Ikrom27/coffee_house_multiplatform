import 'dart:convert';

import 'package:coffee_house/data/models/ProductModel.dart';
import 'package:http/http.dart' as http;

String menu_service_url = "https://bbaupg6vmhmlgvvc816r.containers.yandexcloud.net";
String order_service_url = "https://bbah2v1b82bj4be82ik2.containers.yandexcloud.net";

class RemoteDataSource {
  Future<List<ProductModel>> fetchProducts() async {
    final response = await http.get(Uri.parse("$menu_service_url/coffees"));
    if (response.statusCode == 200) {
      List<dynamic> jsonList = json.decode(response.body);
      return jsonList
          .map((jsonItem) => ProductModel.fromJson(jsonItem))
          .toList();
    } else {
      throw Exception('Failed to load products');
    }
  }

  Future<bool> createOrder({
    required int coffeeId,
    required int price,
    String paymentMethod = "cash",
    String? cardId,
    int? shopId,
  }) async {
    final response = await http.post(
      Uri.parse("$order_service_url/orders"),
      headers: {
        "Content-Type": "application/json",
      },
      body: json.encode({
        "coffee_id": coffeeId,
        "price": price,
        "payment_method": paymentMethod,
        "card_id": cardId,
        "shop_id": shopId,
      }),
    );

    if (response.statusCode == 200) {
      return true;
    } else {
      return false;
    }
  }
}
