import 'package:coffee_house/data/models/ProductModel.dart';

class CartProductModel {
  final int id;
  final String name;
  final int price;
  final String description;
  final String imageUrl;
  final int count;

  CartProductModel({
    required this.id,
    required this.name,
    required this.price,
    required this.description,
    required this.imageUrl,
    required this.count,
  });

  factory CartProductModel.fromJson(Map<String, dynamic> json) {
    return CartProductModel(
      id: json['id'] as int,
      name: json['name'] as String,
      price: (json['price'] as num).toInt(),
      description: json['description'] as String,
      imageUrl: json['image_url'] as String,
      count: json['count'] as int,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'price': price,
      'description': description,
      'image_url': imageUrl,
      'count': count,
    };
  }

  factory CartProductModel.fromModel(ProductModel model) {
    return CartProductModel(
      id: model.id,
      name: model.name,
      price: model.price,
      description: model.description,
      imageUrl: model.imageUrl,
      count: 1,
    );
  }

  ProductModel toModel() {
    return ProductModel(
      id: id,
      name: name,
      price: price,
      description: description,
      imageUrl: imageUrl,
    );
  }
}
