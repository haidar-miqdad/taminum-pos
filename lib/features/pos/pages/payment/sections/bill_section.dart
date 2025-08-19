part of '../page.dart';

class _BillSection extends StatelessWidget {
  const _BillSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(Spacing.defaultSize),
      child: BlocBuilder<CartBloc, CartState>(
        builder: (context, state) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              RegularText.semibold('Nilai Transaksi'),
              Spacing.sp10.height,
              HeadlineText(
                (state.getEstimate - state.discount).toIDR(),
                style: TextStyle(
                  fontSize: Spacing.sp30,
                  color: context.theme.primaryColor,
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
