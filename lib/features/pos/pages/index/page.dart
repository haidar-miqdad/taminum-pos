import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_taminum_mobile/core/core.dart';

import '../../../features.dart';

part 'sections/item_section.dart';

part 'sections/cart_section.dart';

class POSPage extends StatefulWidget {
  const POSPage({super.key});

  @override
  State<POSPage> createState() => _POSPageState();
}

class _POSPageState extends State<POSPage> {
  TextEditingController searchController = TextEditingController();

  @override
  void initState() {
    searchController.addListener(() {
      // dijalankan ketika search controller diubah
      getData();
    });

    // dijlankan ketika page diload/dijalankan
    getData();
    super.initState();

    context.read<CartBloc>().add(InitialCartEvent());
  }

  void getData() {
    context.read<ProductBloc>().add(GetProductEvent(searchController.text));
  }

  @override
  void dispose() {
    searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('POS')),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(Spacing.defaultSize),
            child: SearchInput(
              hintText: 'Search by product name or SKU',
              controller: searchController,
            ),
          ),
          Expanded(
            child: BlocBuilder<ProductBloc, ProductState>(
              builder: (context, state) {
                if (state.products.isEmpty && state.status == Status.success) {
                  return EmptyTemplate();
                }
                return ListView.separated(
                  itemBuilder: (BuildContext context, int index) {
                    final item = state.products[index];
                    return _ItemSection(product: item);
                  },
                  separatorBuilder: (BuildContext context, int index) =>
                      Spacing.sp10.height,
                  itemCount: state.products.length,
                );
              },
            ),
          ),
        ],
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: BlocBuilder<CartBloc, CartState>(
        builder: (context, state) {
          if (state.cart.isEmpty) {
            return SizedBox();
          }
          return _CartSection(qtyItems: state.getQty, price: state.getEstimate);
        },
      ),
    );
  }
}
