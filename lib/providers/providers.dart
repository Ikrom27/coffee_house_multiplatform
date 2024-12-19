import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:coffee_house/data/AppRepository.dart';
import 'package:coffee_house/ui/UIItems.dart';
import 'package:get_it/get_it.dart';

part 'providers.g.dart';

@riverpod
Future<List<Product>> productList(Ref ref) async {
  final repository = ref.watch(appRepositoryProvider);
  final models = await repository.getMenuProducts();
  return models.map((model) => Product(
    name: model.name,
    price: model.price,
    description: model.description,
    imageUrl: model.imageUrl,
  )).toList();
}

@riverpod
AppRepository appRepository(Ref ref) {
  return GetIt.instance<AppRepository>();
}