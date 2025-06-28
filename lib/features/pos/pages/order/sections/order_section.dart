part of '../page.dart';

class _OrderSection extends StatelessWidget {
  const _OrderSection({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SubtitleText('Pesanan'),
            RegularText.semibold('+ Diskon Semua', style: TextStyle(color: Colors.green),),
          ],
        ),
        AppDivider(),
        BlocBuilder<CartBloc, CartState>(
          builder: (context, state) {
            return ListView.separated(
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              itemBuilder: (BuildContext context, int index) {
                final items = state.cart[index];
                return Row(
                  children: [
                    Expanded( // ⬅️ ini membuat Column tidak overflow
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          RegularText.semibold(items.products.title),
                          Spacing.sp8.height,
                          RichText(
                            text: TextSpan(
                              text: items.products.itemPrice.toIDR(),
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
                          CartProductButton(
                            count: items.qty,
                            onNoted: () {},
                            products: items.products,
                          ),
                        ],
                      ),
                    ),
                  ],
                );

              },
              separatorBuilder: (BuildContext context, int index) => Spacing.defaultSize.height,
              itemCount: state.cart.length,
            );
          },
        )
      ],
    );
  }
}
