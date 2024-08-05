import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../constants/app_constants.dart';

class AppRouter {
  static final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();
  static BuildContext? currentContext = navigatorKey.currentContext;

  static to(Widget page, {Transition? transition}) => Get.to(
        page,
        transition: transition ?? Transition.rightToLeft,
        duration: const Duration(milliseconds: AppConstants.routingDurationMilliseconds),
        curve: Curves.easeInOut,
      );

  static off(Widget page) => Get.off(
        page,
        transition: Transition.rightToLeft,
        duration: const Duration(milliseconds: AppConstants.routingDurationMilliseconds),
        curve: Curves.easeInOut,
      );

  static offAll(Widget page) => Get.offAll(
        page,
        transition: Transition.rightToLeft,
        duration: const Duration(milliseconds: AppConstants.routingDurationMilliseconds),
        curve: Curves.easeInOut,
      );

  static back() => Get.back();
}
