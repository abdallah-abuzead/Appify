import 'package:appify/core/utils/extensions/size_extensions.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

import '../../constants/app_colors.dart';
import '../../constants/app_strings.dart';
import '../../constants/assets/app_images.dart';
import '../../errors/failure_message.dart';
import '../app_button.dart';

class OfflineWidget extends StatelessWidget {
  final Function() onPressed;
  final bool isStart;

  const OfflineWidget({super.key, required this.onPressed, this.isStart = false});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 40.w),
      child: Column(
        mainAxisAlignment: isStart ? MainAxisAlignment.start : MainAxisAlignment.center,
        children: [
          SizedBox(height: isStart ? 20.w : 0),
          Lottie.asset(AppImages.lottieOffline, height: isStart ? 170.h : 200.h),
          SizedBox(height: isStart ? 15.h : 20.h),
          Text(
            FailureMessages.OFFLINE_FAILURE_MESSAGE,
            textAlign: TextAlign.center,
            style: TextStyle(fontWeight: FontWeight.w500, color: AppColors.text.withOpacity(0.5)),
          ),
          SizedBox(height: isStart ? 25.h : 40.h),
          AppButton(
            title: AppStrings.tryAgain,
            onPressed: onPressed,
            padding: EdgeInsets.symmetric(horizontal: 20.w),
            radius: 6.r,
          ),
        ],
      ),
    );
  }
}
