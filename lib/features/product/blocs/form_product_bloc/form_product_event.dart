part of 'form_product_bloc.dart';

class FormProductEvent extends Equatable {
  const FormProductEvent();

  @override
  List<Object?> get props => [];
}

class InitialFormProductEvent extends FormProductEvent {
  final String? image;

  const InitialFormProductEvent({this.image});

  @override
  List<Object?> get props => [image];
}

class ChangeImageFormProductEvent extends FormProductEvent {}

class ChangeFormProductEvent extends FormProductEvent {
  final String? name;
  final String? desc;
  final int? priceRegular;
  final String? unit;
  final int? priceItem;
  final int? stock;
  final String? sku;


  const ChangeFormProductEvent({this.name, this.desc, this.priceRegular, this.unit, this.priceItem, this.stock, this.sku,});

  @override
  List<Object?> get props => [
    name,
    desc,
    priceRegular,
    unit,
    priceItem,
    stock,
    sku,
  ];
}
