import 'package:flutter/material.dart';
import 'package:flutter_taminum_mobile/core/core.dart';

part 'sections/header_section.dart';
part 'sections/type_section.dart';
part 'sections/order_section.dart';
part 'sections/detail_section.dart';
part 'sections/footer_section.dart';

class ShowReceiptPage extends StatelessWidget {
  const ShowReceiptPage({super.key});

  static const routeName = 'settings/show-receipt';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Tampilan Struk')),
      body: ListView(
        children: [
          _HeaderSection(),
          Divider(color: MainColors.white, thickness: 8),
          _TypeSection(),
          Divider(color: MainColors.white, thickness: 8),
          _OrderSection(),
          Divider(color: MainColors.white, thickness: 8),
          _DetailSection(),
          _FooterSection(),
        ],
      ),
    );
  }
}
