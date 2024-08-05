import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../constants/app_colors.dart';
import 'app_text.dart';

class AppDropDownMenu extends StatelessWidget {
  const AppDropDownMenu({
    super.key,
    required this.hint,
    this.dropDownValue,
    required this.onChanged,
    required this.items,
    this.textStyle,
    this.iconColor = Colors.black,
    this.validator,
  });

  final dynamic dropDownValue;
  final String hint;
  final Function(dynamic) onChanged;
  final TextStyle? textStyle;
  final List<DropdownMenuItem<Object>>? items;
  final Color iconColor;
  final String? Function(Object?)? validator;

  @override
  Widget build(BuildContext context) {
    return DropdownButtonHideUnderline(
      child: DropdownButtonFormField2(
        value: dropDownValue,
        validator: validator,
        isExpanded: true,
        iconStyleData: IconStyleData(iconEnabledColor: iconColor, iconDisabledColor: Colors.grey),
        hint: AppText(hint, fontSize: 13.sp, fontWeight: FontWeight.w400, color: AppColors.text.shade200),
        items: items,
        decoration: InputDecoration(
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(8.r)),
          filled: true,
          fillColor: Colors.white,
          floatingLabelBehavior: FloatingLabelBehavior.auto,
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.grey.withOpacity(0.2)),
            borderRadius: BorderRadius.circular(8.r),
          ),
          errorStyle: TextStyle(color: Colors.red, fontWeight: FontWeight.w500, fontSize: 8.sp),
          focusedBorder: OutlineInputBorder(
            borderSide: const BorderSide(color: AppColors.primary, width: 1.5),
            borderRadius: BorderRadius.circular(8.r),
          ),
          errorBorder: OutlineInputBorder(
            borderSide: const BorderSide(color: AppColors.error, width: 1.5),
            borderRadius: BorderRadius.circular(8.r),
          ),
          contentPadding: EdgeInsets.only(top: 12.h, bottom: 12.h, right: 10.w, left: 10.w),
        ),
        buttonStyleData: const ButtonStyleData(width: 0),
        dropdownStyleData: DropdownStyleData(
          offset: const Offset(0, -7),
          decoration: BoxDecoration(borderRadius: BorderRadius.circular(8.r)),
        ),
        onChanged: onChanged,
      ),
    );
  }
}
