import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_taminum_mobile/core/core.dart';
import 'package:flutter_taminum_mobile/features/settings/blocs/blocs.dart';

class XenditPage extends StatefulWidget {
  const XenditPage({super.key});

  static const routeName = 'settings/xendit';

  @override
  State<XenditPage> createState() => _XenditPageState();
}

class _XenditPageState extends State<XenditPage> {
  // @override
  // void initState() {
  //   context.read<XenditBloc>().add(GetXenditEvent());
  //   super.initState();
  // }

  final TextEditingController controller = TextEditingController();

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('API Key Xendit')),
      body: Padding(
        padding: const EdgeInsets.all(Spacing.defaultSize),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            RegularTextInput(
              label: 'API Key',
              hinText: 'Masukkan API Key Xendit',
              required: true,
              controller: controller,
            ),
            Spacer(),
            SafeArea(
              child: ElevatedButton(
                onPressed: () {
                  // context.read<XenditBloc>().add(SubmitXenditEvent(controller.text));
                },
                child: Text('Simpan'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
