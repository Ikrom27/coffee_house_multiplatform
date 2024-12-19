enum ProductSize {
  small,
  medium,
  large
}

class Product {
  final int id;
  final String name;
  final int price;
  final String description;
  final String imageUrl;

  Product({
    required this.id,
    required this.name,
    required this.price,
    required this.description,
    required this.imageUrl
  });

  @override
  String toString() {
    return 'Product(name: $name, price: $price, description: $description)';
  }
}
