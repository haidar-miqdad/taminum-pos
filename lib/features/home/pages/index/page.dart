import 'package:flutter/material.dart';
import 'package:flutter_taminum_mobile/core/core.dart';

part 'sections/card_section.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Beranda')),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(Spacing.defaultSize),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              _CardSection(label: 'Total Penjualan', value: 'Rp. 5.000.000'),
              Spacing.defaultSize.height,
              _CardSection(label: 'Total Transaksi', value: '300.000'),
              Spacing.defaultSize.height,
              _CardSection(label: 'Total Produk', value: '654'),
              Spacing.defaultSize.height,
            ],
          ),
        ),
      ),
    );
  }
}
