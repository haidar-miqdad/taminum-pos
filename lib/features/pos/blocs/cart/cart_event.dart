part of 'cart_bloc.dart';

class CartEvent extends Equatable {
  const CartEvent();

  @override
  // TODO: implement props
  List<Object?> get props => [];
}

class InitialCartEvent extends CartEvent {}

class IncrementCartEvent extends CartEvent {

  final ProductModel product;

  const IncrementCartEvent({required this.product});

  @override
  // TODO: implement props
  List<Object?> get props => [product];
}

class DecrementCartEvent extends CartEvent {

  final ProductModel product;

  const DecrementCartEvent({required this.product});

  @override
  // TODO: implement props
  List<Object?> get props => [product];
}
