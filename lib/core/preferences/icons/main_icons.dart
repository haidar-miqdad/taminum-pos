// Place fonts/MainIcons.ttf in your fonts/ directory and
// add the following to your pubspec.yaml
// flutter:
//   fonts:
//    - family: MainIcons
//      fonts:
//       - asset: fonts/MainIcons.ttf
import 'package:flutter/widgets.dart';

class MainIcons {
  MainIcons._();

  static const String _fontFamily = 'MainIcons';

  static const IconData cart = IconData(0xe909, fontFamily: _fontFamily);
  static const IconData product1 = IconData(0xe906, fontFamily: _fontFamily);
  static const IconData product2 = IconData(0xe907, fontFamily: _fontFamily);
  static const IconData star = IconData(0xe900, fontFamily: _fontFamily);
  static const IconData search = IconData(0xe90c, fontFamily: _fontFamily);
  static const IconData edit = IconData(0xe90d, fontFamily: _fontFamily);
  static const IconData cash = IconData(0xe90a, fontFamily: _fontFamily);
  static const IconData qr = IconData(0xe90b, fontFamily: _fontFamily);
  static const IconData product3 = IconData(0xe908, fontFamily: _fontFamily);
  static const IconData home = IconData(0xe905, fontFamily: _fontFamily);
  static const IconData printer = IconData(0xe901, fontFamily: _fontFamily);
  static const IconData receipt = IconData(0xe902, fontFamily: _fontFamily);
  static const IconData receipt2 = IconData(0xe903, fontFamily: _fontFamily);
  static const IconData settings = IconData(0xe904, fontFamily: _fontFamily);
}
