import 'package:flutter/material.dart';

import 'package:flutter_taminum_mobile/core/data/data.dart';
import 'package:flutter_taminum_mobile/features/features.dart';

import '../../../../core/core.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    checkUpdate();
    super.initState();
  }

  Future<void> checkUpdate() async {
    final version = await ConfigData.checkUpdateConfigData();

    if (version == VersionType.upToDate) {
      mainNavigate();
    } else {
      updateNavigate(version);
    }
  }

  void mainNavigate() {
    Navigator.pushNamedAndRemoveUntil(
      context,
      MainPage.routeName,
      (route) => false,
    );
  }

  void updateNavigate(VersionType version) {
    Navigator.pushNamedAndRemoveUntil(
      context,
      UpdatePage.routeName,
      (route) => false,
      arguments: version,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(MainAssets.logo2, width: Spacing.width(context) / 1.2),
          ],
        ),
      ),
    );
  }
}
