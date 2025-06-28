part of 'cart_bloc.dart';

class CartState extends Equatable {
  final List<CartModel> cart;

  const CartState({this.cart = const []});

  factory CartState.initial() {
    return const CartState();
  }

  CartState copyWith({List<CartModel>? cart}) {
    return CartState(cart: cart ?? this.cart);
  }

  CartModel? findItem(int id) {
    try {
      return cart.firstWhere((e) => e.products.id == id);
    } catch (e) {
      return null;
    }
  }

  int get getQty {
    int qty = 0;
    for (var item in cart) {
      qty += item.qty;
    }
    return qty;
  }

  int get getEstimate{
    int price = 0;

    for (var element in cart){
      price += element.qty * element.products.itemPrice;
    }
    return price;

  }

  @override
  // TODO: implement props
  List<Object?> get props => [cart];
}
