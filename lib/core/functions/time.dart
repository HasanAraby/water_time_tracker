class TimeHelper {
  static String getDate() {
    int year, month, day;
    year = DateTime.now().year;
    month = DateTime.now().month;
    day = DateTime.now().day;
    return "$year/$month/$day";
  }

  static String getTime() {
    String minute = DateTime.now().minute.toString();
    String hour = DateTime.now().hour.toString();
    if (minute.length == 1) minute = '0$minute';
    if (hour.length == 1) hour = '0$hour';
    return "$hour:$minute";
  }
}
