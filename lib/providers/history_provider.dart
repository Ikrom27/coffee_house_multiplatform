

import 'package:coffee_house/providers/repository_provider.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../data/models/OrderModel.dart';

part 'history_provider.g.dart';

@riverpod
class HistoryNotifier extends _$HistoryNotifier {
  Future<List<OrderModel>> build() async {
    final repository = ref.read(appRepositoryProvider);
    final orders = await repository.getOrders();
    orders.sort((a, b) => DateTime.parse(b.dateTime).compareTo(DateTime.parse(a.dateTime)));
    return orders;
  }
}