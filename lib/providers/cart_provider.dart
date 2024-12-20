import 'package:coffee_house/data/models/CartProductModel.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:coffee_house/providers/repository_provider.dart';


part 'cart_provider.g.dart';


@riverpod
class CartNotifier extends _$CartNotifier {
  Future<List<CartProductModel>> build() async {

    final repository = ref.read(appRepositoryProvider);
    return await repository.getCartProducts();
  }

  Future<void> removeProductFromCart(int productId) async {
    final repository = ref.read(appRepositoryProvider);
    await repository.removeProductFromCart(productId);

    state = await AsyncValue.guard(() async {
      return await repository.getCartProducts();
    });

  }

  void refreshCart() async {
    state = const AsyncValue.loading();
    state = await AsyncValue.guard(() async {
      final repository = ref.read(appRepositoryProvider);
      return await repository.getCartProducts();
    });
  }


  Future<void> clearCart() async {
    final repository = ref.read(appRepositoryProvider);
    await repository.clearCart();

    state = const AsyncValue.data([]);
  }
}