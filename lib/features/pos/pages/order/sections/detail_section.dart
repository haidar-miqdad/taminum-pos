part of '../page.dart';

class _DetailSection extends StatelessWidget {
  const _DetailSection({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CartBloc, CartState>(
      builder: (context, state) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SubtitleText('Detail Transaksi'),
            AppDivider(),
            _buildItem(title: 'Jumlah Pesanan', value: state.cart.length.toString()),
            _buildItem(title: 'Subtotal', value: 'Rp ${state.getEstimate.toIDR()}'),
            _buildItem(title: 'Pajak', value: 'Rp 0'),
            _buildItem(title: 'Diskon', value: state.type == DiscountType.percentage ? '${state.disc.toString()}%' : '- Rp ${state.disc.toIDR()}', color: Colors.green),
            AppDivider(),
            _buildItem(title: 'Estimasi Tagihan', value: 'Rp ${(state.getEstimate - state.discount).toIDR()}', isBold: true),
          ],
        );
      },
    );
  }

  Widget _buildItem({required String title, required String value, bool isBold = false, Color? color}) {
    return Padding(
      padding: const EdgeInsets.all(Spacing.sp8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          RegularText(title, style: TextStyle(fontWeight: isBold ? FontWeight.bold : null)),
          RegularText.semibold(value, style: TextStyle(color: color),),
        ],
      ),
    );
  }
}
