
import 'package:flutter/material.dart';
import 'package:flutter_taminum_mobile/core/core.dart';

class LabelInput extends StatelessWidget {
  const LabelInput({
    super.key,
    required this.label,
    this.required = false,
  });

  final String? label;
  final bool required;

  @override
  Widget build(BuildContext context) {
    return RichText(
      text: TextSpan(
        text: label,
        style: context.theme.textTheme.labelMedium?.copyWith(
          color: MainColors.black,
        ),
        children: [
          if (required)
            TextSpan(
              text: ' Harus diisi*',
              style: TextStyle(
                fontSize: Spacing.sp10,
                color: MainColors.red,
              ),
            ),

        ],

      ),
    );
  }
}
