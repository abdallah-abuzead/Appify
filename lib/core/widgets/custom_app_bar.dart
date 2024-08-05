import 'package:appify/core/constants/app_colors.dart';
import 'package:appify/core/utils/extensions/size_extensions.dart';
import 'package:flutter/material.dart';

import '../app_router/app_router.dart';
import 'app_text.dart';

class CustomAppBar extends StatefulWidget implements PreferredSizeWidget {
  const CustomAppBar({
    super.key,
    required this.title,
    this.isBack = false,
    this.actions,
    this.isCenter = true,
    this.fontSize = 18,
  });

  final String title;
  final bool isBack;
  final bool isCenter;
  final double fontSize;
  final List<Widget>? actions;

  @override
  CustomAppBarState createState() => CustomAppBarState();

  @override
  Size get preferredSize => Size.fromHeight(85.h);
}

class CustomAppBarState extends State<CustomAppBar> {
  @override
  Widget build(BuildContext context) {
    return AppBar(
      toolbarHeight: 85.h,
      titleSpacing: 0.w,
      leadingWidth: (widget.isBack ? 45 : 30).w,
      title: InkWell(
        onTap: !widget.isBack || widget.isCenter ? null : () => AppRouter.back(),
        child: AppText(widget.title, fontSize: widget.fontSize.sp, fontWeight: FontWeight.w600),
      ),
      centerTitle: widget.isCenter,
      leading: !widget.isBack
          ? Container()
          : InkWell(
              onTap: () => AppRouter.back(),
              child: Container(
                margin: EdgeInsets.symmetric(horizontal: 8.w),
                width: 32.w,
                height: 32.h,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(color: AppColors.border.shade100),
                ),
                child: Icon(Icons.arrow_back, size: 16.sp, color: AppColors.text.shade300),
              ),
            ),
      actions: widget.actions,
      backgroundColor: Colors.white,
      scrolledUnderElevation: 0,
    );
  }
}
