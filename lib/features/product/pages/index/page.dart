import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_taminum_mobile/core/core.dart';
import 'package:flutter_taminum_mobile/core/widgets/input/search_input.dart';

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
            child: SearchInput(hintText: 'Search by product name or SKU',),
          ),
          Padding(padding: const EdgeInsets.all(Spacing.defaultSize), child: SubtitleText('3 Produk')),
          Spacing.defaultSize.height,
          Expanded(
            child: ListView.separated(
              shrinkWrap: true,
              itemBuilder: (BuildContext context, int index) {
                return _buildItem();
              },
              separatorBuilder: (BuildContext context, int index) {
                return Spacing.sp42.height;
              },
              itemCount: 7,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildItem() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: Spacing.defaultSize),
      child: Column(
        children: [
          Row(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(Spacing.sp8),
                child: Image.network('https://lazenskakava.s24.cdn-upgates.com/_cache/a/c/acde81f00cf5db7e02970946253795b4-caffe-latte-macchiato.jpg', width: 76, height: 76, fit: BoxFit.cover),
              ),
              Spacing.sp12.width,
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  RegularText.semibold('Caffe Latte', style: TextStyle(fontSize: 16)),
                  Spacing.sp4.height,
                  RegularText.semibold('Rp 125.000', style: TextStyle(fontSize: 16)),
                ],
              ),
            ],
          ),
          Spacing.defaultSize.height,
          Row(
            children: [
              Expanded(
                child: ElevatedButton(onPressed: () {}, child: Text('Edit')),
              ),
              Spacing.defaultSize.width,
              Expanded(
                child: OutlinedButton(onPressed: () {}, child: Text('Hapus')),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

