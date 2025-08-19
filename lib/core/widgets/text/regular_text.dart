import 'package:flutter/material.dart';
import 'package:flutter_taminum_mobile/core/core.dart';

class RegularText extends StatelessWidget {
  const RegularText(this.text, {super.key, this.textAlign, this.style});

  final String text;
  final TextStyle? style;
  final TextAlign? textAlign;

  factory RegularText.medium(
    String text, {
    TextAlign? textAlign,
    TextStyle? style,
  }) {
    return RegularText(
      text,
      textAlign: textAlign,
      style: TextStyle(fontWeight: FontWeight.w500).merge(style),
    );
  }

  factory RegularText.semibold(
    String text, {
    TextAlign? textAlign,
    TextStyle? style,
  }) {
    return RegularText(
      text,
      textAlign: textAlign,
      style: TextStyle(fontWeight: FontWeight.w600).merge(style),
    );
  }

  @override
  Widget build(BuildContext context) {
    final baseStyle = context.theme.textTheme.bodyMedium;
    return Text(text, style: baseStyle?.merge(style), textAlign: textAlign);
  }
}
