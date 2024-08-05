import 'package:appify/core/utils/extensions/size_extensions.dart';
import 'package:flutter/material.dart';

import '../../../../../core/constants/app_colors.dart';
import '../../../../../core/widgets/app_text.dart';

class ReservationCardDetailsItem extends StatelessWidget {
  final String title;
  final String value;
  const ReservationCardDetailsItem({super.key, required this.title, required this.value});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        AppText(title, fontWeight: FontWeight.w700, color: AppColors.text.shade200),
        5.heightBox,
        AppText(value, fontWeight: FontWeight.w500, fontSize: 12.sp, color: AppColors.text),
      ],
    );
  }
}
