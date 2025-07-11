part of '../page.dart';

class _QrSection extends StatelessWidget {
  const _QrSection({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(Spacing.defaultSize),
        child: BlocBuilder<TransactionBloc, TransactionState>(
          builder: (context, state) {
            if(state.item != null){
              final item = state.item!;
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  RegularText.semibold('QRIS'),
                  AppDivider(),
                  Center(
                    child: QrImageView(
                      data: item.qrString,
                      version: QrVersions.auto,
                      size: 250.0,
                    ),
                  ),
                  Spacing.sp24.height,
                  _buildTile('Jumlah Pesanan', item.items.length.toString()),
                  _buildTile('Subtotal', 'Rp ${item.amount.toIDR()}'),
                  _buildTile('Pajak', 'Rp 0'),
                  _buildTile('Diskon', '- Rp ${item.discount.toIDR()}', color: Colors.green),
                  AppDivider(),
                  _buildTile('Total Tagihan', 'Rp ${item.total.toIDR()}', isBold: true),
                ],
              );
            }else{
              return const SizedBox.shrink();
            }
          },
        ),
      ),
    );
  }

  Widget _buildTile(String title, String value, {Color? color, bool isBold = false}) {
    return Padding(
      padding: const EdgeInsets.only(bottom: Spacing.sp8),
      child: Row(
        children: [
          isBold ? RegularText.semibold(title) : RegularText(title),
          const Spacer(),
          RegularText.semibold(value, style: TextStyle(color: color),),
        ],
      ),
    );
  }
}
