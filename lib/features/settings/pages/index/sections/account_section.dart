part of '../page.dart';

class _AccountSection extends StatelessWidget {
  const _AccountSection({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(Spacing.defaultSize),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SubtitleText('Akun'),
          ItemMenuSettings('Informasi Usaha', icon: AppIcons.receipt, onTap: (){},),
          Divider(color: MainColors.white[400], thickness: 1,),
          ItemMenuSettings('API Key Xendit', icon: AppIcons.creditCard, onTap: (){},),
        ],
      ),
    );
  }
}

