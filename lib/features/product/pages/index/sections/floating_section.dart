
part of '../page.dart';

class _FloatingSection extends StatelessWidget {
  const _FloatingSection({required this.onTap, super.key});

  final Function() onTap;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(onPressed: (){
      onTap();
    },child: Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Icon(Icons.add_rounded),
        RegularText.semibold('Produk Baru', style: TextStyle(color: context.theme.scaffoldBackgroundColor)),
      ],
    ));
  }
}