import 'package:intl/intl.dart';

class ConvertVM {
  static String dateToString(DateTime dateTime) {
    return DateFormat("dd/MM/yyyy/HH:mm").format(dateTime);
  }
}
