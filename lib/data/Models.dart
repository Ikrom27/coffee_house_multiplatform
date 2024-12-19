class ProductModel {
  final int id;
  final String name;
  final int price;
  final String description;
  final String imageUrl;

  ProductModel({
    required this.id,
    required this.name,
    required this.price,
    required this.description,
    required this.imageUrl
  });

  factory ProductModel.fromJson(Map<String, dynamic> json){
    return switch (json) {
      {
      'id': int id,
      'name': String name,
      'description': String description,
      'price': int price,
      'image_url': String imageUrl,
      } => ProductModel(
          id: id,
          name: name,
          price: price,
          description: description,
          imageUrl: imageUrl
      ),
      _ => throw const FormatException("Product convert fail")
    };
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'price': price,
      'description': description,
      'imageUrl': imageUrl,
    };
  }

  @override
  String toString() {
    return 'Product(name: $name, price: $price, description: $description)';
  }
}