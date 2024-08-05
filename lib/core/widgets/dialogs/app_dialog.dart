import 'package:appify/core/utils/extensions/size_extensions.dart';
import 'package:flutter/material.dart';

import '../../app_router/app_router.dart';
import '../../screens/bottom_nav_screen.dart';
import '../app_button.dart';
import '../app_text.dart';
import '../errors/offline_widget.dart';
import '../errors/server_error_widget.dart';

Future appDialog(
  context, {
  double? widthPadding,
  double? verticalPadding,
  required List<Widget> children,
  bool isDismissible = true,
  bool canPop = true,
  double? bottomPadding,
}) {
  final dialog = PopScope(
    canPop: canPop,
    child: Dialog(
      surfaceTintColor: Colors.white,
      backgroundColor: Colors.white,
      insetPadding: EdgeInsets.symmetric(horizontal: widthPadding ?? 15.w),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5.r)),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.w),
        child: Container(
          constraints: BoxConstraints(maxHeight: MediaQuery.of(context).size.height / 1.1),
          padding: EdgeInsets.only(bottom: bottomPadding ?? 10.h),
          child: SingleChildScrollView(
            padding: EdgeInsets.symmetric(vertical: verticalPadding ?? 10.h),
            child: Column(mainAxisSize: MainAxisSize.min, children: children),
          ),
        ),
      ),
    ),
  );

  return showDialog(
    barrierDismissible: isDismissible,
    context: context,
    builder: (context) => dialog,
  );
}

Future offlineDialog(context, {required VoidCallback onPressed}) async {
  return await appDialog(
    context,
    widthPadding: 10.w,
    canPop: false,
    children: [
      OfflineWidget(
        onPressed: () {
          AppRouter.back();
          onPressed();
        },
      ),
    ],
  );
}

Future successDialog(context, {required String message}) {
  return appDialog(
    context,
    children: [
      Column(
        children: [
          AppText('Success', fontSize: 16.sp, fontWeight: FontWeight.bold),
          10.heightBox,
          AppText(message, fontSize: 14.sp, fontWeight: FontWeight.w400),
          20.heightBox,
          AppButton(
            title: 'Home',
            padding: EdgeInsets.symmetric(horizontal: 10.w),
            onPressed: () => AppRouter.offAll(const BottomNavScreen(initialIndex: 0)),
          )
        ],
      ),
    ],
  );
}

Future serverErrorDialog(context, {required VoidCallback onPressed}) async {
  return await appDialog(
    context,
    widthPadding: 10.w,
    canPop: false,
    children: [
      ServerErrorWidget(
        onPressed: () {
          AppRouter.back();
          onPressed();
        },
      ),
    ],
  );
}
