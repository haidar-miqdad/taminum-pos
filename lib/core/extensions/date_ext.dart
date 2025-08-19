import 'package:intl/intl.dart';

extension DateExt on DateTime {
  String get dateFormatted {
    return DateFormat('EEE, MMM d • h:mm a').format(this);
  }
}
