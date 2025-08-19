import 'package:flutter/material.dart';

import '../core.dart';

class ContentSheet extends StatelessWidget {
  const ContentSheet({super.key, required this.child});

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return AnimatedPadding(
      padding: MediaQuery.of(context).viewInsets,
      duration: Duration(milliseconds: 100),
      child: Padding(
        padding: EdgeInsets.all(Spacing.defaultSize),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  width: 80,
                  height: 4,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(Spacing.sp8),
                    color: context.theme.disabledColor,
                  ),
                ),
              ],
            ),
            Spacing.defaultSize.height,
            child,
          ],
        ),
      ),
    );
  }
}
