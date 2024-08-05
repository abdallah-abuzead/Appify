import 'package:appify/core/constants/app_colors.dart';
import 'package:appify/core/utils/extensions/size_extensions.dart';
import 'package:appify/core/widgets/app_text.dart';
import 'package:appify/core/widgets/custom_app_bar.dart';
import 'package:flutter/material.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(title: 'الاعدادات'),
      body: Center(
        child: AppText('قريباً', fontSize: 25.sp, fontWeight: FontWeight.bold, color: AppColors.primary),
      ),
    );
  }
}
