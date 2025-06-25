

import 'package:flutter/material.dart';

import '../../../../core/core.dart';
import '../../../features.dart';

part 'sections/order_section.dart';
part 'sections/detail_section.dart';
part 'sections/action_section.dart';

class POSOrderPage extends StatelessWidget {
  const POSOrderPage({super.key});

  static const routeName = '/pos/order';

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(title: Text('Daftar Pesanan'),),
      body: Padding(
        padding: const EdgeInsets.all(Spacing.defaultSize),
        child: ListView(
          children: [
            _OrderSection(),
            AppDivider(thickness: 8, space: Spacing.sp24,),
            _DetailSection(),
            Spacing.sp24.height,
            _ActionSection()
          ],
        ),
      ),
    );
  }
}

