
part of '../page.dart';

class _OrderSection extends StatelessWidget {
  const _OrderSection({
    super.key,
  });

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
                return Row(
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        RegularText.semibold('Organic Potato'),
                        Spacing.sp2.height,
                        RegularText('Rp 18.900'),
                      ],
                    ),
                    const Spacer(),
                    RegularText.semibold('2x'),
                  ],
                );
              },
              separatorBuilder: (BuildContext context, int index) {
                return Spacing.defaultSize.height;
              },
              itemCount: 2,
            ),
            AppDivider(),
            _buildTile('Jumlah pesanan', '2'),
            _buildTile('Subtotal', 'Rp 49.000'),
            _buildTile('Pajak', 'Rp 0'),
            _buildTile('Diskon', '- Rp 4.200', color: Colors.green),
            _buildTile('Total', 'Rp 44.800'),
            AppDivider(),
            _buildTile('Dibayar', 'Rp 44.800', isBold: true),
            _buildTile('Kembalian', 'Rp 0', isBold: true, color: Colors.red),
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
