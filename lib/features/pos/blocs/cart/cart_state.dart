part of 'cart_bloc.dart';

class CartState extends Equatable {
  final List<CartModel> cart;
  final DiscountType? type;
  final num disc;

  const CartState({this.cart = const [], this.disc = 0, this.type});

  factory CartState.initial() {
    return const CartState();
  }

  CartState copyWith({List<CartModel>? cart, DiscountType? type, num? disc}) {
    return CartState(cart: cart ?? this.cart, type: type ?? this.type, disc: disc ?? this.disc);
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

  int get getEstimate {
    int price = 0;

    for (var element in cart) {
      price += element.qty * element.products.itemPrice;
    }
    return price;
  }

  num get discount{
    if(type == DiscountType.percentage){
      return getEstimate * disc / 100;
    }else{
      return getEstimate - disc;
    }
  }

  @override
  // TODO: implement props
  List<Object?> get props => [cart, type, disc];
}
