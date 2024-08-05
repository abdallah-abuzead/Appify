import 'package:appify/core/app_router/app_router.dart';
import 'package:appify/core/constants/app_colors.dart';
import 'package:appify/core/screens/bottom_nav_screen.dart';
import 'package:appify/core/utils/app_functions.dart';
import 'package:appify/core/utils/extensions/size_extensions.dart';
import 'package:appify/core/widgets/app_button.dart';
import 'package:appify/core/widgets/cookbooks/toast.dart';
import 'package:appify/core/widgets/custom_app_bar.dart';
import 'package:appify/modules/home/data/models/workshop.dart';
import 'package:appify/modules/reservations/presentation/cubits/reservations_actions/reservations_actions_cubit.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

import '../../../../core/constants/assets/app_images.dart';
import '../../../../core/widgets/app_text.dart';
import '../../../../core/widgets/rounded_cached_network_image.dart';
import '../widgets/order_details_screen/order_details_item.dart';

class OrderDetailsScreen extends StatelessWidget {
  final Workshop workshop;

  const OrderDetailsScreen({super.key, required this.workshop});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: 'ملخص الطلب', isBack: true, fontSize: 16.sp),
      body: BlocConsumer<ReservationsActionsCubit, ReservationsActionsState>(
        listener: (context, state) {
          if (state is SuccessCreateReservationState) {
            showToast(message: state.message, isSuccess: true);
            AppRouter.offAll(const BottomNavScreen(initialIndex: 1));
          } else if (state is ValidationReservationsActionsState) {
            showToast(message: getErrorText('message', state.errors) ?? 'Error!');
          } else if (state is FailedCreateReservationState) {
            showToast(message: state.message);
          }
        },
        builder: (context, state) {
          return ModalProgressHUD(
            inAsyncCall: state is LoadingReservationsActionsState,
            child: Column(
              children: [
                Expanded(
                  child: ListView(
                    padding: EdgeInsets.all(16.r),
                    children: [
                      Row(
                        children: [
                          const RoundedCachedNetworkImage(
                            imageUrl: null,
                            placeholderImage: AppImages.defaultCarOrder,
                            width: 114,
                            height: 119,
                          ),
                          20.widthBox,
                          Expanded(
                            child: AppText(
                              workshop.name ?? 'اوتو كار سيرفس',
                              fontSize: 16.sp,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                        ],
                      ),
                      //==========================================================================
                      30.heightBox,
                      OrderDetailsItem(
                        title: 'تاريخ الحجز',
                        value: DateFormat('dd MMM yyyy - hh:mm a', 'ar').format(DateTime.now()),
                        // value: '02 يناير 2025 - 50 :09 م',
                      ),
                      12.heightBox,
                      const OrderDetailsItem(title: 'السيارة', value: 'SUV -  123 - ABCD'),
                      12.heightBox,
                      const OrderDetailsItem(title: 'فئة الخدمة', value: 'صيانة'),
                      6.heightBox,
                      Divider(color: AppColors.border.shade100, height: 30.h),
                      const AppText('العناية بالسيارة', fontWeight: FontWeight.w700),
                      12.heightBox,
                      OrderDetailsItem(
                        title: workshop.services?.first.arName ?? 'صيانة',
                        value: 'SAR ${workshop.services?.first.workshopPivot?.price ?? 0}',
                      ),
                      12.heightBox,
                      const OrderDetailsItem(title: 'غسيل داخلى', value: 'SAR 0.00'),
                      12.heightBox,
                      const OrderDetailsItem(title: 'غسيل خارجى', value: 'SAR 0.00'),

                      12.heightBox,
                      const OrderDetailsItem(title: 'تلميع', value: 'SAR 0.00'),
                      Divider(color: AppColors.border.shade100, height: 30.h),
                      6.heightBox,
                      OrderDetailsItem(
                        title: 'المجموع',
                        value: 'SAR ${workshop.services?.first.workshopPivot?.price ?? 0}',
                      ),
                    ],
                  ),
                ),
                //==========================================================================
                Container(
                  height: 160.h,
                  padding: EdgeInsets.all(16.r),
                  decoration: BoxDecoration(
                    border: Border(top: BorderSide(color: AppColors.border.shade50)),
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.5),
                        spreadRadius: 5,
                        blurRadius: 7,
                        offset: const Offset(0, 3), // changes position of shadow
                      ),
                    ],
                  ),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Expanded(
                        child: AppButton(
                          padding: EdgeInsets.symmetric(vertical: 12.h),
                          title: 'دفع الكترونى',
                          height: 45.h,
                          backgroundColor: AppColors.text.shade50,
                          foregroundColor: AppColors.text,
                          onPressed: () {},
                        ),
                      ),
                      40.widthBox,
                      Expanded(
                        child: AppButton(
                          padding: EdgeInsets.symmetric(vertical: 12.h),
                          title: 'دفع كاش',
                          height: 45.h,
                          onPressed: () {
                            ReservationsActionsCubit.of(context).reserve(workshop: workshop);
                          },
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
