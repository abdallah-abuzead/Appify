import 'package:appify/core/app_router/app_router.dart';
import 'package:appify/core/constants/app_colors.dart';
import 'package:appify/core/constants/assets/app_icons.dart';
import 'package:appify/core/constants/assets/app_images.dart';
import 'package:appify/core/utils/app_date_utils.dart';
import 'package:appify/core/utils/extensions/size_extensions.dart';
import 'package:appify/core/widgets/app_button.dart';
import 'package:appify/core/widgets/app_text.dart';
import 'package:appify/core/widgets/rounded_cached_network_image.dart';
import 'package:appify/modules/reservations/presentation/widgets/reservations_screen/reservation_card_details_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../data/models/reservation.dart';
import '../../screens/reservation_details_screen.dart';

class ReservationCard extends StatelessWidget {
  final Reservation reservation;
  const ReservationCard({super.key, required this.reservation});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => AppRouter.to(const ReservationDetailsScreen()),
      child: Card(
        elevation: 6,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16.r)),
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.all(12.r),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Row(
                    children: [
                      AppButton(
                        title: 'طلب غير موكد',
                        fontSize: 12,
                        padding: EdgeInsets.symmetric(vertical: 5.h, horizontal: 5.w),
                        height: 30.h,
                        width: 135.w,
                        radius: 8,
                        backgroundColor: AppColors.background.shade200,
                        foregroundColor: AppColors.secondary,
                        onPressed: () {},
                      ),
                      const Spacer(),
                      Container(
                        width: 32.w,
                        height: 32.h,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          border: Border.all(color: AppColors.border.shade100),
                        ),
                        child: Icon(Icons.bookmark_border, size: 19.sp, color: AppColors.text.shade300),
                      ),
                      8.widthBox,
                      Container(
                        padding: EdgeInsets.symmetric(horizontal: 4.w),
                        width: 32.w,
                        height: 32.h,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          border: Border.all(color: AppColors.border.shade100),
                        ),
                        child: SvgPicture.asset(AppIcons.share),
                      ),
                    ],
                  ),
                  12.heightBox,
                  //========================================================================
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      RoundedCachedNetworkImage(
                        imageUrl: reservation.services?.first.serviceImage,
                        placeholderImage: AppImages.defaultCarOrder,
                        width: 114,
                        height: 119,
                      ),
                      10.widthBox,
                      //============================================================================
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            AppButton(
                              title: reservation.services?.first.arName ?? 'غسيل السيارات',
                              fontSize: 12,
                              padding: EdgeInsets.symmetric(vertical: 5.h, horizontal: 20.w),
                              height: 30.h,
                              // width: 133.w,
                              radius: 10,
                              backgroundColor: AppColors.text.shade100,
                              foregroundColor: AppColors.primary,
                              onPressed: () {},
                            ),
                            10.heightBox,
                            AppText(reservation.workshop?.name ?? 'اوتو كار سيرفس',
                                fontSize: 16.sp, fontWeight: FontWeight.w700),
                          ],
                        ),
                      ),
                    ],
                  ),
                  10.heightBox,
                  //========================================================================
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      ReservationCardDetailsItem(
                        title: 'المبلغ الكلى',
                        value: 'SAR ${reservation.services?.first.pivot?.price ?? 0}',
                      ),
                      ReservationCardDetailsItem(
                        title: 'تاريخ الحجز',
                        value: AppDateUtils.getEventFormattedDateFromISOFormat(reservation.createdAt ?? ''),
                      ),
                      const ReservationCardDetailsItem(title: 'رقم التعريفى', value: '#cRR0211AA3'),
                    ],
                  ),
                ],
              ),
            ),
            //========================================================================
            Divider(color: AppColors.border.shade100, height: 20.h),
            5.heightBox,
            AppButton(
              title: 'الغاء',
              padding: EdgeInsets.symmetric(vertical: 8.h, horizontal: 5.w),
              height: 36.h,
              width: 150.w,
              radius: 24,
              backgroundColor: AppColors.text.shade50,
              foregroundColor: AppColors.text,
              onPressed: () {},
            ),
            16.heightBox,
          ],
        ),
      ),
    );
  }
}
