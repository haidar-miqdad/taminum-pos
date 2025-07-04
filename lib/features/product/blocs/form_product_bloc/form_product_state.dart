part of 'form_product_bloc.dart';

class FormProductState extends Equatable {
  final Status status;
  final String? error;
  final String? name;
  final String? image;
  final String? desc;
  final int? priceRegular;
  final String? unit;
  final int? priceItem;
  final int? stock;
  final String? sku;

  const FormProductState({
    this.status = Status.initial,
    this.error,
    this.name,
    this.image,
    this.desc,
    this.priceRegular,
    this.unit,
    this.priceItem,
    this.stock, this.sku
  });

  factory FormProductState.initial(){
    return FormProductState();
  }

  num get totalCost {
    final item = priceItem ?? 0;
    final unit = int.tryParse(this.unit ?? '') ?? 1;
    return item * unit;
  }

  num get profit {
    final revenue = priceRegular ?? 0;
    return revenue - totalCost;
  }

  num get margin {
    final revenue = priceRegular ?? 0;
    if (revenue == 0) return 0;
    return (profit / revenue) * 100;
  }


  bool get isValid {
    return name != null && name!.isNotEmpty &&
        desc != null && desc!.isNotEmpty &&
         priceRegular != null && (priceRegular ?? 0) > 0 &&
    unit != null && unit!.isNotEmpty;
  }

  // Getter ini adalah jembatan antara data di BLoC (state form) dan
  // data model yang dibutuhkan untuk simpan ke backend/database.
  ProductModel product({int? id, DateTime? createdAt}){
    return ProductModel(
      id: id ?? 0,
      title: name ?? '',
      description: desc ?? '',
      imageUrl: image ?? '',
      regularPrice: priceRegular ?? 0,
      unit: unit ?? '',
      itemPrice: priceItem ?? 0,
      stock: stock ?? 0,
      sku: sku ?? '',
      createdAt: createdAt ?? DateTime.now(),
    );
  }

  FormProductState copyWith({
    Status? status,
    String? error,
    String? name,
    String? desc,
    String? image,
    int? priceRegular,
    String? unit,
    int? priceItem,
    int? stock,
    String? sku,
  }) {
    return FormProductState(
      desc: desc ?? this.desc,
      error: error,
      image: image ?? this.image,
      name: name ?? this.name,
      priceItem: priceItem ?? this.priceItem,
      priceRegular: priceRegular ?? this.priceRegular,
      status: status ?? this.status,
      stock: stock ?? this.stock,
      sku: sku ?? this.sku,
      unit: unit ?? this.unit,
    );
  }

  @override
  // TODO: implement props
  List<Object?> get props => [desc, name, image, priceRegular, unit, priceItem, stock, status, error];
}
