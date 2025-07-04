import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'product_model.g.dart';

@JsonSerializable()
class ProductModel extends Equatable{

  @JsonKey(name: 'id', includeToJson: false)
  final int id;
  @JsonKey(name: 'title', defaultValue: '')
  final String title;
  @JsonKey(name: 'description', defaultValue: '')
  final String description;
  @JsonKey(name: 'imageUrl', defaultValue: '')
  final String imageUrl;
  @JsonKey(name: 'regularPrice', defaultValue: 0)
  final int regularPrice;
  @JsonKey(name: 'unit', defaultValue: '')
  final String unit;
  @JsonKey(name: 'itemPrice', defaultValue: 0)
  final int itemPrice;
  @JsonKey(name: 'stock', defaultValue: 0)
  final int stock;
  @JsonKey(name: 'sku', defaultValue: '')
  final String sku;
  @JsonKey(name: 'note', defaultValue: '')
  final String note;
  @JsonKey(name: 'customerName', defaultValue: '')
  final String customerName;
  // created at
  final DateTime createdAt;

  const ProductModel({
  required this.title,
    required this.description,
    required this.imageUrl,
    required this.regularPrice,
    required this.unit,
    required this.itemPrice,
    required this.stock,
    required this.sku,
    this.note = '',
    this.id = 0,
    required this.createdAt,
    this.customerName = '',

  });

  factory ProductModel.fromJson(Map<String, dynamic> json) => _$ProductModelFromJson(json);

  Map<String, dynamic> toJson() => _$ProductModelToJson(this);

  @override
  List<Object> get props => [ title, description, imageUrl, regularPrice, unit, itemPrice, stock, id, sku , createdAt, note, customerName];
}
