import 'package:intl/intl.dart';

class Utility {
  Utility._();
}

extension TADateFormat on String {
  String getFormattedDate() {
    return DateFormat.yMMMEd().format(DateTime.parse(this));
  }
}
