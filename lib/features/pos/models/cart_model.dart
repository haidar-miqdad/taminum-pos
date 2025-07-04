import 'package:equatable/equatable.dart';
import 'package:flutter_taminum_mobile/features/features.dart';
import 'package:flutter_taminum_mobile/features/transaction/models/transaction_item_model.dart';

class CartModel extends Equatable {
  final int qty;
  final ProductModel products;

  TransactionItemModel get toTransaction{
    return TransactionItemModel(
        qty: qty,
        note: products.note,
        customerName: products.customerName,
        title: products.title,
        description: products.description,
        imageUrl: products.imageUrl,
        regularPrice: products.regularPrice,
        itemPrice: products.itemPrice,
        stock: products.stock,
        unit: products.unit,
        sku: products.sku,
        transactionId: 0,
    );
  }

  const CartModel({this.qty = 1, required this.products});
  
  @override
  // TODO: implement props
  List<Object?> get props => [qty, products];
}
