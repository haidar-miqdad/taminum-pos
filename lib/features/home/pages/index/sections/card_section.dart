part of '../page.dart';

class _CardSection extends StatelessWidget {
  final String label;
  final String value;

  const _CardSection({super.key, required this.label, required this.value});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(Spacing.sp24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            RegularText(label, style: TextStyle(color: MainColors.black[600])),
            Spacing.sp4.height,
            HeadlineText.semibold(
              value,
              style: TextStyle(fontSize: Spacing.sp24),
            ),
            Spacing.sp6.height,
            RegularText.semibold(
              'Lihat Detail',
              style: TextStyle(
                fontSize: Spacing.sp12,
                color: context.theme.primaryColor,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
