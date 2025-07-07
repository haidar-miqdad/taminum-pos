part of '../page.dart';

class _ActionSection extends StatelessWidget {
  const _ActionSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: double.infinity,
          padding: const EdgeInsets.all(Spacing.defaultSize),
          decoration: BoxDecoration(
            border: Border.all(color: MainColors.white[400]!),
            borderRadius: BorderRadius.circular(Spacing.sp8),
          ),
          child: Row(
            children: [
              Icon(Icons.check_circle_outline, color: context.theme.primaryColor),
              Spacing.sp12.width,
              Expanded(
                child: RegularText('Tagihan akhir bisa dilihat pada halaman pembayaran setelah memilih metode pembayaran', style: TextStyle(fontSize: Spacing.sp10)),
              ),
            ],
          ),
        ),
        Spacing.sp24.height,
        Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisSize: MainAxisSize.min,
          children: [
            Row(
              children: [
                Expanded(
                  child: BlocBuilder<CartBloc, CartState>(
                    builder: (context, state) {
                      return OutlinedButton(
                        onPressed: () {
                          context.read<TransactionBloc>().add(CreateTransactionEvent(state.transaction(TypeEnum.draft)));
                        },
                        child: Text('Simpan Pesanan'),

                      );
                    },
                  ),
                ),
                Spacing.defaultSize.width,
                Expanded(
                  child: OutlinedButton(onPressed: () {}, child: Text('Hapus')),
                ),
              ],
            ),
            Spacing.sp8.height,
            ElevatedButton(onPressed: () {
              Navigator.pushNamed(context, PaymentPage.routeName);
            }, child: Text('Pilih Pembayaran')),
          ],
        ),
      ],
    );
  }
}
