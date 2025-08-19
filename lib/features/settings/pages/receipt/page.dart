import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_taminum_mobile/core/core.dart';

import '../../../features.dart';
import '../../blocs/blocs.dart';

class ReceiptPage extends StatefulWidget {
  const ReceiptPage({super.key});

  static const routeName = 'settings/receipt';

  @override
  State<ReceiptPage> createState() => _ReceiptPageState();
}

class _ReceiptPageState extends State<ReceiptPage> {
  final TextEditingController descController = TextEditingController();
  final TextEditingController messageController = TextEditingController();

  @override
  void dispose() {
    descController.dispose();
    messageController.dispose();
    super.dispose();
  }

  @override
  void initState() {
    context.read<ReceiptBloc>().add(GetReceiptEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<ReceiptBloc, ReceiptState>(
      listener: (context, state) {
        if (state.status == Status.success) {
          Navigator.pop(context);
        }
        if (state.status == Status.apply) {
          descController.text = state.receipt!.desc;
          messageController.text = state.receipt!.message;
        }

        if (state.status == Status.failure) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text(state.error ?? 'something went wrong!!')),
          );
        }
      },
      child: Scaffold(
        appBar: AppBar(title: Text('Atur Struk')),
        body: Padding(
          padding: const EdgeInsets.all(Spacing.defaultSize),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              SubtitleText('Pengaturan Dasar'),
              Spacing.sp24.height,
              RegularTextInput(
                hinText: 'Cth: @Taminum yang itu tea',
                label: 'Keterangan',
                controller: descController,
              ),
              Spacing.sp24.height,
              RegularTextInput(
                hinText: 'Cth: Selamat menikmati',
                label: 'Pesan',
                controller: messageController,
              ),
            ],
          ),
        ),
        bottomNavigationBar: Padding(
          padding: const EdgeInsets.all(Spacing.defaultSize),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisSize: MainAxisSize.min,
            children: [
              Divider(color: MainColors.white[400], thickness: 1),
              Spacing.sp30.height,
              OutlinedButton(
                onPressed: () {
                  Navigator.pushNamed(context, ShowReceiptPage.routeName);
                },
                child: Text('Lihat Tampilan Struk'),
              ),
              Spacing.defaultSize.height,
              SafeArea(
                child: ElevatedButton(
                  onPressed: () {
                    context.read<ReceiptBloc>().add(
                      SubmitReceiptEvent(
                        message: messageController.text,
                        desc: descController.text,
                      ),
                    );
                  },
                  child: Text('Simpan'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
