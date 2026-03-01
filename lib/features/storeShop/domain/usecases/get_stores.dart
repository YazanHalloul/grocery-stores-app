
import 'package:technical_assignment/features/storeShop/domain/entities/store.dart';
import 'package:technical_assignment/features/storeShop/domain/repositories/store_repository.dart';

class GetStores {
  final StoreRepository repository;

  GetStores(this.repository);

  Future<List<StoreEntity>> call() {
    return repository.getStores();
  }
}
