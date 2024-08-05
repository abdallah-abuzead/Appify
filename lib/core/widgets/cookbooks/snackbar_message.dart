import 'package:appify/core/utils/extensions/size_extensions.dart';
import 'package:flutter/material.dart';

import '../../constants/app_colors.dart';
import '../../constants/app_constants.dart';
import '../app_text.dart';

class SnackBarMessage {
  static void success({
    required BuildContext context,
    required String message,
    Duration? duration,
    SnackBarBehavior? behavior,
  }) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 10.h),
        content: AppText(message, color: Colors.white, fontSize: 13.sp, fontWeight: FontWeight.w600),
        backgroundColor: AppColors.success,
        duration: duration ?? const Duration(seconds: AppConstants.snackBarDurationSeconds),
        behavior: behavior,
      ),
    );
  }

  static void error({
    required BuildContext context,
    required String message,
    Duration? duration,
    SnackBarBehavior? behavior,
  }) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 10.h),
        content: AppText(message, color: Colors.white, fontSize: 13.sp, fontWeight: FontWeight.w600),
        backgroundColor: AppColors.error,
        duration: duration ?? const Duration(seconds: AppConstants.snackBarDurationSeconds),
        behavior: behavior,
      ),
    );
  }
}
