import 'package:flutter_taminum_mobile/core/data/config_data.dart';

class ConfigApp {
  ConfigApp._();

  static String appName = ConfigData.getValue('appName');

  static String xenditKey = ConfigData.getValue('xenditKey');

  static String email = ConfigData.getValue('email');

  static String phone = ConfigData.getValue('phone');

  static String playStoreUrl = ConfigData.getValue('playStoreUrl');



}
