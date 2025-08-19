part of 'product_bloc.dart';

class ProductState extends Equatable {
  const ProductState({
    this.status = Status.initial,
    this.error,
    this.products = const [],
  });

  final Status status;
  final String? error;
  final List<ProductModel> products;

  factory ProductState.initial() {
    return ProductState();
  }

  ProductState copyWith({
    Status? status,
    String? error,
    List<ProductModel>? product,
  }) {
    return ProductState(
      status: status ?? this.status,
      error: error ?? this.error,
      products: product ?? this.products,
    );
  }

  @override
  // TODO: implement props
  List<Object?> get props => [status, error, products];
}
