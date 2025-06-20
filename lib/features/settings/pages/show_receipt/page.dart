
import 'package:flutter/material.dart';
import 'package:flutter_taminum_mobile/core/core.dart';

part 'sections/header_section.dart';
part 'sections/type_section.dart';
part 'sections/order_section.dart';
part 'sections/detail_section.dart';

class ShowReceiptPage extends StatelessWidget {
  const ShowReceiptPage({super.key});

  static const routeName = 'settings/show-receipt';
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Tampilan Struk'),),
      body: ListView(
        children: [
          _HeaderSection(),
          Divider(color: MainColors.white, thickness: 8,),
          _TypeSection(),
          Divider(color: MainColors.white, thickness: 8,),
          _OrderSection(),
          Divider(color: MainColors.white, thickness: 8,),
          _DetailSection(),

          Padding(
            padding: const EdgeInsets.symmetric(vertical: Spacing.defaultSize),
            child: RichText(

                textAlign: TextAlign.center,
                text: TextSpan(
              text: 'Terimakasih sudah berkunjung.',
              style: TextStyle(color: MainColors.black[600], fontSize: Spacing.defaultSize, height: 1.7,),

              children: [
                TextSpan(text: '\nPowered by Haidar Miqdad'),
              ]
            )),
          )
          
        ],
      ),
    );
  }
}

