part of '../page.dart';

class _DeviceSection extends StatelessWidget {
  const _DeviceSection({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(Spacing.defaultSize),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SubtitleText('Perangkat Tambahan'),
          Spacing.defaultSize.height,
          ItemMenuSettings('Printer', icon: Icons.local_printshop_outlined,),
          Divider(color: MainColors.white[400], thickness: 1,),
          ItemMenuSettings('Atur Struk', icon: AppIcons.coupon, onTap: (){
            Navigator.pushNamed(context, ReceiptPage.routeName);
          },),
        ],
      ),
    );
  }
}