import 'package:appify/core/utils/extensions/size_extensions.dart';
import 'package:flutter/material.dart';

import '../constants/app_colors.dart';
import 'app_text.dart';

class AppButton extends StatelessWidget {
  final String title;
  final Function()? onPressed;
  final Widget? icon;
  final double radius;
  final EdgeInsetsGeometry? padding;
  final EdgeInsetsGeometry? margin;
  final Color? backgroundColor;
  final Color? foregroundColor;
  final BorderSide? side;
  final double? width;
  final double? height;
  final double? separatorWidth;
  final double? fontSize;
  final String? fontFamily;
  final FontWeight? fontWeight;
  final TextDecoration? textDecoration;
  final Color? decorationColor;
  final bool isUnderline;
  final Color? disabledBackgroundColor;
  final bool isIconAfter;
  final bool wrapWithContainer;

  const AppButton({
    required this.title,
    required this.onPressed,
    this.icon,
    this.radius = 30,
    this.padding,
    this.margin,
    this.textDecoration,
    this.backgroundColor,
    this.decorationColor,
    this.isIconAfter = false,
    this.disabledBackgroundColor,
    this.foregroundColor,
    this.side,
    this.width,
    this.separatorWidth,
    this.height,
    this.isUnderline = false,
    this.fontSize,
    this.fontFamily,
    this.fontWeight,
    this.wrapWithContainer = false,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: wrapWithContainer ? EdgeInsets.symmetric(horizontal: 20.w, vertical: 12.h) : null,
      margin: margin,
      height: wrapWithContainer ? 80.h : height,
      width: width,
      decoration: !wrapWithContainer
          ? null
          : BoxDecoration(
              color: Colors.white,
              border: Border(top: BorderSide(color: AppColors.border.shade100.withOpacity(0.5))),
            ),
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: backgroundColor ?? AppColors.primary,
          foregroundColor: foregroundColor ?? Colors.white,
          padding: wrapWithContainer ? EdgeInsets.zero : padding ?? EdgeInsets.symmetric(vertical: 14.h),
          elevation: 0,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(radius.r)),
          tapTargetSize: MaterialTapTargetSize.shrinkWrap,
          disabledBackgroundColor: disabledBackgroundColor ?? Colors.grey.shade200,
          disabledForegroundColor: Colors.white,
          side: side,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          textDirection: isIconAfter ? TextDirection.rtl : TextDirection.ltr,
          children: [
            icon ?? Container(),
            SizedBox(width: icon == null ? 0 : (separatorWidth ?? 12).w),
            SizedBox(
              child: AppText(
                title,
                fontWeight: fontWeight ?? FontWeight.w500,
                fontSize: fontSize ?? 16.sp,
                decoration: textDecoration,
                decorationColor: decorationColor,
                isUnderline: isUnderline,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
