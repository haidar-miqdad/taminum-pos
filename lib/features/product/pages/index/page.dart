import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_taminum_mobile/core/core.dart';

import '../../../features.dart';
import '../../blocs/blocs.dart';

part 'sections/item_section.dart';

part 'sections/floating_section.dart';

class ProductPage extends StatefulWidget {
  const ProductPage({super.key});

  @override
  State<ProductPage> createState() => _ProductPageState();
}

class _ProductPageState extends State<ProductPage> {
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
      appBar: AppBar(title: Text('Produk')),
      body: BlocConsumer<ProductBloc, ProductState>(
        listener: (context, state) {
          if (state.status == Status.deleted) {
            getData();
          }
        },
        builder: (context, state) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.all(Spacing.defaultSize),
                child: SearchInput(
                  hintText: 'Search by product name or SKU',
                  controller: searchController,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(Spacing.defaultSize),
                child: SubtitleText('${state.products.length} Produk'),
              ),
              Spacing.defaultSize.height,
              Expanded(
                child: state.status == Status.success && state.products.isEmpty
                    ? EmptyTemplate()
                    : ListView.separated(
                        shrinkWrap: true,
                        itemBuilder: (BuildContext context, int index) {
                          final item = state.products[index];
                          return _ItemSection(
                            product: item,
                            onDelete: () {
                              context.read<ProductBloc>().add(
                                DeleteProductEvent(item.id),
                              );
                            },
                            onEdit: () async {
                              await Navigator.pushNamed(
                                context,
                                ProductInputPage.routeName,
                                arguments: item,
                              );

                              getData();
                            },
                          );
                        },
                        separatorBuilder: (BuildContext context, int index) {
                          return Spacing.sp42.height;
                        },
                        itemCount: state.products.length,
                      ),
              ),
            ],
          );
        },
      ),

      floatingActionButton: _FloatingSection(
        onTap: () async {
          await Navigator.pushNamed(context, ProductInputPage.routeName);
          getData();
        },
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
