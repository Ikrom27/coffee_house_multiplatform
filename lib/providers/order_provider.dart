import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../../providers/repository_provider.dart';
import '../data/models/OrderModel.dart';
import 'cart_provider.dart';

part 'order_provider.g.dart';

@riverpod
class OrderNotifier extends _$OrderNotifier {
  @override
  Future<String> build(List<int> coffeeIds) async {
    final repository = ref.read(appRepositoryProvider);
    final orderId = await repository.createOrder(coffeeIds);
    final totalPrice = ref
        .read(cartNotifierProvider)
        .maybeWhen(data: (items) => items.fold(0, (sum, item) => sum + item.price * item.count), orElse: () => 0.0);
    final dateTime = DateTime.now().toIso8601String();
    final order = OrderModel(id: orderId, dateTime: dateTime, totalPrice: totalPrice.toDouble());
    await repository.saveOrder(order);
    await repository.clearCart();
    return orderId;
  }
}
