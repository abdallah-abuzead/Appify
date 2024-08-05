import 'package:flutter/cupertino.dart';
import 'package:intl/intl.dart';

extension StringExtension on String {
  String get capitalized => length > 0 ? '${this[0].toUpperCase()}${substring(1)}' : '';

  String removeLast() => substring(0, length - 1);

  DateTime? get currentLocalDate => toCurrentLocalDate();

  // String get translate => tr(this);

  bool get isValidEmail {
    String pattern =
        r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
    RegExp regex = RegExp(pattern);
    return regex.hasMatch(this);
  }

  DateTime? toCurrentLocalDate({String format = "yyyy-MM-ddTHH:mm:ss"}) {
    try {
      return this == "null" || isEmpty ? null : DateFormat(format, 'en').parse(this, true).toLocal();
    } catch (e) {
      debugPrint(" the error in parsing current string: $this, to current local date is: $e");
    }
    return null;
  }
}
