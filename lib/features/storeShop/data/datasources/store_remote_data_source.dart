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
    try {
      final response = await client.get("/shop/test/find/all/shop");

      if (response.statusCode != 200) {
        throw Exception("Server error");
      }

      final data = response.data["result"] as List<dynamic>;

      return data.map((json) => StoreModel.fromJson(json)).toList();
    } catch (e) {
      throw Exception("Network request failed");
    }
  }
}
