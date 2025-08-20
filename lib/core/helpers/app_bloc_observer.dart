import 'package:bloc/bloc.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_taminum_mobile/core/core.dart';

class AppBlocObserver extends BlocObserver {
  @override
  void onChange(BlocBase bloc, Change change) {
    super.onChange(bloc, change);
    if (kDebugMode) {
      print('${bloc.runtimeType} $change');
    }
  }

  @override
  void onError(BlocBase bloc, Object error, StackTrace stackTrace) {
    CrashlyticsHelper.capture(error, stackTrace);
    super.onError(bloc, error, stackTrace);
  }
}
