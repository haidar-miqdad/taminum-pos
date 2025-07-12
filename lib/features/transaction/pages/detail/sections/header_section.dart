part of '../page.dart';

class _HeaderSection extends StatelessWidget {
  const _HeaderSection({
    super.key, required this.item,
  });

  final TransactionModel item;

  @override
  Widget build(BuildContext context) {
    return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            RegularText.semibold('#${item.referenceId}'),
            Spacing.sp8.height,
            Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Container(
                  padding: EdgeInsets.symmetric(vertical: Spacing.sp4, horizontal: Spacing.sp8),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(100),
                      color: Colors.yellow
                  ),
                  child: Row(
                    children: [
                      Container(
                        width: 10,
                        height: 10,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(100),
                            color: Colors.amber
                        ),
                      ),
                      Spacing.sp6.width,
                      RegularText(item.paymentType.valueName.toUpperCase())
                    ],
                  ),
                ),
              ],
            ),
            Spacing.sp8.height,
            RegularText.semibold(item.createdAt.dateFormatted, style: TextStyle(color: MainColors.black[200], fontSize: Spacing.sp12),)
          ],
        );

  }
}
