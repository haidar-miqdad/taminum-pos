import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_taminum_mobile/core/core.dart';
import 'package:flutter_taminum_mobile/features/settings/blocs/blocs.dart';

part 'sections/image_section.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  static const routeName = 'settings/profile';

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController phoneNumberController = TextEditingController();

  @override
  void dispose() {
    nameController.dispose();
    emailController.dispose();
    phoneNumberController.dispose();
    super.dispose();
  }

  @override
  void initState() {
    context.read<ProfileBloc>().add(GetProfileEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<ProfileBloc, ProfileState>(
      listener: (context, state) {
        if (state.status == Status.success) {
          Navigator.pop(context);
        }

        if (state.status == Status.apply) {
          nameController.text = state.user?.name ?? '';
          emailController.text = state.user?.email ?? '';
          phoneNumberController.text = state.user?.phoneNumber ?? '';
        }

        if (state.status == Status.failure) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text(state.error ?? 'Something went wrong')),
          );
        }
      },
      child: Scaffold(
        appBar: AppBar(title: Text('Informasi Usaha')),
        body: ListView(
          padding: EdgeInsets.all(Spacing.defaultSize),
          children: [
            _ImageSection(),
            Divider(color: MainColors.white[400], thickness: 1),
            RegularTextInput(
              label: 'Nama Bisnis',
              hinText: 'Business Name',
              controller: nameController,
              required: true,
            ),
            Spacing.sp24.height,
            RegularTextInput(
              label: 'Email',
              hinText: 'example@gmail.com',
              controller: emailController,
              required: true,
              keyboardType: TextInputType.emailAddress,
            ),
            Spacing.sp24.height,
            RegularTextInput(
              label: 'Phone Number',
              hinText: '08**********',
              controller: phoneNumberController,
              required: true,
              inputFormatters: [FilteringTextInputFormatter.digitsOnly],
              keyboardType: TextInputType.phone,
            ),
            Spacing.sp24.height,
          ],
        ),
        bottomNavigationBar: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(Spacing.defaultSize),
            child: ElevatedButton(
              onPressed: () {
                context.read<ProfileBloc>().add(
                  SubmitProfileEvent(
                    name: nameController.text,
                    email: emailController.text,
                    phoneNumber: phoneNumberController.text,
                  ),
                );
              },
              child: RegularText.semibold(
                'Simpan',
                style: TextStyle(color: MainColors.white),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
