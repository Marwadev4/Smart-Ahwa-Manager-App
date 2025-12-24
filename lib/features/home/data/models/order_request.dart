import 'package:json_annotation/json_annotation.dart';
import 'package:smart_ahwa_manager_app/core/helpers/enums.dart';

part 'order_request.g.dart';

@JsonSerializable()
class OrderRequest {
  final String customerName;
  final Drink drink;
  final String? notes;
  final String image;

  factory OrderRequest.fromJson(Map<String, dynamic> json) =>
      _$OrderRequestFromJson(json);

  OrderRequest({
    required this.customerName,
    required this.drink,
    required this.notes,
    required this.image,
  });

  Map<String, dynamic> toJson() => _$OrderRequestToJson(this);
}
