import 'package:coffee_house/providers/repository_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:coffee_house/ui/components/UIItems.dart';

part 'menu_provider.g.dart';

@riverpod
Future<List<Product>> menuProvider(Ref ref) async {
  final repository = ref.watch(appRepositoryProvider);
  final models = await repository.getMenuProducts();
  return models.map((model) => Product(
    name: model.name,
    price: model.price,
    description: model.description,
    imageUrl: model.imageUrl,
  )).toList();
}