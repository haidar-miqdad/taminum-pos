import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/core.dart';
import '../../../features.dart';

part 'sections/bill_section.dart';
part 'sections/confirm_section.dart';

class CashPage extends StatefulWidget {
  const CashPage({super.key, this.referenceId});

  final String? referenceId;

  static const routeName = 'pos/cash';

  @override
  State<CashPage> createState() => _CashPageState();
}

class _CashPageState extends State<CashPage> {
  TextEditingController controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Scaffold(
        appBar: AppBar(title: Text('Pembayaran Tunai')),
        body: ListView(
          children: [
            _BillSection(),
            Padding(
              padding: const EdgeInsets.all(Spacing.defaultSize),
              child: RegularTextInput(
                controller: controller,
                hinText: 'Rp 0',
                label: 'Masukkan Nominal',
                keyboardType: TextInputType.number,
                inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                onChanged: (value) {
                  setState(() {});
                },
              ),
            ),
          ],
        ),
        bottomNavigationBar: BlocBuilder<CartBloc, CartState>(
          builder: (context, state) {
            return Padding(
              padding: const EdgeInsets.all(Spacing.sp24),
              child: ElevatedButton(
                onPressed: state.isCash(controller.text) ? showConfirm : null,
                child: Text('Tagih'),
              ),
            );
          },
        ),
      ),
    );
  }

  void showConfirm() {
    showModalBottomSheet(
      isScrollControlled: true,
      context: context,
      builder: (context) => _ConfirmSection(
        nominal: num.tryParse(controller.text) ?? 0,
        referenceId: widget.referenceId,
      ),
    );
  }
}
