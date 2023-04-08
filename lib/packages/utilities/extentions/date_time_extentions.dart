extension AddDays on DateTime {
  DateTime addDays(int days) => add(Duration(days: days));
  bool isAfterToday(DateTime other) => compareTo(DateTime.now()) > 0;
  bool isBeforeToday(DateTime other) => compareTo(DateTime.now()) < 0;
}
