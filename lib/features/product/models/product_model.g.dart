// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ProductModel _$ProductModelFromJson(Map<String, dynamic> json) => ProductModel(
  title: json['title'] as String? ?? '',
  description: json['description'] as String? ?? '',
  imageUrl: json['imageUrl'] as String? ?? '',
  regularPrice: (json['regularPrice'] as num?)?.toInt() ?? 0,
  unit: json['unit'] as String? ?? '',
  itemPrice: (json['itemPrice'] as num?)?.toInt() ?? 0,
  stock: (json['stock'] as num?)?.toInt() ?? 0,
  sku: json['sku'] as String? ?? '',
  note: json['note'] as String? ?? '',
  id: (json['id'] as num?)?.toInt() ?? 0,
  createdAt: DateTime.parse(json['createdAt'] as String),
  customerName: json['customerName'] as String? ?? '',
);

Map<String, dynamic> _$ProductModelToJson(ProductModel instance) =>
    <String, dynamic>{
      'title': instance.title,
      'description': instance.description,
      'imageUrl': instance.imageUrl,
      'regularPrice': instance.regularPrice,
      'unit': instance.unit,
      'itemPrice': instance.itemPrice,
      'stock': instance.stock,
      'sku': instance.sku,
      'note': instance.note,
      'customerName': instance.customerName,
      'createdAt': instance.createdAt.toIso8601String(),
    };
