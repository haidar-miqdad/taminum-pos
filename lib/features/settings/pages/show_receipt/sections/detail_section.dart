
part of '../page.dart';

class _DetailSection extends StatefulWidget {
  const _DetailSection({
    super.key,
  });

  @override
  State<_DetailSection> createState() => _DetailSectionState();
}

class _DetailSectionState extends State<_DetailSection> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(Spacing.defaultSize),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SubtitleText('Detail Transaksi'),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: Spacing.defaultSize),
            child: Divider(color: MainColors.white[400], thickness: 1,),
          ),
          _buildTile('Jumlah pesanan', '3',),
          _buildTile('Subtotal', 'Rp 49.000'),
          _buildTile('Pajak', 'Rp 0',),
          _buildTile('Diskon', '- Rp 4.200', isDiscount: true),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: Spacing.defaultSize),
            child: Divider(color: MainColors.white[400], thickness: 1,),
          ),
          _buildTile('Total Tagihan', 'Rp 44.800', isRegular: false),
          _buildTile('Total Pembayaran', 'Rp 50.000', isRegular: false),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: Spacing.defaultSize),
            child: Divider(color: MainColors.white[400], thickness: 1,),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              RegularText.semibold('Total Kembali'),
              RegularText.semibold('Rp 4.200', style: TextStyle(color: Colors.red),),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildTile(
      String title,
      String value,
       {bool isRegular = true,
        bool isDiscount = false,
      }) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: Spacing.sp8),
      child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              isRegular ? RegularText(title,) : RegularText.semibold(title),
              RegularText.semibold(value, style: TextStyle(color: isDiscount ? Colors.green : null),),
            ],
          ),
    );
  }
}

