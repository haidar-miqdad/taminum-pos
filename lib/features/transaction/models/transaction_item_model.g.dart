// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'transaction_item_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TransactionItemModel _$TransactionItemModelFromJson(
  Map<String, dynamic> json,
) => TransactionItemModel(
  id: (json['id'] as num?)?.toInt() ?? 0,
  qty: (json['qty'] as num?)?.toInt() ?? 1,
  note: json['note'] as String? ?? '',
  customerName: json['customerName'] as String? ?? '',
  title: json['title'] as String? ?? '',
  description: json['description'] as String? ?? '',
  imageUrl: json['imageUrl'] as String? ?? '',
  regularPrice: (json['regularPrice'] as num?)?.toInt() ?? 0,
  itemPrice: (json['itemPrice'] as num?)?.toInt() ?? 0,
  stock: (json['stock'] as num?)?.toInt() ?? 0,
  unit: json['unit'] as String? ?? '',
  sku: json['sku'] as String? ?? '',
  transactionId: (json['transactionId'] as num).toInt(),
);

Map<String, dynamic> _$TransactionItemModelToJson(
  TransactionItemModel instance,
) => <String, dynamic>{
  'qty': instance.qty,
  'note': instance.note,
  'title': instance.title,
  'description': instance.description,
  'imageUrl': instance.imageUrl,
  'regularPrice': instance.regularPrice,
  'itemPrice': instance.itemPrice,
  'stock': instance.stock,
  'unit': instance.unit,
  'sku': instance.sku,
  'customerName': instance.customerName,
  'transactionId': instance.transactionId,
};
