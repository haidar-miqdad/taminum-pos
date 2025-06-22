import 'package:flutter/material.dart';
import 'package:flutter_taminum_mobile/core/core.dart';

part 'sections/item_section.dart';
part 'sections/floating_section.dart';

class ProductPage extends StatelessWidget {
  const ProductPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Produk')),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(Spacing.defaultSize),
            child: SearchInput(hintText: 'Search by product name or SKU'),
          ),
          Padding(
            padding: const EdgeInsets.all(Spacing.defaultSize),
            child: SubtitleText('3 Produk'),
          ),
          Spacing.defaultSize.height,
          Expanded(
            child: ListView.separated(
              shrinkWrap: true,
              itemBuilder: (BuildContext context, int index) {
                return _ItemSection();
              },
              separatorBuilder: (BuildContext context, int index) {
                return Spacing.sp42.height;
              },
              itemCount: 7,
            ),
          ),
        ],
      ),

      floatingActionButton: _FloatingSection(),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}




