


import 'package:flutter/material.dart';
import 'package:flutter_taminum_mobile/core/core.dart';


part 'sections/info_section.dart';
part 'sections/price_section.dart';
part 'sections/stock_section.dart';

class ProductInputPage extends StatelessWidget {
  const ProductInputPage({super.key});

  static const routeName = '/product/input';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Tambah Produk'),),
      body: Padding(
        padding: const EdgeInsets.all(Spacing.defaultSize),
        child: ListView(
          children: [
            _InfoSection(),
            Divider24(),
            _PriceSection(),
            Divider24(thickness: Spacing.sp8,),
            _StockSection(),
          ],
        ),
      ),
      bottomNavigationBar: SafeArea(child: Padding(
        padding: const EdgeInsets.all(Spacing.defaultSize),
        child: ElevatedButton(onPressed: (){}, child: Text('Simpan')),
      )),
    );
  }
}

