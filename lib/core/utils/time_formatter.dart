import 'package:intl/intl.dart';

class TimeFormatter {
  static String to12Hour(String time24, {bool arabic = true}) {
    final format24 = DateFormat("HH:mm");
    final format12 = arabic ? DateFormat("h:mm a", "ar") : DateFormat("h:mm a");

    final dateTime = format24.parse(time24);
    return format12.format(dateTime);
  }
}
