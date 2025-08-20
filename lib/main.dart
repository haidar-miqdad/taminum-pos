import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:sentry_flutter/sentry_flutter.dart';
import 'app/app.dart';
import 'core/core.dart';
import 'core/data/config_data.dart';
import 'firebase_options.dart';

Future<void> main() async {

  runZonedGuarded(
    () async {
      WidgetsFlutterBinding.ensureInitialized();

      await Firebase.initializeApp(
        options: DefaultFirebaseOptions.currentPlatform,
      );

      FlutterError.onError = (errorDetails) {
        FirebaseCrashlytics.instance.recordFlutterFatalError(errorDetails);
      };

       await SentryFlutter.init((options) {
        options.dsn =
            'https://229207cae8fd1c77b7f3ce26bdc8812e@o4509875714850816.ingest.us.sentry.io/4509875794411521';
        // Adds request headers and IP for users,
        // visit: https://docs.sentry.io/platforms/dart/data-management/data-collected/ for more info
        options.sendDefaultPii = true;
      });

      // Pass all uncaught asynchronous errors that aren't handled by the Flutter framework to Crashlytics
      PlatformDispatcher.instance.onError = (error, stack) {
        CrashlyticsHelper.capture(error, stack);
        return true;
      };

     

      Bloc.observer = AppBlocObserver();

      ConfigData.initialize();
      runApp(const MyApp());
    },
    (exception, stackTrace) async {
      CrashlyticsHelper.capture(exception, stackTrace);
    },
  );
}
