import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';

import '../constants/app_colors.dart';

class CustomAutoSizeText extends StatelessWidget {
  final String text;
  final Color color;
  final FontWeight fontWeight;
  final double defaultSize;
  final double minFontSize;
  final double maxFontSize;
  final int maxLines;
  final TextAlign textAlign;

  const CustomAutoSizeText({
    super.key,
    required this.text,
    this.color = AppColors.text,
    this.fontWeight = FontWeight.w500,
    this.defaultSize = 16,
    this.minFontSize = 12,
    this.maxFontSize = 16,
    this.maxLines = 1,
    this.textAlign = TextAlign.center,
  });

  @override
  Widget build(BuildContext context) {
    return AutoSizeText(
      text,
      style: TextStyle(
        color: color,
        fontWeight: fontWeight,
        fontFamily: 'Mulish',
        fontSize: defaultSize,
      ),
      textAlign: textAlign,
      minFontSize: minFontSize,
      maxFontSize: maxFontSize,
      maxLines: maxLines,
      overflow: TextOverflow.ellipsis,
    );
  }
}
