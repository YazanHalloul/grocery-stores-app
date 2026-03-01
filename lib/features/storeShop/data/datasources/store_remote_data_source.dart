
import 'package:technical_assignment/core/network/api_client.dart';
import 'package:technical_assignment/features/storeShop/data/models/store_model.dart';

abstract class StoreRemoteDataSource {
  Future<List<StoreModel>> getStores();
}

class StoreRemoteDataSourceImpl implements StoreRemoteDataSource {
  final ApiClient client;

  StoreRemoteDataSourceImpl(this.client);

  @override
  Future<List<StoreModel>> getStores() async {
    final response = await client.get(
      "/shop/test/find/all/shop",
    );

    final results = response.data["result"] as List<dynamic>;

    return results
        .map((json) => StoreModel.fromJson(json))
        .toList();
  }
}
