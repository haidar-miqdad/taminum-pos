part of '../page.dart';

class _TypePaymentSection extends StatelessWidget {
  const _TypePaymentSection({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TransactionBloc, TransactionState>(
      builder: (context, state) {
        return Padding(
          padding: const EdgeInsets.all(Spacing.defaultSize),
          child: Column(children: [
            _buildTile('Tipe Pembayaran', '${state.item?.paymentType.valueName}'),
            Spacing.sp8.height,
            _buildTile('Order ID', '${state.item?.referenceId}'),
          ],

          ),
        );
      },
    );
  }

  Row _buildTile(String title, String value) {
    return Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [RegularText(title), RegularText.semibold(value)]);
  }
}
