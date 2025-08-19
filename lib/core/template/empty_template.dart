import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

import '../core.dart';

class EmptyTemplate extends StatelessWidget {
  const EmptyTemplate({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(Spacing.defaultSize),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Lottie.asset(MainAssets.noData, width: Spacing.width(context) / 3),
            Spacing.sp32.height,
            const SubtitleText(
              'There are no products here',
              textAlign: TextAlign.center,
            ),
            Spacing.defaultSize.height,
            const RegularText(
              'You do not have a product in the shop. '
              'Please add products first to start selling.',
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}
