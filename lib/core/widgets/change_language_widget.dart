import 'package:appify/core/utils/extensions/size_extensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../constants/app_colors.dart';
import '../constants/assets/app_icons.dart';
import 'app_button.dart';

class ChangeLanguageWidget extends StatelessWidget {
  const ChangeLanguageWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(child: Container()),
        AppButton(
            title: 'عربى',
            backgroundColor: Colors.transparent,
            foregroundColor: AppColors.text.shade200,
            side: BorderSide(color: AppColors.border.shade100, width: 1.w),
            icon: SvgPicture.asset(AppIcons.language),
            padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 7.h),
            onPressed: () {}),
      ],
    );
  }
}
