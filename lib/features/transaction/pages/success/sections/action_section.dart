part of '../page.dart';

class _ActionSection extends StatelessWidget {
  const _ActionSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(Spacing.defaultSize),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            children: [
              Expanded(
                child: OutlinedButton(onPressed: () {}, child: Text('Cetak Struk')),
              ),
              Spacing.defaultSize.width,
              Expanded(
                child: OutlinedButton(onPressed: () {}, child: Text('Kirim Struk')),
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
        ],
      ),
    );
  }
}
