import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_taminum_mobile/core/core.dart';
import 'package:flutter_taminum_mobile/features/features.dart';
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
    context.read<FormProductBloc>().add(InitialFormProductEvent(image: widget.product?.imageUrl));
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
      child: Scaffold(
        appBar: AppBar(title: Text(widget.product != null ? 'Edit Produk' : 'Tambah Produk')),
        body: Padding(
          padding: const EdgeInsets.all(Spacing.defaultSize),
          child: ListView(
            children: [
              _InfoSection(),
              Divider24(),
              _PriceSection(),
              Divider24(thickness: Spacing.sp8),
              _StockSection(),
            ],
          ),
        ),
        bottomNavigationBar: BlocBuilder<FormProductBloc, FormProductState>(
          builder: (context, state) {
            return SafeArea(
              child: Padding(
                padding: const EdgeInsets.all(Spacing.defaultSize),
                child: ElevatedButton(onPressed:
                state.isValid
                    ? () {}
                    : null,
                    child: Text('Simpan')),
              ),
            );
          },
        ),
      ),
    );
  }
}
