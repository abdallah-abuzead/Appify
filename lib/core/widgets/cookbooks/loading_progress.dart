import 'dart:io' show Platform;

import 'package:appify/core/utils/extensions/size_extensions.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../constants/app_colors.dart';

class LoadingProgress extends StatelessWidget {
  const LoadingProgress({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Center(
        child: Platform.isAndroid
            ? const CircularProgressIndicator(valueColor: AlwaysStoppedAnimation<Color>(AppColors.primary))
            : CupertinoActivityIndicator(radius: 20.r, color: AppColors.primary),
      ),
    );
  }
}
