import 'package:appify/core/utils/extensions/size_extensions.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

import '../../constants/app_colors.dart';
import '../../constants/app_strings.dart';
import '../../constants/assets/app_images.dart';
import '../app_button.dart';

class EmptyWidget extends StatelessWidget {
  final String? buttonTitle;
  final Function() onPressed;
  final String name;
  final bool isStart;

  const EmptyWidget({
    super.key,
    required this.name,
    required this.onPressed,
    this.isStart = false,
    this.buttonTitle,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 40.w),
        child: Column(
          mainAxisAlignment: isStart ? MainAxisAlignment.start : MainAxisAlignment.center,
          children: [
            Lottie.asset(AppImages.lottieEmpty, height: isStart ? 200.h : 250.h),
            Text(
              '${AppStrings.thereIsNo} $name ${AppStrings.yet}',
              textAlign: TextAlign.center,
              style: TextStyle(fontWeight: FontWeight.w500, color: AppColors.text.withOpacity(0.5)),
            ),
            SizedBox(height: 20.h),
            AppButton(
              title: buttonTitle ?? AppStrings.reload,
              onPressed: onPressed,
              padding: EdgeInsets.symmetric(horizontal: 20.w),
              radius: 6.r,
            ),
          ],
        ),
      ),
    );
  }
}
