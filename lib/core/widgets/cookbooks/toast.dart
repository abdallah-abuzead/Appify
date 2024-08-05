import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';

import '../../constants/app_colors.dart';

Future<bool?> showToast({required String message, bool isSuccess = false}) async {
  return await Fluttertoast.showToast(
    msg: message,
    toastLength: Toast.LENGTH_SHORT,
    gravity: ToastGravity.BOTTOM,
    timeInSecForIosWeb: 3,
    backgroundColor: isSuccess ? AppColors.success : AppColors.error,
    textColor: Colors.white,
    fontSize: 16.sp,
  );
}
