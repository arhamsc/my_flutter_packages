import 'package:intl/intl.dart';

DateTime onlyTimeParser(String time) {
  DateTime date = DateTime.now();
  String formattedDate = DateFormat('yyyy-MM-dd').format(date);
  // String time = "13:00:00Z";
  DateTime dt = DateTime.parse("${formattedDate}T$time").toLocal();
  // String formattedTime = DateFormat('HH:mm').format(dt);
  return dt;
}
