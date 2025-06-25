


import 'package:flutter/material.dart';

import '../../core.dart';

class AppDivider extends StatelessWidget {
  const AppDivider({
    super.key,
    this.thickness = 1,
    this.space = Spacing.defaultSize,
  });

  final double? thickness;
  final double space;


  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: space),
      child: Divider(color: thickness == 1 ?  MainColors.white[400] : MainColors.white, thickness: thickness),
    );
  }
}