import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_taminum_mobile/core/core.dart';

import '../../../features.dart';

part 'sections/filter_section.dart';
part 'sections/item_section.dart';

class TransactionPage extends StatelessWidget {
  const TransactionPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Transaksi')),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(
              top: Spacing.defaultSize,
              right: Spacing.defaultSize,
              left: Spacing.defaultSize,
            ),
            child: _FilterSection(),
          ),
          Spacing.sp40.height,
          Expanded(
            child: BlocBuilder<TransactionBloc, TransactionState>(
              builder: (context, state) {
                if (state.transactions.isEmpty) {
                  return EmptyTemplate();
                }
                return ListView.builder(
                  padding: EdgeInsets.symmetric(
                    horizontal: Spacing.defaultSize,
                  ),
                  itemBuilder: (BuildContext context, int index) {
                    final items = state.transactions[index];
                    return _ItemSection(items);
                  },
                  itemCount: state.transactions.length,
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
