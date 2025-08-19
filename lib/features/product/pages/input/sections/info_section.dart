part of '../page.dart';

class _InfoSection extends StatefulWidget {
  const _InfoSection(this.product);

  final ProductModel? product;

  @override
  State<_InfoSection> createState() => _InfoSectionState();
}

class _InfoSectionState extends State<_InfoSection> {
  TextEditingController nameController = TextEditingController();
  TextEditingController descController = TextEditingController();

  @override
  void initState() {
    nameController.text = widget.product?.title ?? '';
    descController.text = widget.product?.description ?? '';

    nameController.addListener(() {
      context.read<FormProductBloc>().add(
        ChangeFormProductEvent(name: nameController.text),
      );
    });
    descController.addListener(() {
      context.read<FormProductBloc>().add(
        ChangeFormProductEvent(desc: descController.text),
      );
    });

    super.initState();
  }

  @override
  void dispose() {
    nameController.dispose();
    descController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SubtitleText('Produk Info'),
        Spacing.sp24.height,
        RegularTextInput(
          hinText: 'Masukkan Judul Produk',
          label: 'Judul Produk',
          required: true,
          controller: nameController,
        ),
        Spacing.sp24.height,
        RegularTextInput(
          hinText: 'Masukkan Deskripsi Produk',
          label: 'Deskripsi',
          required: true,
          controller: descController,
          minLines: 1,
          maxLines: 4,
        ),
        Spacing.sp24.height,
        const LabelInput(label: 'Media', required: true),
        Spacing.sp8.height,
        RegularText(
          'Maks. ukuran 3 MB',
          style: TextStyle(
            fontSize: Spacing.sp12,
            color: MainColors.black[200],
          ),
        ),
        Spacing.sp8.height,
        InkWell(
          onTap: () {
            context.read<FormProductBloc>().add(ChangeImageFormProductEvent());
          },
          borderRadius: BorderRadius.circular(Spacing.sp8),
          child: BlocBuilder<FormProductBloc, FormProductState>(
            builder: (context, state) {
              if (state.image != null && state.image!.isNotEmpty) {
                return ClipRRect(
                  borderRadius: BorderRadius.circular(Spacing.sp8),
                  child: Image.memory(
                    ImageHelper.convertBase64ToUint8List(state.image!),
                    width: 75,
                    height: 75,
                    fit: BoxFit.cover,
                  ),
                );
              }
              return Container(
                padding: EdgeInsets.all(Spacing.sp22),
                decoration: BoxDecoration(
                  border: Border.all(color: MainColors.white[400]!, width: 2),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Icon(
                  AppIcons.addPhotoAlternate,
                  color: MainColors.primary,
                  size: Spacing.sp30,
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
