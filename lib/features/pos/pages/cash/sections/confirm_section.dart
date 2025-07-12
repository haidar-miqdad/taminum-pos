part of '../page.dart';

class _ConfirmSection extends StatelessWidget {
  const _ConfirmSection({required this.nominal, this.referenceId});

  final num nominal;

  final String? referenceId;

  @override
  Widget build(BuildContext context) {
    return ContentSheet(
      child: BlocListener<TransactionBloc, TransactionState>(
        listener: (context, state) {
          if(state.status == Status.success){
            Navigator.pushNamedAndRemoveUntil(
              context,
              SuccessTransactionPage.routeName,
              (route) => false,
              arguments: state.item?.referenceId,
            );
          }
        },
        child: BlocBuilder<CartBloc, CartState>(
          builder: (context, state) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                RegularText.semibold('Selesaikan Pembayaran'),
                Spacing.defaultSize.height,
                RegularText('Anda akan menyelesaikan pembayaran dengan \nnilai transaksi sebesar Rp. ${(state.getEstimate - state.discount).toIDR()}', style: TextStyle(fontSize: Spacing.sp12)),
                AppDivider(space: Spacing.defaultSize),
                Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [RegularText.semibold('Uang diterima'), RegularText.semibold('Rp ${nominal.toIDR()}')]),
                Spacing.sp12.height,
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    RegularText.semibold('Kembalian', style: TextStyle(color: Colors.red)),
                    RegularText.semibold('Rp ${(nominal - (state.getEstimate - state.discount)).toIDR()}', style: TextStyle(color: Colors.red)),
                  ],
                ),
                Spacing.sp20.height,
                SafeArea(
                  child: ElevatedButton(
                    onPressed: () {
                      context.read<TransactionBloc>().add(CreateTransactionEvent(state.transaction(TypeEnum.paid, payAmount: nominal), referenceId: referenceId));

                    },
                    child: RegularText.semibold('Konfirmasi', style: TextStyle(color: MainColors.white)),
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
