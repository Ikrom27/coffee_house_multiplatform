import 'package:coffee_house/providers/repository_provider.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:coffee_house/data/Models.dart';


part 'product_info_provider.g.dart';


@riverpod
class ProductInfoNotifier extends _$ProductInfoNotifier {
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
}