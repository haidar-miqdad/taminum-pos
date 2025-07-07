part of '../page.dart';


class _ItemSection extends StatelessWidget {

  const _ItemSection(
      this.transaction,
  );

  final TransactionModel transaction;

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
                  child: RegularText.semibold(transaction.type.valueName, style: TextStyle(color: context.theme.primaryColor),),
                ),
                RegularText.semibold(transaction.createdAt.dateFormatted, style: TextStyle(color: MainColors.black[200], fontSize: Spacing.sp12),)
              ],
            ),
            Spacing.defaultSize.height,
            RegularText.semibold('${transaction.paymentType.valueName} • ${transaction.referenceId}', style: TextStyle(fontSize: Spacing.defaultSize),),
            Spacing.sp8.height,
            RegularText.semibold('Rp ${(transaction.amount - transaction.discount).toIDR()}', style: TextStyle(color: context.theme.primaryColor),),
            AppDivider(),
          ],

        ),
      ),
    );
  }
}