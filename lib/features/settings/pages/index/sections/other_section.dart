part of '../page.dart';

class _OtherSection extends StatelessWidget {
  const _OtherSection({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(Spacing.defaultSize),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SubtitleText('Info Lainnya'),
          Spacing.defaultSize.height,
          ItemMenuSettings('Printer', icon: AppIcons.verified,),
          Divider(color: MainColors.white[400], thickness: 1,),
          ItemMenuSettings('Beri Rating', icon: AppIcons.star, subTitle: 'v 1.0.0',),
        ],
      ),
    );
  }
}



