import 'package:intl/intl.dart';

class AppDateUtils {
  static const String DMMY = 'dd MMMM yyyy';
  static const String HHMMSS = 'hh:mm:ss';
  static DateFormat yyyyMMdd = DateFormat("yyyy-MM-dd", 'en');
  static DateFormat yyyyMMddHHmma = DateFormat('yyyy-MM-dd HH:mm a', 'en');
  static DateFormat MMMdd = DateFormat('MMM dd', 'en'); //Jul 30

  // iso format  '2024-07-30T21:00:00.000000Z'

  static DateTime textToDate(String text, String lang) {
    try {
      return DateFormat("yyyy-MM-ddThh:mm:ss", lang).parse(text);
    } catch (_) {
      return DateTime.now();
    }
  }

  static String textTFormate(String text, String formate, String lang, {bool isJms = false}) {
    try {
      final DateFormat format = isJms ? DateFormat("$formate ", lang).add_jm() : DateFormat(formate, lang);
      return format.format(DateFormat("yyyy-MM-dd hh:mm:ss").parse(text));
    } catch (_) {
      return '';
    }
  }

  static String dateToFormate(DateTime time, String formate, {bool isJms = true}) {
    try {
      final DateFormat format = isJms ? DateFormat("$formate  ", 'en').add_jm() : DateFormat(formate, 'en');
      return format.format(time);
    } catch (_) {
      return '';
    }
  }

  static String dateToString(DateTime time) {
    try {
      return yyyyMMdd.format(time);
    } catch (_) {
      return '';
    }
  }

  static DateTime textToTime(String text, String lang) {
    try {
      return DateFormat("hh:mm:ss", lang).parse(text);
    } catch (_) {
      return DateTime.now();
    }
  }

  static String getTimeFromDateText(String date) {
    try {
      var inputFormat = DateFormat('yyyy-MM-dd HH:mm:ss', 'en');
      var inputDate = inputFormat.parse(date); //

      var outputFormat = DateFormat('hh:mm a', 'en'); // 07:00 PM
      var outputTime = outputFormat.format(inputDate);

      return outputTime;
    } catch (e) {
      return '00:00';
    }
  }

  static String getDateTimeFromDateText(String date) {
    try {
      var inputFormat = DateFormat('yyyy-MM-dd HH:mm:ss', 'en');
      var inputDate = inputFormat.parse(date); //

      var outputFormat = DateFormat('MMM dd - hh:mm a', 'en'); // Aug 03 - 07:00 PM
      var outputTime = outputFormat.format(inputDate);

      return outputTime;
    } catch (e) {
      return '00:00';
    }
  }

  static String getTimeIn12h(String time) {
    try {
      var inputFormat = DateFormat('HH:mm', 'en');
      var inputDate = inputFormat.parse(time); //

      var outputFormat = DateFormat('hh:mm a', 'en');
      var outputTime = outputFormat.format(inputDate);

      return outputTime;
    } catch (e) {
      return '00:00';
    }
  }

  static bool isTimeAfterNow(String time) {
    try {
      var dateTime = getDateTimeFromStringTime(time);
      var now = getDateTimeFromStringTime(getStringTimeFromDateTime(DateTime.now()));
      return dateTime.isAfter(now) ? true : false;
    } catch (e) {
      return false;
    }
  }

  static DateTime getDateTimeFromStringDate(String date) {
    var format = DateFormat("yyyy-MM-dd", 'en');
    var dateTime = format.parse(date);
    return dateTime;
  }

  static DateTime getDateTimeFromStringTime(String time) {
    var format = DateFormat("HH:mm", 'en');
    var dateTime = format.parse(time);
    return dateTime;
  }

  static String getStringTimeFromDateTime(DateTime dateTime) {
    var dateFormat = DateFormat("HH:mm", 'en');
    final String textFormatted = dateFormat.format(dateTime);
    return textFormatted;
  }

  static String getStringDateFromDateTime(DateTime dateTime) {
    var dateFormat = DateFormat("yyyy-MM-dd HH:mm:ss", 'en');
    final String textFormatted = dateFormat.format(dateTime);
    return textFormatted;
  }

  static DateTime getDateTimeFromStringWithFormat(String time, String format) {
    var dateFormat = DateFormat(format, 'en');
    var dateTime = dateFormat.parse(time);
    return dateTime;
  }

  static String getStringFromDateTimeWithFormat(DateTime dateTime, String format) {
    var dateFormat = DateFormat(format, 'en');
    final String textFormatted = dateFormat.format(dateTime);
    return textFormatted;
  }

  static int getMillisecondsBetween(String time) {
    try {
      String timeWithSeconds = "$time:00";
      String format = "HH:mm:ss";
      var dateTime = getDateTimeFromStringWithFormat(timeWithSeconds, format);
      var now = getDateTimeFromStringWithFormat(getStringFromDateTimeWithFormat(DateTime.now(), format), format);

      int differentMilliseconds = DateTime.now().millisecondsSinceEpoch + dateTime.difference(now).inMilliseconds;

      return differentMilliseconds;
    } catch (e) {
      return 0;
    }
  }

  static int getHoursBetweenNow(int milliseconds) {
    try {
      DateTime dateTime = DateTime.fromMillisecondsSinceEpoch(milliseconds);
      int hours = DateTime.now().difference(dateTime).inHours;

      return hours;
    } catch (e) {
      return 0;
    }
  }

  static String getFormattedDateFromISOFormat(String isoDate) {
    try {
      DateTime dateTime = DateTime.parse(isoDate);
      String formattedDate = DateFormat('EEE d MMM yyyy', 'en').format(dateTime);
      return formattedDate;
    } catch (e) {
      return '';
    }
  }

  static String getDateFromDateTime(DateTime dateTime) {
    try {
      String formattedDate = DateFormat('yyyy-MM-dd', 'en').format(dateTime);
      return formattedDate;
    } catch (e) {
      return '';
    }
  }

  static String getDayMonthFromIso(String isoDate) {
    try {
      DateTime dateTime = DateTime.parse(isoDate);
      String formattedDate = DateFormat('dd MMM', 'en').format(dateTime); // 31 Aug
      return formattedDate;
    } catch (e) {
      return '';
    }
  }

  static String getTimeFromIso(String isoDate) {
    try {
      DateTime dateTime = DateTime.parse(isoDate);
      String formattedDate = DateFormat('hh:mm a', 'en').format(dateTime);
      return formattedDate;
    } catch (e) {
      return '';
    }
  }

  static String getEventFormattedDateFromISOFormat(String isoDate) {
    try {
      DateTime dateTime = DateTime.parse(isoDate);
      String formattedDate = DateFormat('dd MMM', 'ar').format(dateTime); // Jul 31
      return formattedDate;
    } catch (e) {
      return '';
    }
  }

  static bool isToday(String date) {
    DateTime dateTime = yyyyMMdd.parse(date);
    DateTime now = DateTime.now();
    return dateTime.day == now.day && dateTime.month == now.month && dateTime.year == now.year;
  }
}
