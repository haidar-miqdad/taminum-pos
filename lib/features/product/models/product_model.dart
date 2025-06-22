import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'product_model.g.dart';

@JsonSerializable()
class ProductModel extends Equatable{

  @JsonKey(name: 'id')
  final int id;
  @JsonKey(name: 'title')
  final String title;
  @JsonKey(name: 'description')
  final String description;
  @JsonKey(name: 'imageUrl')
  final String imageUrl;
  @JsonKey(name: 'regularPrice')
  final double regularPrice;
  @JsonKey(name: 'unit')
  final String unit;
  @JsonKey(name: 'itemPrice')
  final double itemPrice;
  @JsonKey(name: 'stock')
  final int stock;
  @JsonKey(name: 'sku')
  final String sku;
  // created at
  @JsonKey(name: 'createdAt')
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
    required this.id,
    required this.createdAt
  });

  factory ProductModel.fromJson(Map<String, dynamic> json) => _$ProductModelFromJson(json);

  Map<String, dynamic> toJson() => _$ProductModelToJson(this);

  @override
  List<Object> get props => [ title, description, imageUrl, regularPrice, unit, itemPrice, stock, id, sku , createdAt ];
}
