part of '../page.dart';

class _OrderSection extends StatelessWidget {
  const _OrderSection({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TransactionBloc, TransactionState>(
      builder: (context, state) {
        return Padding(
          padding: const EdgeInsets.all(Spacing.defaultSize),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SubtitleText('Pesanan'),
              AppDivider(),
              ListView.separated(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                itemBuilder: (BuildContext context, int index) {
                  final items = state.item!.items[index];
                  return _buildTile(
                    items.title,
                    'Rp ${items.regularPrice.toIDR()}',
                    '${items.qty}',
                  );
                },
                separatorBuilder: (BuildContext context, int index) {
                  return Spacing.sp8.height;
                },
                itemCount: state.item!.items.length ?? 0,
              ),

              AppDivider(),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  RegularText.semibold('Subtotal'),
                  RegularText.semibold('Rp ${state.item?.total.toIDR()}'),
                ],
              ),
            ],
          ),
        );
      },
    );
  }

  Widget _buildTile(String title, String price, String qty) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                RegularText.semibold(title),
                Spacing.sp8.height,
                RegularText(price),
              ],
            ),
            RegularText.semibold('$qty x'),
          ],
        ),
      ],
    );
  }
}
