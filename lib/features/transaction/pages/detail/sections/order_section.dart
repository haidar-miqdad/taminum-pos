
part of '../page.dart';

class _OrderSection extends StatelessWidget {
  const _OrderSection({
    super.key, required this.item
  });

  final TransactionModel item;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
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
                final items = item.items[index];
                return Row(
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        RegularText.semibold(items.title),
                        Spacing.sp2.height,
                        RegularText('Rp ${items.regularPrice.toIDR()}'),
                      ],
                    ),
                    const Spacer(),
                    RegularText.semibold('${items.qty} x'),
                  ],
                );
              },
              separatorBuilder: (BuildContext context, int index) {
                return Spacing.defaultSize.height;
              },
              itemCount: item.items.length,
            ),
            AppDivider(),
            _buildTile('Jumlah pesanan', '${item.items.length}'),
            _buildTile('Subtotal', item.amount.toIDR()),
            _buildTile('Pajak', 'Rp 0'),
            _buildTile('Diskon', '- ${item.discount.toIDR()}', color: Colors.green),
            _buildTile('Total', 'Rp ${item.total.toIDR()}'),
            AppDivider(),
            _buildTile('Dibayar', 'Rp ${item.total.toIDR()}', isBold: true),
            _buildTile('Kembalian', 'Rp ${item.returnAmount.toIDR()}', isBold: true, color: Colors.red),
          ],
        ),
      ),
    );
  }

  Padding _buildTile(String title, String value, {bool isBold = false, Color? color}) {
    return Padding(
            padding: const EdgeInsets.only(bottom: Spacing.sp10),
            child: Row(
              children: [
                isBold ? RegularText.semibold(title) : RegularText(title),
                const Spacer(),
                RegularText.semibold(value, style: TextStyle(color: color)),
              ],
            ),
          );
  }
}
