

import 'package:flutter/material.dart';

import '../../core.dart';

class Divider24 extends StatelessWidget {
  const Divider24({
    super.key,
    this.thickness = 1,
  });

  final double? thickness;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: Spacing.sp24),
      child: Divider(color: MainColors.white[400], thickness: thickness),
    );
  }
}