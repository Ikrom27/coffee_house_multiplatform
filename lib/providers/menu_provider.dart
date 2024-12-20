import 'package:coffee_house/providers/repository_provider.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:coffee_house/ui/components/UIItems.dart';

part 'menu_provider.g.dart';

@Riverpod(keepAlive: true)
class MenuNotifier extends _$MenuNotifier {
  Future<List<Product>> build() async {
    final repository = ref.watch(appRepositoryProvider);
    final models = await repository.getMenuProducts();
    return models.map((model) => Product(
      id: model.id,
      name: model.name,
      price: model.price,
      description: model.description,
      imageUrl: model.imageUrl,
    )).toList();
  }

  void reloadMenu() async {
    state = const AsyncValue.loading();
    state = await AsyncValue.guard(() async {
      final repository = ref.read(appRepositoryProvider);
      final models = await repository.getMenuProducts();
      return models.map((model) => Product(
        id: model.id,
        name: model.name,
        price: model.price,
        description: model.description,
        imageUrl: model.imageUrl,
      )).toList();
    });
  }
}
