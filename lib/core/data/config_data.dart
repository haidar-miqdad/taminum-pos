import 'package:firebase_remote_config/firebase_remote_config.dart';
import 'package:flutter/material.dart';
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
        'playStoreUrl': 'https://play.google.com/store/games?hl=id&pli=1',
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

  static Future<VersionType> checkUpdateConfigData() async {
    try {
      final maxVersion = remoteConfig.getInt('maxVersion');
      final minVersion = remoteConfig.getInt('minVersion');

      final packageInfo = await PackageInfo.fromPlatform();

      final currentVersion = int.parse(packageInfo.buildNumber);

      debugPrint(
        'CURRENT VERSION: $currentVersion, MIN: $minVersion, MAX: $maxVersion',
      );

      if (currentVersion < minVersion) {
        return VersionType.expired;
      } else if (currentVersion < maxVersion) {
        return VersionType.update;
      } else {
        return VersionType.upToDate;
      }
    } catch (e) {
      throw Exception(e.toString());
    }
  }
}
