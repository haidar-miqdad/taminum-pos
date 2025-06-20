
part of '../page.dart';

class _ItemSection extends StatelessWidget {

  final Function()? onTap;
  final String title;
  final String port;

  const _ItemSection({
    super.key, this.onTap, required this.title, required this.port,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(Spacing.sp24),
      decoration: BoxDecoration(
          color: context.theme.scaffoldBackgroundColor,
          borderRadius: BorderRadius.circular(Spacing.sp8),
          boxShadow: [BoxShadow(
            blurRadius: 4,
            offset: const Offset(0, 0.5),
            color: context.theme.shadowColor.withOpacity(.07),
          )]
      ),
      child: GestureDetector(
        onTap: onTap,
        child: Row(
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  RegularText.semibold(title),
                  Spacing.sp8.height,
                  RegularText(port),
                ],
              ),
            ),
            RegularText.semibold('Tes Cetak', style: TextStyle(color: MainColors.primary),)
          ],
        ),
      ),
    );
  }
}
