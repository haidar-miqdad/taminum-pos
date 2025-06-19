
import 'package:flutter/material.dart';
import 'package:flutter_taminum_mobile/core/core.dart';

class ReceiptPage extends StatelessWidget {
  const ReceiptPage({super.key});

  static const routeName = 'settings/receipt';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Atur Struk'),),
      body: Padding(
        padding: const EdgeInsets.all(Spacing.defaultSize),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            SubtitleText('Pengaturan Dasar'),
            Spacing.sp24.height,
            RegularTextInput(hinText: 'Cth: @Taminum yang itu tea', label: 'Keterangan', ),
            Spacing.sp24.height,
            RegularTextInput(hinText: 'Cth: Selamat menikmati', label: 'Pesan', ),
            Spacer(),
            Divider(color: MainColors.white[400], thickness: 1),
            Spacing.sp30.height,
            OutlinedButton(onPressed: (){}, child: Text('Lihat Tampilan Struk')),
            Spacing.defaultSize.height,
            SafeArea(child: ElevatedButton(onPressed: (){}, child: Text('Simpan'))),
          ],
        ),
      ),
    );
  }
}
