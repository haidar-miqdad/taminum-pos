

import 'package:flutter/material.dart';
import 'package:flutter_taminum_mobile/core/core.dart';

class SubtitleText extends StatelessWidget {
  const SubtitleText(this.text, {
    super.key,
    this.textAlign = TextAlign.center,
    this.style,
  });

  final String text;
  final TextStyle? style;
  final TextAlign? textAlign;

  // factory SubtitleText.semibold(
  //     String text,{
  //     TextAlign? textAlign,
  //     TextStyle? style,
  // }){
  //   return SubtitleText(
  //     text,
  //     textAlign: textAlign,
  //     style: TextStyle(fontWeight: FontWeight.w600).merge(style),
  //   );
  // }

  @override
  Widget build(BuildContext context) {
    final baseStyle = context.theme.textTheme.titleLarge;
    return Text(text, style: baseStyle?.merge(style), textAlign: textAlign,);
  }
}