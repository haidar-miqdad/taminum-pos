part of '../page.dart';

class _PriceSection extends StatefulWidget {
  const _PriceSection(this.product);

  final ProductModel? product;

  @override
  State<_PriceSection> createState() => _PriceSectionState();
}

class _PriceSectionState extends State<_PriceSection> {

  TextEditingController priceRegularController = TextEditingController();
  TextEditingController unitController = TextEditingController();
  TextEditingController priceItemController = TextEditingController();

  @override
  void initState() {

    priceRegularController.text = widget.product?.regularPrice.toString() ?? '';
    priceItemController.text = widget.product?.itemPrice.toString() ?? '';
    unitController.text = widget.product?.unit ?? '';

    priceRegularController.addListener(() {
      context.read<FormProductBloc>().add(
        ChangeFormProductEvent(priceRegular: int.tryParse(priceRegularController.text)),
      );
    });

    priceItemController.addListener(() {
      context.read<FormProductBloc>().add(
        ChangeFormProductEvent(priceItem: int.tryParse(priceItemController.text)),
      );
    });

    unitController.addListener(() {
      context.read<FormProductBloc>().add(
        ChangeFormProductEvent(unit: unitController.text),
      );
    });


    super.initState();
  }

  @override
  void dispose() {
    priceRegularController.dispose();
    unitController.dispose();
    priceItemController.dispose();
    super.dispose();
  }


  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SubtitleText('Harga'),
        Spacing.sp24.height,
        Row(
          children: [
            Expanded(
                child:
                RegularTextInput(
                  hinText: 'Rp 0',
                  label: 'Harga Regular',
                  required: true,
                  inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                  keyboardType: TextInputType.number,
                  controller: priceRegularController,
                )),
            Spacing.defaultSize.width,
            Expanded(
                child: RegularTextInput(
                  hinText: 'Pcs, kg, etc.',
                  label: 'Unit',
                  required: true,
                  controller: unitController,
                )
            )
          ],
        ),
        Spacing.sp24.height,
        RegularTextInput(
          hinText: 'Rp 0',
          label: 'Biaya Per Item',
          required: true,
          inputFormatters: [FilteringTextInputFormatter.digitsOnly],
          keyboardType: TextInputType.number,
          controller: priceItemController,
        ),
        Spacing.sp24.height,
        BlocBuilder<FormProductBloc, FormProductState>(
          builder: (context, state) {
            return Row(
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      RegularText.medium(
                        'Margin',
                        style: const TextStyle(fontSize: Spacing.sp12),
                      ),
                      Spacing.sp8.height,
                       RegularText(
                        '${state.margin} %',
                        style: TextStyle(fontSize: Spacing.sp12),
                      ),
                    ],
                  ),
                ),
                Spacing.defaultSize.width,
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      RegularText.medium(
                        'Profit',
                        style: const TextStyle(fontSize: Spacing.sp12),
                      ),
                      Spacing.sp8.height,
                      RegularText(
                        '${state.profit} %',
                        style: TextStyle(fontSize: Spacing.sp12),
                      ),
                    ],
                  ),
                ),
              ],
            );
          },
        ),
      ],
    );
  }
}



