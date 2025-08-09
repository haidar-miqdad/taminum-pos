part of '../page.dart';

class _ActionSection extends StatefulWidget {
  const _ActionSection({ required this.item});

  final TransactionModel item;

  @override
  State<_ActionSection> createState() => _ActionSectionState();
}

class _ActionSectionState extends State<_ActionSection> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TransactionBloc, TransactionState>(
      builder: (context, state) {
        return Card(
          child: Padding(
            padding: EdgeInsets.all(Spacing.defaultSize),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                if (widget.item.type != TypeEnum.paid) ...[
                  OutlinedButton(
                    onPressed: () {
                      context.read<CartBloc>().add(InitialCartEvent(transaction: widget.item));
                      Navigator.of(context).pushNamed(PaymentPage.routeName, arguments: widget.item.referenceId);
                    },
                    child: Text('Bayar'),
                  ),
                  Spacing.defaultSize.height,
                ],
                OutlinedButton(
                  onPressed: () {
                    share(widget.item);
                  },
                  child: Text('Kirim Struk'),
                ),
                Spacing.defaultSize.height,
                ElevatedButton(onPressed: () {
                  if (state.item != null) {
                    context.read<PrinterBloc>().add(TransactionPrinterEvent(state.item!));
                  }
                }, child: Text('Cetak Struk')),
              ],
            ),
          ),
        );
      },
    );
  }

  void share(TransactionModel transaction) {
    ScreenshotController().captureFromWidget(ShareReceipt(data: transaction),
      context: context,
      targetSize: Size(370, 800 + (transaction.items.length * 50)),
    )
        .then((capturedImage) async {
      await ShareHelper.shareImage(context, capturedImage, 'contoh');
    });
  }
}
