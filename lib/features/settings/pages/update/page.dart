import 'package:flutter/material.dart';
import 'package:flutter_taminum_mobile/app/config.dart';
import 'package:flutter_taminum_mobile/core/core.dart';
import 'package:lottie/lottie.dart';

import '../../../home/pages/main/main.dart';

class UpdatePage extends StatelessWidget {
  final VersionType version;

  const UpdatePage({super.key, required this.version});

  static const routeName = '/update';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(Spacing.defaultSize),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Lottie.asset(MainAssets.update, width: Spacing.width(context)),
              Spacing.sp38.height,
              const SubtitleText(
                '✨ Saatnya Upgrade!',
                textAlign: TextAlign.center,
              ),
              Spacing.sp8.height,
              const RegularText(
                'Versi terbaru hadir dengan perbaikan penting & fitur menarik. '
                'Update sekarang untuk pengalaman yang lebih baik!',
                textAlign: TextAlign.center,
              ),

              Spacing.sp32.height,
              Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  ElevatedButton(
                    onPressed: () {
                      LaunchHelper.launch(ConfigApp.playStoreUrl);
                    },
                    child: const Text('Update Now'),
                  ),
                  if (version == VersionType.update) ...[
                    Spacing.sp12.height,
                    OutlinedButton(
                      onPressed: () {
                        Navigator.pushNamedAndRemoveUntil(
                          context,
                          MainPage.routeName,
                          (route) => false,
                        );
                      },
                      child: const Text('Update Later'),
                    ),
                  ],
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
