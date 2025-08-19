import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_taminum_mobile/core/core.dart';

import '../../blocs/blocs.dart';

part 'sections/item_section.dart';

class PrinterPage extends StatefulWidget {
  const PrinterPage({super.key});

  static const routeName = 'settings/printer';

  @override
  State<PrinterPage> createState() => _PrinterPageState();
}

class _PrinterPageState extends State<PrinterPage> {
  @override
  void initState() {
    context.read<PrinterBloc>().add(GetPrinterEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Cari Printer')),
      body: Padding(
        padding: const EdgeInsets.all(Spacing.defaultSize),
        child: BlocBuilder<PrinterBloc, PrinterState>(
          builder: (context, state) {
            if (state.status == Status.success && state.printers.isEmpty) {
              Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(MainAssets.error, width: Spacing.sp200),
                    Spacing.sp32.height,
                    const SubtitleText(
                      'Gagal Memuat Data',
                      textAlign: TextAlign.center,
                    ),
                    Spacing.defaultSize.height,
                    RegularText(
                      'Pastikan bluetooth dan printer\nthermal Anda aktif.',
                      textAlign: TextAlign.center,
                      style: TextStyle(color: MainColors.black[400]),
                    ),
                  ],
                ),
              );
            }
            return ListView.separated(
              itemBuilder: (BuildContext context, int index) {
                final item = state.printers[index];
                return _ItemSection(
                  onTap: () {},
                  title: item.name,
                  port: item.macAdress,
                );
              },
              separatorBuilder: (BuildContext context, int index) =>
                  Spacing.sp24.height,
              itemCount: state.printers.length,
            );
          },
        ),
      ),
      bottomNavigationBar: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(Spacing.defaultSize),
          child: ElevatedButton(
            onPressed: () {
              context.read<PrinterBloc>().add(OpenSettingPrinterEvent());
            },
            child: Text('Tambah Printer'),
          ),
        ),
      ),
    );
  }
}
