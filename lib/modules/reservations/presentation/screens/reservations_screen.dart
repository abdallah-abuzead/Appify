import 'package:appify/core/constants/app_colors.dart';
import 'package:appify/core/constants/assets/app_icons.dart';
import 'package:appify/core/utils/extensions/size_extensions.dart';
import 'package:appify/core/widgets/app_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../core/widgets/custom_app_bar.dart';
import '../widgets/reservations_screen/pending_tab.dart';

class ReservationsScreen extends StatelessWidget {
  const ReservationsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: 'الحجوزات',
        actions: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 12.w),
            child: SvgPicture.asset(AppIcons.search),
          )
        ],
      ),
      body: DefaultTabController(
        length: 3,
        child: Column(
          children: [
            SizedBox(
              height: 52.h,
              child: AppBar(
                elevation: 0,
                bottom: TabBar(
                  labelStyle: TextStyle(
                    fontWeight: FontWeight.w700,
                    fontSize: 16.sp,
                    fontFamily: AppFontFamilies.tajawal,
                  ),
                  unselectedLabelStyle: TextStyle(
                    fontSize: 14.sp,
                    color: AppColors.text.shade200,
                    fontFamily: AppFontFamilies.tajawal,
                  ),
                  labelColor: AppColors.primary,
                  unselectedLabelColor: AppColors.text.shade200,
                  indicatorColor: AppColors.primary,
                  indicatorWeight: 4.h,
                  indicatorPadding: EdgeInsets.symmetric(horizontal: 10.w),
                  indicatorSize: TabBarIndicatorSize.tab,
                  dividerColor: AppColors.text.shade100,
                  tabs: const [Tab(text: 'غير مؤكد'), Tab(text: 'السابقة'), Tab(text: 'الحالية')],
                ),
              ),
            ),
            20.heightBox,
            Expanded(
              child: TabBarView(
                children: [
                  const PendingTab(),
                  Center(
                    child:
                        AppText('قريباً', fontSize: 25.sp, fontWeight: FontWeight.bold, color: AppColors.primary),
                  ),
                  Center(
                    child:
                        AppText('قريباً', fontSize: 25.sp, fontWeight: FontWeight.bold, color: AppColors.primary),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
