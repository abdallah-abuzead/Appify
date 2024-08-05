import 'package:flutter/cupertino.dart';

import '../app_router/app_router.dart';

/// get validation error message for single input field
String? getErrorText(String key, Map<String, dynamic>? errors) {
  if (errors != null && errors.keys.contains(key)) return errors[key];
  return null;
}

/// check if the app now is landscape
bool get isInLandscape => MediaQuery.of(AppRouter.currentContext!).orientation == Orientation.landscape;

/// check if the current mode is the dark mode
bool isDarkMode(BuildContext context) => MediaQuery.of(context).platformBrightness == Brightness.dark;

/// clear focus if there is
void clearFocus(BuildContext context) {
  FocusScopeNode currentFocus = FocusScope.of(context);
  if (!currentFocus.hasPrimaryFocus && currentFocus.focusedChild != null) {
    FocusManager.instance.primaryFocus?.unfocus();
  }
}

/// replace arabic numbers
String replaceArabicNumber(String input) {
  const english = ['0', '1', '2', '3', '4', '5', '6', '7', '8', '9'];
  const arabic = ['٠', '١', '٢', '٣', '٤', '٥', '٦', '٧', '٨', '٩'];

  for (int i = 0; i < english.length; i++) {
    input = input.replaceAll(arabic[i], english[i]);
  }

  return input;
}

/// print wrapped
void printWrapped(String text) {
  final pattern = RegExp('.{1,800}'); // 800 is the size of each chunk
  pattern.allMatches(text).forEach((match) => debugPrint(match.group(0)));
}
