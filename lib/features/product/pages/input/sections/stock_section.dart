
part of '../page.dart';

class _StockSection extends StatefulWidget {
  const _StockSection(this.product,);

  final ProductModel? product;



  @override
  State<_StockSection> createState() => _StockSectionState();
}

class _StockSectionState extends State<_StockSection> {

  TextEditingController skuController = TextEditingController();
  TextEditingController stockController = TextEditingController();

  @override
  void initState() {
    skuController.text = widget.product?.sku ?? '';
    stockController.text = widget.product?.stock.toString() ?? '';

    context.read<FormProductBloc>().add(ChangeFormProductEvent(stock: int.tryParse(stockController.text)));
    context.read<FormProductBloc>().add(ChangeFormProductEvent(sku: skuController.text));


    super.initState();
  }

  @override
  void dispose() {
    skuController.dispose();
    stockController.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        RegularTextInput(
          hinText: 'SKU (Stock Keeping Unit)',
          label: 'Stock Keeping Unit',
          controller: skuController,
        ),
        Spacing.sp24.height,
        RegularTextInput(
          hinText: 'etc. 100',
          label: 'Total Stock',
          inputFormatters: [FilteringTextInputFormatter.digitsOnly],
          keyboardType: TextInputType.number,
          controller: stockController,
        ),
      ],
    );
  }
}

