import 'package:flutter/material.dart';

import '../features/features.dart';

Route<dynamic> routes(settings) {
  switch (settings.name) {
    case MainPage.routeName:
      return MaterialPageRoute(builder: (context) => const MainPage());
    case ProfilePage.routeName:
      return MaterialPageRoute(builder: (context) => const ProfilePage());
    case XenditPage.routeName:
      return MaterialPageRoute(builder: (context) => const XenditPage());
    case ReceiptPage.routeName:
      return MaterialPageRoute(builder: (context) => const ReceiptPage());
    case ShowReceiptPage.routeName:
      return MaterialPageRoute(builder: (context) => const ShowReceiptPage());
    case PrinterPage.routeName:
      return MaterialPageRoute(builder: (context) => const PrinterPage());
    case ProductInputPage.routeName:
      return MaterialPageRoute(builder: (context) => ProductInputPage(product: settings.arguments as ProductModel?));
    case POSOrderPage.routeName:
      return MaterialPageRoute(builder: (context) => POSOrderPage());

    default:
      return MaterialPageRoute(
        builder: (context) {
          return Scaffold(body: Center(child: Text('Page not found: ${settings.name}')));
        },
      );
  }
}
