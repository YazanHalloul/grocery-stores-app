import 'package:technical_assignment/features/storeShop/data/datasources/store_remote_data_source.dart';
import 'package:technical_assignment/features/storeShop/domain/entities/store.dart';
import 'package:technical_assignment/features/storeShop/domain/repositories/store_repository.dart';

class StoreRepositoryImpl implements StoreRepository {
  final StoreRemoteDataSource remoteDataSource;

  StoreRepositoryImpl(this.remoteDataSource);

  @override
  Future<List<StoreEntity>> getStores() async {
    final storeModels = await remoteDataSource.getStores();
    return storeModels.map((model) => model.toEntity()).toList();
  }
}
