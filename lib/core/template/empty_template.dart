

import 'package:flutter/material.dart';

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
            Image.asset(
              MainAssets.empty,
              width: Spacing.width(context) / 2,
            ),
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
