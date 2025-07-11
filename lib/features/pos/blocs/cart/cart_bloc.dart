import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_taminum_mobile/core/core.dart';
import 'package:flutter_taminum_mobile/features/features.dart';

part 'cart_event.dart';
part 'cart_state.dart';

class CartBloc extends Bloc<CartEvent, CartState> {
  CartBloc() : super(CartState.initial()) {

    on<InitialCartEvent>((event, emit) {
      emit(CartState.initial());
    });

    on<ApplyDiscountCartEvent>((event, emit) {
      emit(state.copyWith(disc: event.disc, type: event.type));
    });

    on<IncrementCartEvent>((event, emit) {
      var items = List<CartModel>.from(state.cart);

      if (state.findItem(event.product.id) == null) {
        items.add(CartModel(products: event.product));
      } else {
        items = [];

        for (var element in state.cart) {
          if (event.product.id == element.products.id) {
            items.add(
              CartModel(products: element.products, qty: element.qty + 1),
            );
          } else {
            items.add(element);
          }
        }
      }
      emit(state.copyWith(cart: items));
    });

    on<DecrementCartEvent>((event, emit) {
      List<CartModel> items = [];

      for (var element in state.cart) {
        if (event.product.id == element.products.id) {
          if (element.qty > 1) {
            items.add(
              CartModel(products: element.products, qty: element.qty - 1),
            );
          }
        } else {
          items.add(element);
        }
      }
      emit(state.copyWith(cart: items));
    });

  }
}
