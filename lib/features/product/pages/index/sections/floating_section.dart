
part of '../page.dart';

class _FloatingSection extends StatelessWidget {
  const _FloatingSection({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(onPressed: (){
      Navigator.pushNamed(context, ProductInputPage.routeName);
    },child: Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Icon(Icons.add_rounded),
        RegularText.semibold('Produk Baru', style: TextStyle(color: context.theme.scaffoldBackgroundColor)),
      ],
    ));
  }
}