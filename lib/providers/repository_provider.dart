import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:coffee_house/data/AppRepository.dart';
import 'package:get_it/get_it.dart';

part 'repository_provider.g.dart';


@riverpod
AppRepository appRepository(Ref ref) {
  return GetIt.instance<AppRepository>();
}