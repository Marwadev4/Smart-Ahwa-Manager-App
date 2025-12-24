import 'package:smart_ahwa_manager_app/core/helpers/enums.dart';

class OrderResponse {
  final int id;
  final String customerName;
  final String drink;
  final String? notes;
  final Status status;
  final String image;

  factory OrderResponse.fromJson(Map<String, dynamic> json) => OrderResponse(
    id: (json['id'] as num).toInt(),
    customerName: json['customerName'] as String,
    drink: json['drink'] as String,
    notes: json['notes'] as String,
    status: stringToStatus(json['status'] as String),
    image: json['image'] as String,
  );

  OrderResponse({
    required this.id,
    required this.customerName,
    required this.drink,
    required this.notes,
    required this.status,
    required this.image,
  });
}

Status stringToStatus(String value) {
  return Status.values.firstWhere((e) => e.name == value);
}
