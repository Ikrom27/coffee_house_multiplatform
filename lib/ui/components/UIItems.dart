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

class CartItem {
  final int id;
  final String name;
  final int price;
  final String description;
  final String imageUrl;
  final int count;

  CartItem({
    required this.id,
    required this.name,
    required this.price,
    required this.description,
    required this.imageUrl,
    required this.count
  });

  @override
  String toString() {
    return 'CartItem(name: $name, price: $price, description: $description)';
  }
}