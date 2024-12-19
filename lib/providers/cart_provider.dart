import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:coffee_house/data/Models.dart';
import 'package:coffee_house/providers/repository_provider.dart';


part 'cart_provider.g.dart';


@riverpod
class CartNotifier extends _$CartNotifier {
  Future<List<ProductModel>> build() async {

    final repository = ref.read(appRepositoryProvider);
    return await repository.getCartProducts();
  }

  Future<void> addProductToCart(ProductModel product) async {
    final repository = ref.read(appRepositoryProvider);
    await repository.addProductToCart(product);

    state = await AsyncValue.guard(() async {
      return await repository.getCartProducts();
    });
  }

  Future<void> removeProductFromCart(int productId) async {
    final repository = ref.read(appRepositoryProvider);
    await repository.removeProductFromCart(productId);

    state = await AsyncValue.guard(() async {
      return await repository.getCartProducts();
    });
  }

  Future<void> clearCart() async {
    final repository = ref.read(appRepositoryProvider);
    await repository.clearCart();

    state = const AsyncValue.data([]);
  }
}