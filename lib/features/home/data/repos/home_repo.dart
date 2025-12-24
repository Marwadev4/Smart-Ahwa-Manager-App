import 'package:smart_ahwa_manager_app/core/local_db/db_result.dart';
import 'package:smart_ahwa_manager_app/core/local_db/local_db.dart';
import 'package:smart_ahwa_manager_app/features/home/data/models/order_request.dart';
import 'package:smart_ahwa_manager_app/features/home/data/models/order_response.dart';

class HomeRepo {
  final LocalDB _localDB;

  HomeRepo(this._localDB);

  Future<DataBaseResult<List<OrderResponse>>> getOrders() async {
    try {
      final response = await _localDB.getOrders();
      return DataBaseResult.success(response);
    } catch (error) {
      return DataBaseResult.failure(error.toString());
    }
  }

  Future<DataBaseResult<String>> addOrder(OrderRequest order) async {
    try {
      await _localDB.addOrder(order);
      return DataBaseResult.success('Insert successful');
    } catch (error) {
      return DataBaseResult.failure(error.toString());
    }
  }

  Future<DataBaseResult<String>> updateOrderStatus({
    required String status,
    required int id,
  }) async {
    try {
      await _localDB.updateOrderStatus(id: id, status: status);
      return DataBaseResult.success('Update Order Done');
    } catch (error) {
      return DataBaseResult.failure(error.toString());
    }
  }

  Future<DataBaseResult<String>> deleteOrder(int id) async {
    try {
      await _localDB.deleteOrder(id);
      return DataBaseResult.success('Delete Order Done');
    } catch (error) {
      return DataBaseResult.failure(error.toString());
    }
  }
}
