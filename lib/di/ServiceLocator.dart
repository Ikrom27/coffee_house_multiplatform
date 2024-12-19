import 'package:coffee_house/data/AppRepository.dart';
import 'package:coffee_house/data/LocalDataSource.dart';
import 'package:coffee_house/data/RemoteDataSource.dart';
import 'package:coffee_house/data/DatabaseManager.dart';
import 'package:get_it/get_it.dart';

final getIt = GetIt.instance;

void setupLocator() {
  getIt.registerLazySingleton<DatabaseManager>(() => DatabaseManager());
  getIt.registerLazySingleton<LocalDataSource>(
        () => LocalDataSource(getIt<DatabaseManager>()),
  );
  getIt.registerLazySingleton<RemoteDataSource>(() => RemoteDataSource());
  getIt.registerLazySingleton<AppRepository>(
        () => AppRepository(
      getIt<RemoteDataSource>(),
      getIt<LocalDataSource>(),
    ),
  );
}
