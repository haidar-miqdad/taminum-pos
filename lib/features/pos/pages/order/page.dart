import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/core.dart';
import '../../../features.dart';

part 'sections/order_section.dart';

part 'sections/detail_section.dart';

part 'sections/action_section.dart';

part 'sections/discount_section.dart';

class POSOrderPage extends StatelessWidget {
  const POSOrderPage({super.key});

  static const routeName = '/pos/order';

  @override
  Widget build(BuildContext context) {
    return MultiBlocListener(
      listeners: [
        BlocListener<CartBloc, CartState>(
          listener: (context, state) {
            if (state.cart.isEmpty) {
              Navigator.pop(context);
            }
          },
        ),
        BlocListener<TransactionBloc, TransactionState>(
          listener: (context, state) {
            if (state.status == Status.apply) {
              // context.read<TransactionBloc>().add(GetTransactionEvent());
              // context.read<BottomNavBloc>().add(TapBottomNavEvent(1));
              Navigator.pop(context);
              // Navigator.pushNamedAndRemoveUntil(context, MainPage.routeName, (route) => false);
            }
          },
        ),
      ],
      child: Scaffold(
        appBar: AppBar(title: Text('Daftar Pesanan')),
        body: Padding(
          padding: const EdgeInsets.all(Spacing.defaultSize),
          child: ListView(
            children: [
              _OrderSection(),
              AppDivider(thickness: 8, space: Spacing.sp24),
              _DetailSection(),
              Spacing.defaultSize.height,
            ],
          ),
        ),
        bottomNavigationBar: _ActionSection(),
      ),
    );
  }
}
