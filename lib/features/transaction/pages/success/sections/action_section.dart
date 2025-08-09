part of '../page.dart';

class _ActionSection extends StatefulWidget {
  const _ActionSection({super.key});

  @override
  State<_ActionSection> createState() => _ActionSectionState();
}

class _ActionSectionState extends State<_ActionSection> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TransactionBloc, TransactionState>(
      builder: (context, state) {
        return Padding(
          padding: const EdgeInsets.all(Spacing.defaultSize),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisSize: MainAxisSize.min,
            children: [
              Row(
                children: [
                  Expanded(
                    child: OutlinedButton(onPressed: () {
                      if(state.item != null){
                        context.read<PrinterBloc>().add(TransactionPrinterEvent(state.item!));
                      }
                    }, child: Text('Cetak Struk')),
                  ),
                  Spacing.defaultSize.width,
                  Expanded(
                    child: OutlinedButton(onPressed: () {
                     share( state.item!);
                    }, child: Text('Kirim Struk')),
                  ),
                ],
              ),
              Spacing.sp8.height,
              ElevatedButton(
                onPressed: () {
                  Navigator.pushNamedAndRemoveUntil(
                    context,
                    MainPage.routeName,
                        (route) => false,
                  );
                },
                child: const Text('Transaksi Baru'),
              ),
              Spacing.defaultSize.height,
            ],
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
