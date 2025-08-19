part of '../page.dart';

class _ImageSection extends StatelessWidget {
  const _ImageSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        RegularText.medium('Upload Logo'),
        Spacing.sp8.height,
        RegularText(
          'Max. size 3 MB',
          style: TextStyle(color: MainColors.black[200]),
        ),
        Spacing.sp8.height,
        BlocBuilder<ProfileBloc, ProfileState>(
          builder: (context, state) {
            return GestureDetector(
              onTap: () {
                context.read<ProfileBloc>().add(GetImageProfileEvent());
              },
              child: state.image != null && state.image!.isNotEmpty
                  ? ClipRRect(
                      borderRadius: BorderRadius.circular(Spacing.sp8),
                      child: Image.memory(
                        ImageHelper.convertBase64ToUint8List(state.image!),
                        width: 64,
                        height: 64,
                        fit: BoxFit.cover,
                      ),
                    )
                  : Container(
                      padding: EdgeInsets.all(Spacing.sp22),
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: MainColors.white[400]!,
                          width: 2,
                        ),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Icon(
                        AppIcons.addPhotoAlternate,
                        color: MainColors.primary,
                        size: Spacing.sp30,
                      ),
                    ),
            );
          },
        ),
        Spacing.defaultSize.height,
      ],
    );
  }
}
