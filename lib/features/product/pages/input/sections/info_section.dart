

part of '../page.dart';

class _InfoSection extends StatelessWidget {
  const _InfoSection({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SubtitleText('Produk Info'),
        Spacing.sp24.height,
        RegularTextInput(hinText: 'Masukkan Judul Produk', label: 'Judul Produk', required: true,),
        Spacing.sp24.height,
        RegularTextInput(hinText: 'Masukkan Deskripsi Produk', label: 'Deskripsi', required: true,),
        Spacing.sp24.height,
        const LabelInput(label: 'Media', required: true),
        Spacing.sp8.height,
        RegularText(
          'Maks. ukuran 3 MB',
          style: TextStyle(fontSize: Spacing.sp12, color: MainColors.black[200]),
        ),
        Spacing.sp8.height,
        Container(
          padding: EdgeInsets.all(Spacing.sp22),
          decoration: BoxDecoration(
            border: Border.all(color: MainColors.white[400]!, width: 2),
            borderRadius: BorderRadius.circular(8),
          ),
          child: Icon(AppIcons.addPhotoAlternate, color: MainColors.primary, size: Spacing.sp30),
        )
      ],
    );
  }
}
