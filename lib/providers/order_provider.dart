import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../../providers/repository_provider.dart';

part 'order_provider.g.dart';

@riverpod
class OrderNotifier extends _$OrderNotifier {
  @override
  Future<String> build(List<int> coffeeIds) async {
    final repository = ref.watch(appRepositoryProvider);
    final orderId = await repository.createOrder(coffeeIds);
    await repository.clearCart();
    return orderId;
  }
}
