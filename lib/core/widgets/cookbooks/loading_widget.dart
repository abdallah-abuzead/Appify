import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:appify/core/utils/extensions/size_extensions.dart';
import 'package:flutter/material.dart';

import '../../constants/app_colors.dart';
import '../../constants/app_constants.dart';
import '../../constants/app_strings.dart';

class LoadingWidget extends StatelessWidget {
  const LoadingWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            AppStrings.loading,
            style: TextStyle(
              color: AppColors.text.withOpacity(0.5),
              fontWeight: FontWeight.w500,
              fontSize: 15.sp,
            ),
          ),
          SizedBox(
            width: 30.w,
            child: DefaultTextStyle(
              style: TextStyle(
                color: AppColors.text..withOpacity(0.3),
                fontWeight: FontWeight.w500,
                fontSize: 16.sp,
              ),
              child: AnimatedTextKit(
                repeatForever: true,
                animatedTexts: [
                  TyperAnimatedText(
                    '...',
                    speed: const Duration(milliseconds: AppConstants.loadingDurationMilliseconds),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
