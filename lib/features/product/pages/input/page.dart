import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_taminum_mobile/core/core.dart';
import 'package:flutter_taminum_mobile/features/features.dart';
import 'package:flutter_taminum_mobile/features/product/blocs/blocs.dart';
import 'package:flutter_taminum_mobile/features/product/blocs/form_product_bloc/form_product_bloc.dart';

part 'sections/info_section.dart';

part 'sections/price_section.dart';

part 'sections/stock_section.dart';

class ProductInputPage extends StatefulWidget {
  const ProductInputPage({super.key, this.product});

  final ProductModel? product;

  static const routeName = '/product/input';

  @override
  State<ProductInputPage> createState() => _ProductInputPageState();
}

class _ProductInputPageState extends State<ProductInputPage> {
  @override
  void initState() {
    final p = widget.product;
    context.read<FormProductBloc>().add(InitialFormProductEvent(image: widget.product?.imageUrl));

    if (p != null) {
      context.read<FormProductBloc>().add(ChangeFormProductEvent(
        name: p.title,
        desc: p.description,
        priceRegular: p.regularPrice,
        unit: p.unit,
        priceItem: p.itemPrice,
        stock: p.stock,
        sku: p.sku,
      ));
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<FormProductBloc, FormProductState>(
      listener: (context, state) {
        if (state.status == Status.apply) {
          Navigator.pop(context);
        }
      },
      child: BlocListener<ProductBloc, ProductState>(
        listener: (context, state) {
          if(state.status == Status.apply){
            Navigator.pop(context);
          }
        },
        child: Scaffold(
          body: Scaffold(
            appBar: AppBar(title: Text(widget.product != null ? 'Edit Produk' : 'Tambah Produk')),
            body: Padding(
              padding: EdgeInsets.all(Spacing.defaultSize),
              child: ListView(
                children: [
                  _InfoSection(widget.product),
                  AppDivider(space: Spacing.sp24,),
                  _PriceSection(widget.product),
                  AppDivider(space: Spacing.sp24, thickness: Spacing.sp8,),
                  _StockSection(widget.product),
                ],
              ),
            ),
            bottomNavigationBar: BlocBuilder<FormProductBloc, FormProductState>(
              builder: (context, state) {
                return SafeArea(
                  child: Padding(
                    padding: const EdgeInsets.all(Spacing.defaultSize),
                    child: ElevatedButton(onPressed: state.isValid ? () {
                      if(widget.product != null){
                        context.read<ProductBloc>().add(UpdateProductEvent(state.product(
                          id: widget.product!.id,
                          createdAt: widget.product!.createdAt,
                        )));
                      }else{
                        context.read<ProductBloc>().add(CreateProductEvent(state.product()));
                      }
                    } : null, child: Text(state.isValid == false ? 'input produk detail!' : 'Simpan')),
                  ),
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}
