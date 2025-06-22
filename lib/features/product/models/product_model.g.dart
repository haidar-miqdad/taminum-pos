// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ProductModel _$ProductModelFromJson(Map<String, dynamic> json) => ProductModel(
  title: json['title'] as String,
  description: json['description'] as String,
  imageUrl: json['imageUrl'] as String,
  regularPrice: json['regularPrice'] as double,
  unit: json['unit'] as String,
  itemPrice: json['itemPrice'] as double,
  stock: json['stock'] as int,
  sku: json['sku'] as String,
  id: json['id'] as int,
  createdAt: DateTime.parse(json['createdAt'] as String),

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
      'id': instance.id,
      'createdAt': instance.createdAt.toIso8601String(),

    };
