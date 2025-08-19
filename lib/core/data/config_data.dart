import 'package:firebase_remote_config/firebase_remote_config.dart';
import 'package:flutter_taminum_mobile/core/core.dart';
import 'package:package_info_plus/package_info_plus.dart';

class ConfigData {
  ConfigData._();

  static final remoteConfig = FirebaseRemoteConfig.instance;

  static Future<void> initialize() async {
    try {
      await remoteConfig.setDefaults(const {
        'appName': 'Taminum App',
        'xenditKey':
            'xnd_development_tFbBuLmaYn0ycGqovQI8jWGBBHTJyuSBiewzbWfc1PmotMSFiJKeTjrvEcgXJVe',
        'email': 'Email',
        'phone': 'Phone Number',
        'minVersion': 1,
        'maxVersion': 1,
      });
      await remoteConfig.setConfigSettings(
        RemoteConfigSettings(
          fetchTimeout: const Duration(seconds: 30),
          minimumFetchInterval: const Duration(minutes: 1),
        ),
      );
      await remoteConfig.fetchAndActivate();
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  static String getValue(String key) {
    return remoteConfig.getValue(key).asString();
  }

  // static Future<VersionType> checkVersion() async {
  //   try {
  //     int minVersion = remoteConfig.getInt('minVersion');
  //     int maxVersion = remoteConfig.getInt('maxVersion');
  //
  //     final packageInfo = await PackageInfo.fromPlatform();
  //     final currentVersion = int.parse(packageInfo.buildNumber);
  //   } catch (e) {
  //     throw Exception(e.toString());
  //   }
  // }
}
