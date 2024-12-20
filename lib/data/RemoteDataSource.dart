import 'dart:convert';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:coffee_house/data/models/ProductModel.dart';
import 'package:http/http.dart' as http;

String menu_service_url = "https://bbaupg6vmhmlgvvc816r.containers.yandexcloud.net";

class RemoteDataSource {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

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

  Future<String> createOrder({
    required List<int> coffeeIds,
  }) async {
    try {
      final orderDoc = await _firestore.collection('orders').add({
        'coffee_ids': coffeeIds,
        'time': FieldValue.serverTimestamp(),
      });
      return orderDoc.id;
    } catch (e) {
      print("Error creating order: $e");
      rethrow;
    }
  }
}
