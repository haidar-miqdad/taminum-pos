
import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:sentry_flutter/sentry_flutter.dart';

class CrashlyticsHelper {
  CrashlyticsHelper._();

  static Future<void> capture(Object  exception, StackTrace stackTrace) async {
    await FirebaseCrashlytics.instance.recordError(exception, stackTrace);
    await Sentry.captureException(exception, stackTrace: stackTrace);
  }
}
