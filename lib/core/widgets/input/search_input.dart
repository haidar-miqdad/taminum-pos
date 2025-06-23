
import 'package:flutter/material.dart';
import 'package:flutter_taminum_mobile/core/core.dart';

class SearchInput extends StatelessWidget {
  const SearchInput({super.key, required this.hintText, required this.controller});

  final String hintText;
  final TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    return RegularTextInput(hinText: hintText, prefixIcon: AppIcons.search, controller: controller,);
  }
}
