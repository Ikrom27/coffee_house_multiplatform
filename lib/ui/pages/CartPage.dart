import 'package:coffee_house/data/AppRepository.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import '../../providers/cart_provider.dart';
import '../../providers/order_provider.dart';
import '../components/CartItem.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'OrderStatusPage.dart';

class CartPage extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final cartState = ref.watch(cartNotifierProvider);
    final cartNotifier = ref.read(cartNotifierProvider.notifier);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Корзина'),
        centerTitle: true,
      ),
      body: cartState.when(
        data: (cartItems) => ListView.builder(
          itemCount: cartItems.length,
          itemBuilder: (context, index) {
            final product = cartItems[index];
            return Dismissible(
              key: ValueKey(product.id),
              background: Container(
                color: Colors.red,
                alignment: Alignment.centerLeft,
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: const Icon(Icons.delete, color: Colors.white),
              ),
              secondaryBackground: Container(
                color: Colors.red,
                alignment: Alignment.centerRight,
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: const Icon(Icons.delete, color: Colors.white),
              ),
              onDismissed: (direction) async {
                await cartNotifier.removeProductFromCart(product.id);
              },
              child: CartItemWidget(
                name: product.name,
                price: product.price,
                count: product.count,
                imageUrl: product.imageUrl,
              ),
            );
          },
        ),
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (error, stack) => Center(child: Text('Ошибка: $error')),
      ),
      bottomNavigationBar: Container(
        padding: const EdgeInsets.all(16.0),
        decoration: BoxDecoration(
          color: Theme.of(context).scaffoldBackgroundColor,
          border: Border(
            top: BorderSide(color: Colors.grey.shade300, width: 1),
          ),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Padding(
              padding: const EdgeInsets.only(bottom: 8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    'Summary',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    '\$${ref.watch(cartNotifierProvider).maybeWhen(data: (cartItems) => cartItems.fold(0, (sum, item) => sum + (item.price * item.count)).toStringAsFixed(2), orElse: () => '0.00')}',
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
            ElevatedButton(
              onPressed: () {
                final coffeeIds = ref.watch(cartNotifierProvider).maybeWhen(
                  data: (cartItems) => cartItems.map((item) => item.id).toList(),
                  orElse: () => <int>[],
                );

                if (coffeeIds.isNotEmpty) {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => OrderStatusPage(coffeeIds: coffeeIds),
                    ),
                  );
                } else {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('Корзина пуста!')),
                  );
                }
              },
              style: ElevatedButton.styleFrom(
                padding: const EdgeInsets.symmetric(vertical: 16.0),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8.0),
                ),
                backgroundColor: Theme.of(context).primaryColor,
              ),
              child: const Text(
                'Order',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
