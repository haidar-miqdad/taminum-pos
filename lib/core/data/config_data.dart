//
//
// import 'package:firebase_remote_config/firebase_remote_config.dart';
//
// class ConfigData {
//
//   ConfigData._();
//
//   static final remoteConfig = FirebaseRemoteConfig.instance;
//
//   static Future<void> initialize() async {
//     try {
//       await remoteConfig.setDefaults(const {
//         'appName' : 'Taminum App',
//         'xenditKey' : 'xnd_development_tFbBuLmaYn0ycGqovQI8jWGBBHTJyuSBiewzbWfc1PmotMSFiJKeTjrvEcgXJVe',
//       });
//       await remoteConfig.setConfigSettings(RemoteConfigSettings(
//         fetchTimeout: const Duration(seconds: 30),
//         minimumFetchInterval: const Duration(minutes: 1),
//       ));
//     } catch (e) {
//       throw Exception(e.toString());
//     }
//   }
//
//   static String getValue(String key){
//     return remoteConfig.getValue(key).asString();
//   }
//
//
// }