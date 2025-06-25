
part of '../page.dart';

class _DetailSection extends StatelessWidget {
  const _DetailSection({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SubtitleText('Detail Transaksi'),
        AppDivider(),
        _buildItem(title: 'Jumlah Pesanan', value: '2'),
        _buildItem(title: 'Subtotal', value: 'Rp 10.000',),
        _buildItem(title: 'Pajak', value: 'Rp 0'),
        _buildItem(title: 'Diskon', value: 'Rp 0'),
        AppDivider(),
        _buildItem(title: 'Estimasi Tagihan', value: 'Rp 10.000', isBold: true),
      ],
    );
  }

  Widget _buildItem({
    required String title,
    required String value,
    bool isBold = false,
}) {
    return Padding(
        padding: const EdgeInsets.all(Spacing.sp8),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            RegularText(title, style: TextStyle(fontWeight: isBold ? FontWeight.bold : null),),
            RegularText.semibold(value),
          ],
        ),
      );
  }
}

