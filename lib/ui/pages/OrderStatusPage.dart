import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../providers/order_provider.dart';

class OrderStatusPage extends ConsumerWidget {
  final List<int> coffeeIds;

  const OrderStatusPage({Key? key, required this.coffeeIds}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final orderState = ref.watch(orderNotifierProvider(coffeeIds));

    return Scaffold(
      appBar: AppBar(
        title: const Text('Order Status'),
        centerTitle: true,
      ),
      body: Center(
        child: orderState.when(
          data: (orderId) => Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Icon(Icons.check_circle, color: Colors.green, size: 80),
              const SizedBox(height: 16),
              const Text(
                'Order Successful!',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 30),
              const Text(
                'Order ID',
                style: TextStyle(fontSize: 20, color: Colors.grey),
              ),
              Text(
                '$orderId',
                style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
            ],
          ),
          loading: () => const CircularProgressIndicator(),
          error: (error, stack) => Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Icon(Icons.error, color: Colors.red, size: 80),
              const SizedBox(height: 16),
              const Text(
                'Order Failed!',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 8),
              Text(
                '$error',
                style: const TextStyle(fontSize: 16),
              ),
            ],
          ),
        ),
      ),
    );
  }
}