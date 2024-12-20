import 'package:coffee_house/data/Models.dart';

class CartProductEntity {
  final int id;
  final String name;
  final int price;
  final String description;
  final String imageUrl;
  final int count;

  CartProductEntity({
    required this.id,
    required this.name,
    required this.price,
    required this.description,
    required this.imageUrl,
    required this.count,
  });

  factory CartProductEntity.fromJson(Map<String, dynamic> json) {
    return CartProductEntity(
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

  factory CartProductEntity.fromModel(ProductModel model, {required int count}) {
    return CartProductEntity(
      id: model.id,
      name: model.name,
      price: model.price,
      description: model.description,
      imageUrl: model.imageUrl,
      count: count,
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
