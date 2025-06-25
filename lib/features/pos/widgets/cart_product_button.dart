

import 'package:flutter/material.dart';

import '../../../core/core.dart';

class CartProductButton extends StatelessWidget {
  const CartProductButton({super.key, this.count = 0});

  final int count;


  @override
  Widget build(BuildContext context) {
    return  Row(
      children: [
        if(count > 0) ...[
          _buildButton(context,  onTap: () {}),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: Spacing.defaultSize),
            child: RegularText.semibold('2'),
          ),
          _buildButton(context, onTap: () {}, isIncrement: true,),
        ]else ...[
          _buildButton(
              context,
              onTap: (){},
              text: RegularText.semibold(
                  'Tambah',
                  style: TextStyle(
                      color: context.theme.primaryColor)
              )
          ),
        ]

      ],
    );
  }
  InkWell _buildButton(BuildContext context, {required VoidCallback onTap, bool isIncrement = false, Widget? text}) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(Spacing.sp8),
      child: Container(
        padding: EdgeInsets.symmetric(
            vertical: count > 0 ? Spacing.sp4 : Spacing.sp6,
            horizontal: count > 0 ? Spacing.sp4 : Spacing.sp14
        ),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(Spacing.sp8),

          border: Border.all(color: context.theme.primaryColor),
        ),
        child: text ?? Icon(isIncrement ? Icons.add : Icons.remove, color: context.theme.primaryColor,),
      ),
    );
  }
}


