
import 'package:flutter/material.dart';
import 'package:flutter_taminum_mobile/core/core.dart';

class SearchInput extends StatelessWidget {
  const SearchInput({super.key, required this.hintText});

  final String hintText;

  @override
  Widget build(BuildContext context) {
    return RegularTextInput(hinText: hintText, prefixIcon: AppIcons.search,);
  }
}
