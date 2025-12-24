// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'order_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

OrderRequest _$OrderRequestFromJson(Map<String, dynamic> json) => OrderRequest(
  customerName: json['customerName'] as String,
  drink: $enumDecode(_$DrinkEnumMap, json['drink']),
  notes: json['notes'] as String?,
  image: json['image'] as String,
);

Map<String, dynamic> _$OrderRequestToJson(OrderRequest instance) =>
    <String, dynamic>{
      'customerName': instance.customerName,
      'drink': _$DrinkEnumMap[instance.drink]!,
      'notes': instance.notes,
      'image': instance.image,
    };

const _$DrinkEnumMap = {
  Drink.coffee: 'coffee',
  Drink.tea: 'tea',
  Drink.turkishCoffee: 'turkishCoffee',
};
