import 'package:intl/intl.dart';

extension TADateFormat on String {
  String getFormattedDate() {
    return DateFormat.yMMMEd().format(DateTime.parse(this));
  }
}