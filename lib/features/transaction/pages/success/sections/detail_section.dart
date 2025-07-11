part of '../page.dart';

class _DetailSection extends StatelessWidget {
  const _DetailSection({
    super.key,
    required this.referenceId,
  });

  final String referenceId;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TransactionBloc, TransactionState>(
      builder: (context, state) {
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: Spacing.defaultSize),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SubtitleText('Detail Transaksi'),
              AppDivider(),
              _buildTile('Jumlah Pesanan', '${state.item?.items.length}'),
              _buildTile('Sub Total', 'Rp ${state.item?.amount.toIDR()}'),
              _buildTile('pajak', 'Rp 0'),
              _buildTile('Diskon', 'Rp -${state.item?.discount.toIDR()}', color: Colors.green),
              AppDivider(),
              _buildTile('Total Tagihan', 'Rp ${state.item?.total.toIDR()}', isBold: true),
              _buildTile('Total Pembayaran', 'Rp ${state.item?.payAmount.toIDR()}', isBold: true),
              AppDivider(),
              _buildTile('Total Kembali', 'Rp ${state.item?.returnAmount.toIDR()}', isBold: true, color: Colors.red),
            ],
          ),
        );
      },
    );
  }

  Padding _buildTile(String title, String subTitle, {bool isBold = false, Color? color}) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          isBold ? RegularText.semibold(title) : RegularText(title),
          RegularText.semibold(subTitle, style: TextStyle(color: color)),
        ],
      ),
    );
  }
}



