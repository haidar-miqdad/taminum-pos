
import 'package:equatable/equatable.dart';
import 'package:flutter_taminum_mobile/features/features.dart';

class CartModel extends Equatable{

  final int qty;
  final ProductModel products;

  const CartModel({ this.qty = 1, required this.products});

  @override
  // TODO: implement props
  List<Object?> get props => [qty, products];

}