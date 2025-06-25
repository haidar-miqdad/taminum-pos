
part of '../page.dart';

class _FloatingSection extends StatelessWidget {
  const _FloatingSection({
    super.key, required this.onTap,

  });

  final Function() onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
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
                    '2 Item',
                    style: TextStyle(color: context.theme.scaffoldBackgroundColor),
                  ),
                  RegularText.semibold(
                    'Total: 10.000',
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

