extension DateTimeExtension on DateTime {
  DateTime dateOnly() {
    return DateTime(year, month, day);
  }

  bool operator <=(DateTime other) {
    return isBefore(other) || isAtSameMomentAs(other);
  }
}
