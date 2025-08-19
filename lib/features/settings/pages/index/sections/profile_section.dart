part of '../page.dart';

class _ProfileSection extends StatelessWidget {
  const _ProfileSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        right: Spacing.defaultSize,
        left: Spacing.defaultSize,
        top: Spacing.defaultSize,
      ),
      child: BlocBuilder<ProfileBloc, ProfileState>(
        builder: (context, state) {
          return Row(
            children: [
              state.user?.imageUrl != null && state.user!.imageUrl.isNotEmpty
                  ? ClipRRect(
                      borderRadius: BorderRadius.circular(Spacing.sp8),
                      child: Image.memory(
                        ImageHelper.convertBase64ToUint8List(
                          state.user!.imageUrl,
                        ),
                        width: 68,
                        height: 68,
                        fit: BoxFit.cover,
                      ),
                    )
                  : ClipRRect(
                      borderRadius: BorderRadius.circular(100),
                      child: Image.asset(
                        MainAssets.jokowi,
                        height: 68,
                        width: 68,
                        fit: BoxFit.cover,
                      ),
                    ),
              Spacing.defaultSize.width,
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    RegularText.semibold(
                      state.user?.name == null || state.user!.name.isEmpty
                          ? ConfigApp.appName
                          : state.user!.name,
                      style: TextStyle(fontSize: 16),
                    ),
                    Spacing.sp4.height,
                    RegularText(
                      state.user?.email == null || state.user!.email.isEmpty
                          ? ConfigApp.email
                          : state.user!.email,
                      style: TextStyle(color: MainColors.black[600]),
                    ),
                    Spacing.sp4.height,
                    RegularText(
                      state.user?.phoneNumber == null ||
                              state.user!.phoneNumber.isEmpty
                          ? ConfigApp.phone
                          : state.user!.phoneNumber,
                      style: TextStyle(color: MainColors.black[600]),
                    ),
                  ],
                ),
              ),
              IconButton(
                onPressed: () {
                  Navigator.pushNamed(context, ProfilePage.routeName);
                },
                icon: Icon(
                  AppIcons.edit,
                  color: MainColors.primary,
                  size: Spacing.sp26,
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
