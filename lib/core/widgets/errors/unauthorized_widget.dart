import 'package:appify/core/utils/extensions/size_extensions.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

import '../../constants/app_colors.dart';
import '../../constants/assets/app_images.dart';
import '../../errors/failure_message.dart';
import '../app_button.dart';

class UnauthorizedWidget extends StatelessWidget {
  final bool isStart;

  const UnauthorizedWidget({super.key, this.isStart = false});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 40.w),
      child: Center(
        child: Column(
          mainAxisAlignment: isStart ? MainAxisAlignment.start : MainAxisAlignment.center,
          children: [
            SizedBox(height: isStart ? 30.h : 0),
            Lottie.asset(AppImages.lottieUnauthorized, height: isStart ? 120.h : 150.h),
            Text(
              FailureMessages.UNAUTHORIZED_FAILURE_MESSAGE,
              textAlign: TextAlign.center,
              style: TextStyle(fontWeight: FontWeight.w500, color: AppColors.text.withOpacity(0.5)),
            ),
            SizedBox(height: 30.h),
            AppButton(
              title: 'Login',
              onPressed: () {},
              padding: EdgeInsets.symmetric(horizontal: 20.w),
              radius: 6.r,
            ),
          ],
        ),
      ),
    );
  }
}
