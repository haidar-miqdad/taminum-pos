part of '../page.dart';

class _OrderSection extends StatelessWidget {
  const _OrderSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(Spacing.defaultSize),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SubtitleText('Pesanan'),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: Spacing.defaultSize),
            child: Divider(color: MainColors.white[400], thickness: 1),
          ),
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
                      RegularText.semibold('Coffee Latte'),
                      Spacing.sp4.height,
                      RegularText('Rp 18.900', style: TextStyle(fontSize: 12)),
                    ],
                  ),
                  RegularText.semibold('2x'),
                ],
              );
            },
            separatorBuilder: (BuildContext context, int index) {
              return Spacing.defaultSize.height;
            },
            itemCount: 2,
          ),

          Padding(
            padding: const EdgeInsets.symmetric(vertical: Spacing.defaultSize),
            child: Divider(color: MainColors.white[400], thickness: 1),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              RegularText.semibold('Subtotal', style: TextStyle(fontSize: 12)),
              Spacing.sp4.height,
              RegularText.semibold('Rp 18.900', style: TextStyle(fontSize: 12)),
            ],
          ),
        ],
      ),
    );
  }
}
