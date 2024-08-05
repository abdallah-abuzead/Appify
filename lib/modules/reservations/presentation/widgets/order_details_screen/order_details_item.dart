import 'package:flutter/material.dart';

import '../../../../../core/constants/app_colors.dart';
import '../../../../../core/widgets/app_text.dart';

class OrderDetailsItem extends StatelessWidget {
  final String title;
  final String value;
  const OrderDetailsItem({
    super.key,
    required this.title,
    required this.value,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        AppText(
          title,
          fontWeight: FontWeight.w500,
          color: AppColors.text.shade200,
        ),
        AppText(
          value,
          fontWeight: FontWeight.w500,
          color: AppColors.text.shade300,
        ),
      ],
    );
  }
}
