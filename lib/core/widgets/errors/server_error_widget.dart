import 'package:appify/core/utils/extensions/size_extensions.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

import '../../constants/app_colors.dart';
import '../../constants/app_strings.dart';
import '../../constants/assets/app_images.dart';
import '../../errors/failure_message.dart';
import '../app_button.dart';

class ServerErrorWidget extends StatelessWidget {
  final Function() onPressed;
  final bool isStart;
  final String? message;

  const ServerErrorWidget({
    super.key,
    required this.onPressed,
    this.isStart = false,
    this.message,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 40.w),
        child: Column(
          mainAxisAlignment: isStart ? MainAxisAlignment.start : MainAxisAlignment.center,
          children: [
            SizedBox(height: isStart ? 10.h : 0),
            Lottie.asset(AppImages.lottieServerError, height: isStart ? 150.h : 200.h),
            Text(
              message ?? FailureMessages.SERVER_FAILURE_MESSAGE,
              textAlign: TextAlign.center,
              style: TextStyle(fontWeight: FontWeight.w500, color: AppColors.text.withOpacity(0.5)),
            ),
            SizedBox(height: 40.h),
            AppButton(
              title: AppStrings.tryAgain,
              padding: EdgeInsets.symmetric(horizontal: 20.h),
              radius: 6.r,
              onPressed: () => onPressed(),
            ),
          ],
        ),
      ),
    );
  }
}
