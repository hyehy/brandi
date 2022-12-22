import 'package:intl/intl.dart';

String dateFormatter(String date) {
  final df = DateFormat('yyyy-MM-dd hh:mm a');
  return df.format(DateTime.parse(date));
}
