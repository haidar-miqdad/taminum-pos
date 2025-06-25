
import 'package:flutter/material.dart';
import 'package:flutter_taminum_mobile/core/core.dart';

import '../../../features.dart';

part 'sections/item_section.dart';
part 'sections/floating_section.dart';

class POSPage extends StatefulWidget {
  const POSPage({super.key});

  @override
  State<POSPage> createState() => _POSPageState();
}

class _POSPageState extends State<POSPage> {

  TextEditingController searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('POS'),),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(Spacing.defaultSize),
            child: SearchInput(hintText: 'Search by product name or SKU', controller: searchController,),
          ),
          Expanded(
            child: ListView.separated(
            itemBuilder: (BuildContext context, int index) {
              return _ItemSection();
            },
              separatorBuilder: (BuildContext context, int index) => Spacing.sp10.height,
              itemCount: 3,
            ),
          )
        ],
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: _FloatingSection(onTap: (){
        Navigator.pushNamed(context, POSOrderPage.routeName);
      },)
    );
  }
}

