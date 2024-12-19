import 'package:coffee_house/ui/components/ProductCard.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../providers/menu_provider.dart';

class MenuPage extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final productAsyncValue = ref.watch(menuNotifierProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Menu'),
      ),
      body: productAsyncValue.when(
        data: (products) {
          return RefreshIndicator(
            onRefresh: () async {
              ref.invalidate(menuNotifierProvider);
              await ref.read(menuNotifierProvider.future);
            },
            child: GridView.builder(
              padding: const EdgeInsets.all(16),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 15,
                mainAxisSpacing: 24,
                childAspectRatio: 0.75,
              ),
              itemCount: products.length,
              itemBuilder: (context, index) {
                final product = products[index];
                return GestureDetector(
                  onTap: () {
                    Navigator.pushNamed(
                      context,
                      '/menu/info',
                      arguments: product,
                    );
                  },
                  child: ProductCard(
                    label: product.name,
                    imageUrl: product.imageUrl,
                    price: product.price,
                  ),
                );
              },
            ),
          );
        },
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (error, stack) => Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('Ошибка загрузки: $error'),
              const SizedBox(height: 8),
              ElevatedButton(
                onPressed: () {
                  ref.invalidate(menuNotifierProvider);
                },
                child: const Text('Повторить'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
