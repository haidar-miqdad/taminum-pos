

import 'package:flutter/material.dart';

class POSOrderPage extends StatelessWidget {
  const POSOrderPage({super.key});

  static const routeName = '/pos/order';

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(title: Text('Daftar Pesanan'),),
    );
  }
}
