part of '../page.dart';

class _StatusSection extends StatelessWidget {
  const _StatusSection({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(Spacing.sp24),
      child: BlocBuilder<TransactionBloc, TransactionState>(
        builder: (context, state) {
          return Column(
            children: [
              Lottie.asset(MainAssets.successLottie, width: 150, height: 150,),
              Spacing.sp24.height,
              RegularText.semibold('Transaksi Berhasil'),
              Spacing.sp8.height,
              RegularText(state.item?.createdAt.dateFormatted ?? ''),
            ],
          );
        },
      ),
    );
  }
}