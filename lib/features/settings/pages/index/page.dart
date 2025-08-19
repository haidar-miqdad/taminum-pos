import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_taminum_mobile/app/config.dart';
import 'package:flutter_taminum_mobile/core/core.dart';

import '../../../features.dart';

part 'sections/profile_section.dart';

part 'sections/account_section.dart';

part 'sections/device_section.dart';

part 'sections/other_section.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Lainnya')),
      body: ListView(
        children: [
          _ProfileSection(),
          Divider(color: MainColors.white, thickness: Spacing.sp8),
          _AccountSection(),
          Divider(color: MainColors.white, thickness: Spacing.sp8),
          _DeviceSection(),
          Divider(color: MainColors.white, thickness: Spacing.sp8),
          _OtherSection(),
          Padding(
            padding: const EdgeInsets.all(Spacing.defaultSize),
            child: OutlinedButton(
              onPressed: () {},
              style: OutlinedButton.styleFrom(side: const BorderSide(width: 1, color: MainColors.red)),
              child: RegularText.semibold('Keluar', style: TextStyle(color: MainColors.red)),
            ),
          ),
        ],
      ),
    );
  }
}
