
part of '../page.dart';

class _StockSection extends StatelessWidget {
  const _StockSection({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        RegularTextInput(hinText: 'SKU (Stock Keeping Unit)', label: 'SKU (Stock Keeping Unit)',),
        Spacing.sp24.height,
        RegularTextInput(hinText: 'etc. 100', label: 'Total Stock',),

      ],
    );
  }
}

