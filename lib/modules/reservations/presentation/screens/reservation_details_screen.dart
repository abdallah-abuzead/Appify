import 'package:appify/core/constants/app_colors.dart';
import 'package:appify/core/constants/assets/app_icons.dart';
import 'package:appify/core/utils/extensions/size_extensions.dart';
import 'package:appify/core/widgets/custom_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../core/widgets/app_text.dart';
import '../widgets/order_details_screen/order_details_item.dart';

class ReservationDetailsScreen extends StatelessWidget {
  const ReservationDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: 'الحجوزات', isBack: true, fontSize: 16.sp),
      body: Column(
        children: [
          Expanded(
            child: ListView(
              padding: EdgeInsets.all(16.r),
              children: [
                Row(
                  children: [
                    AppText('الاتجاهات', fontSize: 16.sp, fontWeight: FontWeight.w700),
                    Image.asset(AppIcons.directions, width: 32.w, height: 32.h),
                    const Spacer(),
                    AppText(
                      'طلب غير موكد',
                      fontSize: 12.sp,
                      fontWeight: FontWeight.w700,
                      color: AppColors.secondary,
                    ),
                  ],
                ),
                25.heightBox,
                const OrderDetailsItem(title: 'تاريخ الحجز', value: '02 يناير 2025 - 50 :09 م'),
                12.heightBox,
                Row(
                  children: [
                    AppText('السيارة', fontWeight: FontWeight.w500, color: AppColors.text.shade200),
                    const Spacer(),
                    Image.asset(AppIcons.toyota, width: 32.w, height: 32.h),
                    5.widthBox,
                    AppText('SUV -  123 - ABCD', fontWeight: FontWeight.w500, color: AppColors.text.shade300),
                  ],
                ),
                12.heightBox,
                const OrderDetailsItem(title: 'فئة الخدمة', value: 'صيانة'),
                6.heightBox,
                Divider(color: AppColors.border.shade100, height: 30.h),
                const AppText('الصيانات', fontWeight: FontWeight.w700),
                12.heightBox,
                const OrderDetailsItem(title: 'فلتر بنزين', value: 'SAR 50.00'),
                12.heightBox,
                const OrderDetailsItem(title: 'فلتر تكييف', value: 'SAR 50.00'),
                12.heightBox,
                const OrderDetailsItem(title: 'سير موتور', value: 'SAR 50.00'),
                12.heightBox,
                const OrderDetailsItem(title: 'ضريبة القيمة المضافة', value: 'SAR 50.00'),
                Divider(color: AppColors.border.shade100, height: 30.h),
                6.heightBox,
                const OrderDetailsItem(title: 'طريقة الدفع', value: 'كارت بنكى'),
                12.heightBox,
                const OrderDetailsItem(title: 'التاريخ', value: '02 يناير 2025 - 50 :09 م'),
                12.heightBox,
                Row(
                  children: [
                    AppText('رقم المعاملة', fontWeight: FontWeight.w500, color: AppColors.text.shade200),
                    const Spacer(),
                    AppText('TR2565HGJD', fontWeight: FontWeight.w500, color: AppColors.text.shade300),
                    5.widthBox,
                    SvgPicture.asset(AppIcons.copy),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
