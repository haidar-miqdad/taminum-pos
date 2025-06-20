
part of '../page.dart';

class _FooterSection extends StatelessWidget {
  const _FooterSection({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: Spacing.defaultSize),
      child: RichText(

          textAlign: TextAlign.center,
          text: TextSpan(
              text: 'Terimakasih sudah berkunjung.',
              style: TextStyle(color: MainColors.black[600], fontSize: Spacing.defaultSize, height: 1.7,),

              children: [
                TextSpan(text: '\nPowered by Haidar Miqdad'),
              ]
          )),
    );
  }
}