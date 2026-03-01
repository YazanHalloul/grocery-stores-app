import 'package:get_it/get_it.dart';
import 'package:technical_assignment/core/network/api_client.dart';
import 'package:technical_assignment/features/storeShop/data/datasources/store_remote_data_source.dart';
import 'package:technical_assignment/features/storeShop/data/repositories/store_repository_impl.dart';
import 'package:technical_assignment/features/storeShop/domain/repositories/store_repository.dart';
import 'package:technical_assignment/features/storeShop/domain/usecases/get_stores.dart';

final getIt = GetIt.instance;

void setupInjection() {

  getIt.registerLazySingleton<ApiClient>(() => ApiClient());

  // Remote data source (IMPLEMENTATION)
  getIt.registerLazySingleton<StoreRemoteDataSource>(
    () => StoreRemoteDataSourceImpl(getIt()),
  );

  // Repository (DOMAIN interface → DATA implementation)
  getIt.registerLazySingleton<StoreRepository>(
    () => StoreRepositoryImpl(getIt()),
  );

  // Use case
  getIt.registerLazySingleton<GetStores>(
    () => GetStores(getIt()),
  );
}
