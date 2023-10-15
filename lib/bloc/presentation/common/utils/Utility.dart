import 'package:intl/intl.dart';

class Utility {
  Utility._();

  static String getFormattedDate(String date) {
    return DateFormat.yMMMEd().format(DateTime.parse(date));
  }
}

extension TADateFormat on String {
  String getFormattedDate() {
    return DateFormat.yMMMEd().format(DateTime.parse(this));
  }
}
