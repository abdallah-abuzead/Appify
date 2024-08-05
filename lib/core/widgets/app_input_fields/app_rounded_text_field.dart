import 'package:appify/core/utils/extensions/size_extensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../constants/app_colors.dart';
import '../../utils/app_functions.dart';

class AppRoundedTextField extends StatelessWidget {
  final TextEditingController? controller;
  final String? Function(String?)? validator;
  final void Function(String)? onChanged;
  final void Function(String?)? onSaved;
  final void Function()? onTap;
  final TextInputType? keyboardType;
  final TextInputAction action;
  final String hint;
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final bool isPassword;
  final bool readOnly;
  final bool autoFocus;
  final Color fillColor;
  final Color? enabledBorderColor;
  final String? keyError;
  final Map<String, dynamic>? errors;
  final List<TextInputFormatter>? inputFormatters;
  final int? minLines;
  final int? maxLines;
  final double radius;
  final double suffixIconMaxWidth;
  final bool filled;
  final EdgeInsetsGeometry? contentPadding;
  final FocusNode? focusNode;

  const AppRoundedTextField({
    super.key,
    this.controller,
    this.keyboardType,
    required this.hint,
    this.prefixIcon,
    this.suffixIcon,
    this.action = TextInputAction.next,
    this.isPassword = false,
    this.readOnly = false,
    this.autoFocus = false,
    this.fillColor = Colors.white,
    this.enabledBorderColor,
    this.validator,
    this.onChanged,
    this.onSaved,
    this.keyError,
    this.inputFormatters,
    this.errors,
    this.minLines,
    this.maxLines = 1,
    this.radius = 8,
    this.suffixIconMaxWidth = 35,
    this.filled = true,
    this.contentPadding,
    this.onTap,
    this.focusNode,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      validator: validator,
      onChanged: onChanged,
      onSaved: onSaved,
      onTap: onTap,
      keyboardType: keyboardType,
      textInputAction: action,
      obscureText: isPassword,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      cursorColor: AppColors.text,
      style: TextStyle(color: AppColors.text.withOpacity(0.8), fontSize: 15.sp),
      readOnly: readOnly,
      autofocus: autoFocus,
      inputFormatters: inputFormatters,
      minLines: minLines,
      maxLines: maxLines,
      focusNode: focusNode,
      decoration: InputDecoration(
        isDense: true,
        hintText: hint,
        filled: filled,
        fillColor: fillColor,
        hintStyle: TextStyle(color: AppColors.text.shade200, fontSize: 14.sp, fontWeight: FontWeight.w500),
        contentPadding: contentPadding ?? EdgeInsets.symmetric(horizontal: 10.w, vertical: 14.h),
        prefixIcon: prefixIcon,
        suffixIcon: suffixIcon,
        suffixIconConstraints: BoxConstraints(maxWidth: suffixIconMaxWidth.w),
        errorText: keyError != null ? getErrorText(keyError!, errors) : null,
        errorStyle: TextStyle(color: Colors.red, fontWeight: FontWeight.w500, fontSize: 10.sp),
        errorMaxLines: 2,
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: AppColors.primary, width: 1.5.w),
          borderRadius: BorderRadius.circular(radius.r),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: enabledBorderColor ?? AppColors.border.shade100),
          borderRadius: BorderRadius.circular(radius.r),
        ),
        border: OutlineInputBorder(
          borderSide: const BorderSide(color: Colors.white),
          borderRadius: BorderRadius.circular(radius.r),
        ),
        errorBorder: OutlineInputBorder(
          borderSide: BorderSide(color: AppColors.error, width: 1.5.w),
          borderRadius: BorderRadius.circular(radius.r),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderSide: BorderSide(color: AppColors.error, width: 1.5.w),
          borderRadius: BorderRadius.circular(radius.r),
        ),
      ),
    );
  }
}
