import 'package:technical_assignment/features/storeShop/domain/entities/store.dart';

abstract class StoreRepository {
  Future<List<StoreEntity>> getStores();
}