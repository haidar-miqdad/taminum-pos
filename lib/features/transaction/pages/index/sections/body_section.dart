part of '../page.dart';


class _ItemSection extends StatefulWidget {


  final String categoryTransaction;
  final String value;
  final String date;

  const _ItemSection({
    super.key,
    required this.categoryTransaction,
    required this.value,
    required this.date,
  });


  @override
  State<_ItemSection> createState() => _ItemSectionState();
}

class _ItemSectionState extends State<_ItemSection> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {},
      child: Padding(
        padding: const EdgeInsets.only(bottom: Spacing.sp12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  padding: EdgeInsets.symmetric(horizontal: Spacing.sp12, vertical: Spacing.sp4),
                  decoration: BoxDecoration(
                      border: Border.all(
                        color: context.theme.primaryColor,
                      ),
                      borderRadius: BorderRadius.circular(Spacing.sp8)
                  ),
                  child: RegularText.semibold('Done', style: TextStyle(color: context.theme.primaryColor),),
                ),
                RegularText.semibold(widget.date, style: TextStyle(color: MainColors.black[200], fontSize: Spacing.sp12),)
              ],
            ),
            Spacing.defaultSize.height,
            RegularText.semibold(widget.categoryTransaction, style: TextStyle(fontSize: Spacing.defaultSize),),
            Spacing.sp8.height,
            RegularText.semibold(widget.value, style: TextStyle(color: context.theme.primaryColor),),
            Divider(thickness: 0.1, color: MainColors.black[200],),
          ],

        ),
      ),
    );
  }
}