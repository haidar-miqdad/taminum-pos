
part of '../page.dart';

class _OrderSection extends StatelessWidget {
  const _OrderSection({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SubtitleText('Pesanan'),
            RegularText.semibold('+ Diskon Semua', style: TextStyle(color: Colors.green),),
          ],
        ),
        AppDivider(),
        ListView.separated(
          shrinkWrap: true,
          physics: NeverScrollableScrollPhysics(),
          itemBuilder: (BuildContext context, int index) {
            return Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    RegularText.semibold('Avocado'),
                    Spacing.sp8.height,
                    RichText(
                      text: TextSpan(
                        text: 54000.toIDR(),
                        style: context.theme.textTheme.titleMedium,
                        children: [
                          TextSpan(
                            text: ' /pcs',
                            style: const TextStyle(
                                fontWeight: FontWeight.normal),
                          ),
                        ],
                      ),
                    ),
                    Spacing.sp12.height,
                    CartProductButton(
                    ),
                  ],
                ),
                CartProductButton(
                ),
              ],
            );
          },
          separatorBuilder: (BuildContext context, int index) => Spacing.defaultSize.height,
          itemCount: 2,
        )
      ],
    );
  }
}
