part of '../page.dart';

class _ActionSection extends StatelessWidget {
  const _ActionSection({super.key, required this.item});

  final TransactionModel item;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: EdgeInsets.all(Spacing.defaultSize),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            if (item.type != TypeEnum.paid) ...[
              OutlinedButton(onPressed: () {
                context.read<CartBloc>().add(InitialCartEvent(transaction: item));
                Navigator.of(context).pushNamed(PaymentPage.routeName, arguments: item.referenceId);
              },
                  child: Text('Bayar')), Spacing.defaultSize.height,
            ],
            OutlinedButton(onPressed: () {}, child: Text('Kirim Struk')),
            Spacing.defaultSize.height,
            ElevatedButton(onPressed: () {}, child: Text('Cetak Struk')),
          ],
        ),
      ),
    );
  }
}
