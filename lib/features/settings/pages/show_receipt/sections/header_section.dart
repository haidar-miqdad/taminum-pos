part of '../page.dart';

class _HeaderSection extends StatelessWidget {
  const _HeaderSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(Spacing.sp24),
      child: Column(
        children: [
          SubtitleText('Taminum'),
          Spacing.sp14.height,
          RegularText(
            'Instagram : @taminum.id',
            style: TextStyle(color: MainColors.black[500]),
          ),
        ],
      ),
    );
  }
}
