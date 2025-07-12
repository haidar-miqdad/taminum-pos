import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_taminum_mobile/core/core.dart';

import '../../../features.dart';

part 'sections/bill_section.dart';

class PaymentPage extends StatelessWidget {
  const PaymentPage({super.key, required this.referenceId});

  static const routeName = 'pos/payment';

  final String referenceId;

  @override
  Widget build(BuildContext context) {
    return BlocListener<TransactionBloc, TransactionState>(
      listener: (context, state) {
        if (state.status == Status.processed) {
          Navigator.pushNamedAndRemoveUntil(context, QrPage.routeName, (route) => false);
        }
      },
      child: Scaffold(
        appBar: AppBar(title: Text('Metode Pembayaran')),
        body: ListView(
          children: [
            _BillSection(),
            AppDivider(thickness: Spacing.sp8, space: Spacing.defaultSize),
            Padding(
              padding: const EdgeInsets.all(Spacing.defaultSize),
              child: Row(
                children: [
                  _buildTile(context, 'Cash', AppIcons.money, () {
                    Navigator.pushNamed(context, CashPage.routeName, arguments: referenceId);
                  }),
                  BlocBuilder<CartBloc, CartState>(
                    builder: (context, state) {
                      return _buildTile(context, 'QRIS', AppIcons.qrCode, () {
                        context.read<TransactionBloc>().add(CreateQrTransactionEvent(state.transaction(TypeEnum.unpaid, paymentType: PaymentTypeEnum.qris), referenceId: referenceId));
                      });
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Expanded _buildTile(BuildContext context, String title, IconData icon, Function() onTap) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: Spacing.defaultSize),
        child: InkWell(
          onTap: onTap,
          borderRadius: BorderRadius.circular(Spacing.defaultSize),
          child: Container(
            padding: EdgeInsets.all(Spacing.defaultSize),
            decoration: BoxDecoration(
              color: context.theme.scaffoldBackgroundColor,
              borderRadius: BorderRadius.circular(Spacing.defaultSize),
              border: Border.all(color: context.theme.primaryColor),
            ),
            child: Column(
              children: [
                Icon(icon, size: Spacing.sp40),
                Spacing.sp10.height,
                RegularText.semibold(title, style: TextStyle(fontSize: Spacing.sp12)),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
