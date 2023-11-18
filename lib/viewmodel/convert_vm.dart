import 'package:intl/intl.dart';

class ConvertVM {
  static String dateToString(DateTime dateTime) {
    return DateFormat("dd/MM/yyyy/HH:mm").format(dateTime);
  }
  
  static DateTime stringToDate(String dateText){
    List<String> dateList=dateText.split(RegExp(r'[/|:]'));
    int day=int.parse(dateList[0]);
    int month=int.parse(dateList[1]);
    int year=int.parse(dateList[2]);
    int hour=int.parse(dateList[3]);
    int minute=int.parse(dateList[4]);
    return DateTime(year,month,day,hour,minute);
  }
}
