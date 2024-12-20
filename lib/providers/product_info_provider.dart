import 'package:coffee_house/providers/repository_provider.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:coffee_house/data/models/ProductModel.dart';


part 'product_info_provider.g.dart';


@riverpod
class ProductInfoNotifier extends _$ProductInfoNotifier {
  Future<void> addProductToCart(ProductModel product) async {
    final repository = ref.read(appRepositoryProvider);
    await repository.addProductToCart(product);
  }

  @override
  Future<void> build() async {}
}
