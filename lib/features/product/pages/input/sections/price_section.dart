
part of '../page.dart';

class _PriceSection extends StatelessWidget {
  const _PriceSection({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SubtitleText('Harga'),
        Spacing.sp24.height,
        Row(
          children: [
            Expanded(child: RegularTextInput(hinText: 'Rp 0', label: 'Harga Regular', required: true,)),
            Spacing.defaultSize.width,
            Expanded(child: RegularTextInput(hinText: 'Pcs, kg, etc.', label: 'Unit', required: true,))
          ],
        ),
        Spacing.sp24.height,
        RegularTextInput(hinText: 'Rp 0', label: 'Biaya Per Item', required: true,),
        Spacing.sp24.height,
        Row(
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  RegularText.medium(
                    'Margin',
                    style: const TextStyle(fontSize: Spacing.sp12),
                  ),
                  Spacing.sp8.height,
                  const RegularText(
                    '-',
                    style: TextStyle(fontSize: Spacing.sp12),
                  ),
                ],
              ),
            ),
            Spacing.defaultSize.width,
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  RegularText.medium(
                    'Profit',
                    style: const TextStyle(fontSize: Spacing.sp12),
                  ),
                  Spacing.sp8.height,
                  const RegularText(
                    '-',
                    style: TextStyle(fontSize: Spacing.sp12),
                  ),
                ],
              ),
            ),
          ],
        ),
      ],
    );
  }
}



