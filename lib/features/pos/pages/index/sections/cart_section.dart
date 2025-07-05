
part of '../page.dart';

class _CartSection extends StatelessWidget {
  const _CartSection({
    super.key, required this.qtyItems, required this.price,
  });

  final int qtyItems;
  final num price;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
      Navigator.pushNamed(context, POSOrderPage.routeName);
    },
      child: Container(
        margin: const EdgeInsets.all(Spacing.defaultSize),
        padding: const EdgeInsets.all(Spacing.sp12),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(Spacing.sp8),
          color: context.theme.primaryColor,
        ),
        child: Row(
          children: [
            Icon(AppIcons.shoppingCart, color: context.theme.scaffoldBackgroundColor),
            Spacing.defaultSize.width,
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  RegularText.semibold(
                    '$qtyItems items',
                    style: TextStyle(color: context.theme.scaffoldBackgroundColor),
                  ),
                  RegularText.semibold(
                    'Rp ${price.toIDR()}',
                    style: TextStyle(fontSize: Spacing.sp12, color: context.theme.scaffoldBackgroundColor),
                  ),
                ],
              ),
            ),
            Spacing.defaultSize.width,
            Icon(Icons.arrow_forward_rounded, color: context.theme.scaffoldBackgroundColor),
          ],
        ),
      ),
    );
  }
}

