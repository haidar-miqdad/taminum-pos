import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_taminum_mobile/core/core.dart';
import 'package:qr_flutter/qr_flutter.dart';

import '../../../features.dart';

part 'sections/qr_section.dart';

class QrPage extends StatelessWidget {
  const QrPage({super.key});

  static const routeName = '/pos/qr';

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: Navigator.canPop(context),
      onPopInvokedWithResult: (bool didPop, Object? data) {
        if (didPop) {
          // context.read<BottomNavBloc>().add(TapBottomNavEvent(1));
          Navigator.pushNamedAndRemoveUntil(context, MainPage.routeName, (route) => false);
        }
      },
      child: BlocListener<TransactionBloc, TransactionState>(
        listener: (context, state) {
          if (state.status == Status.success && state.item?.type == TypeEnum.paid) {
            Navigator.pushNamedAndRemoveUntil(context, SuccessTransactionPage.routeName, (route) => false, arguments: state.item?.referenceId);
          }
        },
        child: Scaffold(
          appBar: AppBar(title: Text('Kode Pembayaran')),
          body: ListView(padding: EdgeInsets.all(Spacing.defaultSize), children: [_QrSection()]),
          bottomNavigationBar: Padding(
            padding: const EdgeInsets.symmetric(horizontal: Spacing.defaultSize, vertical: Spacing.sp30),
            child: ElevatedButton(
              onPressed: () {
                context.read<TransactionBloc>().add(CheckQrTransactionEvent());
              },
              child: Text('Cek Status Pembayaran'),
            ),
          ),
        ),
      ),
    );
  }
}
