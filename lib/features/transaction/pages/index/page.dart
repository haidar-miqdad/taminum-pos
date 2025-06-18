import 'package:flutter/material.dart';
import 'package:flutter_taminum_mobile/core/core.dart';

part 'sections/filter_section.dart';
part 'sections/body_section.dart';

class TransactionPage extends StatelessWidget {
  const TransactionPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Transaksi')),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: Spacing.defaultSize, right: Spacing.defaultSize, left: Spacing.defaultSize),
            child: _FilterSection(),
          ),
          Spacing.sp26.height,
          Expanded(
            child: _BodySection(),
          ),
        ],
      ),
    );
  }
}

