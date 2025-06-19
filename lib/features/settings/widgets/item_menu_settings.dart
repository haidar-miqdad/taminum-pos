

import 'package:flutter/material.dart';

import '../../../core/core.dart';

class ItemMenuSettings extends StatelessWidget {
  const ItemMenuSettings(this.title,{
    super.key, required this.icon, this.onTap, this.subTitle,
  });

  final String title;
  final IconData icon;
  final Function()? onTap;
  final String? subTitle;


  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: Spacing.defaultSize),
      child: GestureDetector(
        onTap: onTap,
        child: Row(
          children: [
            Icon(icon, size: Spacing.sp26,),
            Spacing.sp12.width,
            Expanded(child: RegularText(title, style: TextStyle())),
            Row(
              children: [
                RegularText.semibold(subTitle ?? '', style: TextStyle(fontSize: 12),),
                Spacing.sp8.width,
                Icon(Icons.arrow_forward_ios, size: Spacing.sp20, color: context.theme.primaryColor,),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

