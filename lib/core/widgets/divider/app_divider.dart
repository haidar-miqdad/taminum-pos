import 'package:flutter/material.dart';

import '../../core.dart';

class AppDivider extends StatelessWidget {
  const AppDivider({super.key, this.thickness = 1, this.space});

  final double? thickness;
  final double? space;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: space ?? Spacing.sp2),
      child: Divider(
        color: thickness == 1 ? MainColors.white[400] : MainColors.white,
        thickness: thickness,
      ),
    );
  }
}
