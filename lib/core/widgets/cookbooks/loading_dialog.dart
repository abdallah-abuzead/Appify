import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../app_text.dart';

class LoadingDialog extends StatelessWidget {
  final String? message;

  const LoadingDialog({super.key, this.message});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      contentPadding: EdgeInsets.only(top: 35.h, bottom: 30.h),
      shape: OutlineInputBorder(borderRadius: BorderRadius.circular(12.r), borderSide: BorderSide.none),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const CircularProgressIndicator(),
          SizedBox(height: 20.h),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [AppText(message ?? '${'Please wait'}...', fontSize: 13.sp, fontWeight: FontWeight.w600)],
          ),
        ],
      ),
    );
  }
}

Future loadingDialog(context) async {
  return showDialog(
    context: context,
    barrierDismissible: false,
    builder: (context) => const PopScope(canPop: false, child: LoadingDialog()),
  );
}
