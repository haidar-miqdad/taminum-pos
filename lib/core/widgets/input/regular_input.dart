import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_taminum_mobile/core/core.dart';

class RegularTextInput extends StatelessWidget {
  const RegularTextInput({
    super.key,
    required this.hinText,
    this.controller,
    this.enabled = true,
    this.inputFormatters,
    this.required = false,
    this.maxLength,
    this.maxLines,
    this.minLines,
    this.prefixIcon,
    this.label,
    this.onChanged,
    this.suffixIcon,
    this.keyboardType,
  });

  final String hinText;
  final TextEditingController? controller;
  final bool? enabled;
  final List<TextInputFormatter>? inputFormatters;
  final int? maxLength;
  final int? maxLines;
  final int? minLines;
  final IconData? prefixIcon;
  final bool required;
  final String? label;
  final ValueChanged<String>? onChanged;
  final Widget? suffixIcon;
  final TextInputType? keyboardType;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (label != null) ...[
          LabelInput(label: label, required: required),
          Spacing.sp8.height,
        ],
        TextFormField(
          inputFormatters: inputFormatters,
          controller: controller,
          enabled: enabled,
          maxLength: maxLength,
          maxLines: maxLines,
          minLines: minLines,
          onChanged: onChanged,
          keyboardType: keyboardType,
          style: TextStyle(
            color: MainColors.black[600],
            fontSize: Spacing.sp14,
          ),
          decoration: InputDecoration(
            prefixIcon: prefixIcon != null ? Icon(prefixIcon) : null,
            hintText: hinText,
            suffixIcon: suffixIcon,
          ),
        ),
      ],
    );
  }
}
