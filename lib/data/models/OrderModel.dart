class OrderModel {
  final String id;
  final String dateTime;
  final double totalPrice;

  OrderModel({
    required this.id,
    required this.dateTime,
    required this.totalPrice,
  });

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'date_time': dateTime,
      'total_price': totalPrice,
    };
  }

  factory OrderModel.fromJson(Map<String, dynamic> json) {
    return OrderModel(
      id: json['id'] as String,
      dateTime: json['date_time'] as String,
      totalPrice: json['total_price'] as double,
    );
  }
}
