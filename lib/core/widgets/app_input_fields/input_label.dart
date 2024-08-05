import 'package:appify/core/utils/extensions/size_extensions.dart';
import 'package:flutter/material.dart';

import '../../constants/app_colors.dart';
import '../app_text.dart';

class InputLabel extends StatelessWidget {
  const InputLabel({super.key, required this.label, this.isRequired = false, this.isBold = false});
  final String label;
  final bool isRequired;
  final bool isBold;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: 0.h),
      child: Row(
        children: [
          AppText(
            label,
            fontSize: 14.sp,
            color: AppColors.text.shade300,
            fontWeight: isBold ? FontWeight.w500 : FontWeight.w400,
          ),
          if (isRequired)
            AppText(
              '*',
              fontSize: 14.sp,
              color: AppColors.error.shade600,
            ),
        ],
      ),
    );
  }
}
