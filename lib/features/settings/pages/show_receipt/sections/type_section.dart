part of '../page.dart';

class _TypeSection extends StatelessWidget {
  const _TypeSection({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(Spacing.defaultSize),
      child: Column(
        children: [
          _buildTile('Tipe Pemabayaran', 'Tunai'),
          Spacing.sp12.height,
          _buildTile('Order Id', 'TRX-100-10102030405'),
        ],
      ),
    );
  }

  Row _buildTile(String title, String value) {
    return Row(
          children: [
            RegularText(title, style: TextStyle(fontSize: 12),),
            Spacer(),
            RegularText.semibold(value, style: TextStyle(fontSize: 12),)
          ],
        );
  }
}


