import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/core.dart';
import '../../../features.dart';

part 'sections/order_section.dart';
part 'sections/detail_section.dart';
part 'sections/action_section.dart';

class POSOrderPage extends StatelessWidget {
  const POSOrderPage({super.key});

  static const routeName = '/pos/order';

  @override
  Widget build(BuildContext context) {
    return BlocListener<CartBloc, CartState>(
      listener: (context, state) {
        if(state.cart.isEmpty){
          Navigator.pop(context);
        }
      },
      child: Scaffold(
        appBar: AppBar(title: Text('Daftar Pesanan'),),
        body: Padding(
          padding: const EdgeInsets.all(Spacing.defaultSize),
          child: ListView(
            children: [
              _OrderSection(),
              AppDivider(thickness: 8, space: Spacing.sp24,),
              _DetailSection(),
              Spacing.sp24.height,
              _ActionSection()
            ],
          ),
        ),
      ),
    );
  }
}

