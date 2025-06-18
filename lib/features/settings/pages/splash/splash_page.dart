
import 'package:flutter/material.dart';
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
    Future.delayed(const Duration(seconds: 3), (){
      Navigator.pushNamedAndRemoveUntil(context, MainPage.routeName, (route) => false);
    });
    super.initState();
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
