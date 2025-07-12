import 'package:equatable/equatable.dart';
import 'package:flutter_taminum_mobile/features/features.dart';
import 'package:json_annotation/json_annotation.dart';

part 'transaction_item_model.g.dart';

@JsonSerializable()
class TransactionItemModel extends Equatable {
  @JsonKey(includeToJson: false)
  final int id;

  @JsonKey(defaultValue: 1)
  final int qty;

  @JsonKey(defaultValue: '')
  final String note;

  @JsonKey(defaultValue: '')
  final String title;

  @JsonKey(defaultValue: '')
  final String description;

  @JsonKey(defaultValue: '')
  final String imageUrl;

  @JsonKey(defaultValue: 0)
  final int regularPrice;

  @JsonKey(defaultValue: 0)
  final int itemPrice;

  @JsonKey(defaultValue: 0)
  final int stock;

  @JsonKey(defaultValue: '')
  final String unit;

  @JsonKey(defaultValue: '')
  final String sku;

  @JsonKey(defaultValue: '')
  final String customerName;

  final int transactionId;

  const TransactionItemModel({
    this.id = 0,
    this.qty = 1,
    this.note = '',
    this.customerName = '',
    required this.title,
    required this.description,
    required this.imageUrl,
    required this.regularPrice,
    required this.itemPrice,
    required this.stock,
    required this.unit,
    required this.sku,
    required this.transactionId,
  });

  TransactionItemModel changeId(int id) {
    return TransactionItemModel(
      qty: qty,
      note: note,
      title: title,
      description: description,
      imageUrl: imageUrl,
      regularPrice: regularPrice,
      itemPrice: itemPrice,
      stock: stock,
      unit: unit,
      sku: sku,
      transactionId: id,
      customerName: customerName,
    );
  }

  ProductModel get toCart {
    return ProductModel(
        title: title,
        description: description,
        imageUrl: imageUrl,
        regularPrice: regularPrice,
        unit: unit,
        itemPrice: itemPrice,
        stock: stock,
      sku: sku,
        id: id,
        createdAt: DateTime.now(),
    );
  }

  factory TransactionItemModel.fromJson(Map<String, dynamic> json) => _$TransactionItemModelFromJson(json);

  Map<String, dynamic> toJson() => _$TransactionItemModelToJson(this);

  @override
  // TODO: implement props
  List<Object?> get props => [id, qty, note, title, description, imageUrl, regularPrice, itemPrice, stock, unit, sku, transactionId, customerName];
}
