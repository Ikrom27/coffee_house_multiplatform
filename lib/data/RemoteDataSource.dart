import 'dart:convert';

import 'package:coffee_house/data/Models.dart';
import 'package:http/http.dart' as http;

String baseUrl = "https://bbaupg6vmhmlgvvc816r.containers.yandexcloud.net";

class RemoteDataSource {
  Future<List<ProductModel>> fetchProducts() async {
    final response = await http.get(Uri.parse("$baseUrl/coffees"));
    if (response.statusCode == 200) {
      List<dynamic> jsonList = json.decode(response.body);
      return jsonList
          .map((jsonItem) => ProductModel.fromJson(jsonItem))
          .toList();
    } else {
      throw Exception('Failed to load products');
    }
  }
}