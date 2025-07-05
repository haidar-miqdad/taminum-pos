part of '../page.dart';

class _OrderSection extends StatefulWidget {
  const _OrderSection({super.key});

  @override
  State<_OrderSection> createState() => _OrderSectionState();
}

class _OrderSectionState extends State<_OrderSection> {

  void _showDiscount(BuildContext context, num disc, DiscountType? type) {
    showModalBottomSheet(
      context: context,
      builder: (context) => _DiscountSection(
        type: type,
        disc: disc,
      ),
      isScrollControlled: true,
    );


  }


  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CartBloc, CartState>(
      builder: (context, state) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SubtitleText('Pesanan'),
                GestureDetector(
                  onTap: () {
                    _showDiscount(context, state.disc, state.type);
                  },
                  child: RegularText.semibold('+ Diskon Semua', style: TextStyle(color: Colors.green)),
                ),
              ],
            ),
            AppDivider(),
            ListView.separated(
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              itemBuilder: (BuildContext context, int index) {
                final items = state.cart[index];
                return Row(
                  children: [
                    Expanded(
                      // ⬅️ ini membuat Column tidak overflow
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          RegularText.semibold(items.products.title),
                          Spacing.sp8.height,
                          RichText(
                            text: TextSpan(
                              text: 'Rp ${items.products.regularPrice.toIDR()}',
                              style: context.theme.textTheme.titleMedium,
                              children: [
                                TextSpan(
                                  text: ' /pcs',
                                  style: const TextStyle(fontWeight: FontWeight.normal),
                                ),
                              ],
                            ),
                          ),
                          Spacing.sp12.height,
                          CartProductButton(count: items.qty, onNoted: () {}, products: items.products),
                        ],
                      ),
                    ),
                  ],
                );
              },
              separatorBuilder: (BuildContext context, int index) => Spacing.defaultSize.height,
              itemCount: state.cart.length,
            )
          ],
        );
      },
    );
  }
}


