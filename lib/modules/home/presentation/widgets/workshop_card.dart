import 'package:appify/core/app_router/app_router.dart';
import 'package:appify/core/constants/app_colors.dart';
import 'package:appify/core/constants/assets/app_icons.dart';
import 'package:appify/core/constants/assets/app_images.dart';
import 'package:appify/core/utils/extensions/size_extensions.dart';
import 'package:appify/core/widgets/app_button.dart';
import 'package:appify/core/widgets/app_text.dart';
import 'package:appify/core/widgets/rounded_cached_network_image.dart';
import 'package:appify/modules/home/data/models/workshop.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../reservations/presentation/screens/order_details_screen.dart';

class WorkshopCard extends StatelessWidget {
  final Workshop workshop;
  const WorkshopCard({super.key, required this.workshop});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16.r)),
      child: Padding(
        padding: EdgeInsets.all(12.r),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              children: [
                RoundedCachedNetworkImage(
                  imageUrl: workshop.logo,
                  placeholderImage: AppImages.defaultWorkshop,
                  width: 114,
                  height: 146,
                ),
                Positioned(
                  left: 7.w,
                  top: 7.h,
                  child: AppButton(
                    title: workshop.starRating.toString(),
                    fontSize: 12.sp,
                    icon: Icon(Icons.star_rate, color: Colors.amber.shade800, size: 15.sp),
                    separatorWidth: 3,
                    radius: 10,
                    height: 25.h,
                    width: 46.w,
                    backgroundColor: Colors.white,
                    foregroundColor: AppColors.text,
                    padding: EdgeInsets.symmetric(vertical: 5.h, horizontal: 5.w),
                    onPressed: () {},
                  ),
                ),
              ],
            ),
            10.widthBox,
            //============================================================================
            Expanded(
              child: Column(
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            AppButton(
                              title: workshop.services?.first.arName ?? 'غسيل السيارات',
                              fontSize: 12,
                              padding: EdgeInsets.symmetric(vertical: 5.h, horizontal: 5.w),
                              height: 30.h,
                              radius: 10,
                              backgroundColor: AppColors.border.shade50,
                              foregroundColor: AppColors.primary,
                              onPressed: () {},
                            ),
                            5.heightBox,
                            AppText(workshop.name ?? 'اوتو كار سيرفس',
                                fontSize: 16.sp, fontWeight: FontWeight.w700),
                          ],
                        ),
                      ),
                      Icon(Icons.bookmark, color: AppColors.primary, size: 24.sp),
                    ],
                  ),
                  //=========================================================================
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      SvgPicture.asset(AppIcons.time),
                      3.widthBox,
                      AppText(
                        '2 دقيقة',
                        fontWeight: FontWeight.w500,
                        color: AppColors.text.shade200,
                        fontSize: 12.sp,
                      ),
                      5.widthBox,
                      const Spacer(),
                      SvgPicture.asset(
                        AppIcons.pinMap,
                        colorFilter: const ColorFilter.mode(AppColors.primary, BlendMode.srcIn),
                      ),
                      5.widthBox,
                      AppText(
                        '20.9 كلم',
                        fontWeight: FontWeight.w500,
                        color: AppColors.text.shade200,
                        fontSize: 12.sp,
                      ),
                      SvgPicture.asset(AppIcons.distance, height: 45.h),
                    ],
                  ),
                  //=========================================================================
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      AppButton(
                        title: 'حجز',
                        icon: SvgPicture.asset(AppIcons.checkCircle),
                        height: 35.h,
                        width: 100.w,
                        padding: EdgeInsets.only(top: 5.h, bottom: 5.h, left: 15.w),
                        isIconAfter: true,
                        onPressed: () => AppRouter.to(OrderDetailsScreen(workshop: workshop)),
                      ),
                    ],
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
