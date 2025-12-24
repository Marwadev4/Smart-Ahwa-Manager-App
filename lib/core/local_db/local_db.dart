import 'package:smart_ahwa_manager_app/core/helpers/enums.dart';
import 'package:smart_ahwa_manager_app/features/home/data/models/order_request.dart';
import 'package:sqflite/sqflite.dart';
import 'package:smart_ahwa_manager_app/features/home/data/models/order_response.dart';

class LocalDB {
  final Database database;
  List<OrderResponse> smartAhwaManager = [];

  LocalDB(this.database);

  Future<void> addOrder(OrderRequest order) async {
    await database.transaction((txn) async {
      await txn.rawInsert(
        'INSERT INTO orders(customerName, drink, notes, status, image) VALUES("${order.customerName}", "${order.drink.label}", "${order.notes}", "padding", "${order.image}")',
      );
      return null;
    });
  }

  Future<List<OrderResponse>> getOrders() async {
    List<Map<String, Object?>> smartAhwaManagerDatabase = await database
        .rawQuery('SELECT * FROM orders');
    print(smartAhwaManagerDatabase);
    smartAhwaManager.clear();

    for (var element in smartAhwaManagerDatabase) {
      print(element);
      smartAhwaManager.add(OrderResponse.fromJson(element));
    }
    print(smartAhwaManager);
    return smartAhwaManager;
  }

  Future<void> updateOrderStatus({
    required String status,
    required int id,
  }) async {
    await database.rawDelete('UPDATE orders SET status = ? WHERE id = ?', [
      status,
      id,
    ]);
  }

  Future<void> deleteOrder(int id) async {
    await database.rawDelete('DELETE FROM orders WHERE id = ?', [id]);
  }
}
