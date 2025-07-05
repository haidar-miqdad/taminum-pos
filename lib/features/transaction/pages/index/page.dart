import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_taminum_mobile/core/core.dart';

import '../../../features.dart';

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
            child: BlocBuilder<TransactionBloc, TransactionState>(
              builder: (context, state) {
                return ListView.builder(
                  padding: EdgeInsets.symmetric(horizontal: Spacing.defaultSize),
                  itemBuilder: (BuildContext context, int index) {
                    return _ItemSection(categoryTransaction: 'Tunai • TRX-100-10102030405', value: 'Rp 10.000', date: '12-12-2022',);
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



