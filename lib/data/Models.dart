class ProductModel {
  final int id;
  final String name;
  final double price;
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
        price: price.toDouble(),
        description: description,
        imageUrl: imageUrl
      ),
    _ => throw const FormatException("Product convert fail")
    };
  }

  @override
  String toString() {
    return 'Product(name: $name, price: $price, description: $description)';
  }
}