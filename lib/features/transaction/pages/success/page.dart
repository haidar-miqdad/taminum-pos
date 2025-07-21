import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_taminum_mobile/core/core.dart';
import 'package:flutter_taminum_mobile/features/features.dart';
import 'package:lottie/lottie.dart';
import 'package:screenshot/screenshot.dart';

import '../../../../core/widgets/share_receipt.dart';

part 'sections/status_section.dart';

part 'sections/type_payment_section.dart';

part 'sections/order_section.dart';

part 'sections/detail_section.dart';

part 'sections/action_section.dart';

class SuccessTransactionPage extends StatelessWidget {
  const SuccessTransactionPage({super.key, required this.referenceId});

  final String referenceId;
  static const routeName = 'transaction/success';

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: Navigator.canPop(context),
      onPopInvokedWithResult: (bool didPop, Object? result) {
        if (didPop) {
          context.read<BottomNavBloc>().add(TapBottomNavEvent(1));
          Navigator.pushNamedAndRemoveUntil(context, MainPage.routeName, (route) => false);
        }
      },
      child: Scaffold(
        appBar: AppBar(title: Text('Transaksi Berhasil')),
        body: ListView(
          children: [
            _StatusSection(),
            AppDivider(thickness: Spacing.sp8),
            _TypePaymentSection(),
            AppDivider(thickness: Spacing.sp8),
            _OrderSection(),
            AppDivider(thickness: Spacing.sp8),
            _DetailSection(referenceId: referenceId),
          ],
        ),
        bottomNavigationBar: _ActionSection(),
      ),
    );
  }
}

