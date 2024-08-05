import 'package:appify/core/constants/app_colors.dart';
import 'package:appify/core/constants/assets/app_icons.dart';
import 'package:appify/core/utils/extensions/size_extensions.dart';
import 'package:appify/core/widgets/app_text.dart';
import 'package:appify/core/widgets/custom_app_bar.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../core/widgets/cookbooks/loading_widget.dart';
import '../../../../core/widgets/errors/empty_widget.dart';
import '../../../../core/widgets/errors/offline_widget.dart';
import '../../../../core/widgets/errors/server_error_widget.dart';
import '../../../../core/widgets/errors/unauthorized_widget.dart';
import '../../data/models/service.dart';
import '../cubits/workshops/workshops_cubit.dart';
import '../widgets/workshop_card.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<Service> selectedItems = [];
  @override
  Widget build(BuildContext context) {
    WorkshopsCubit workshopsCubit = WorkshopsCubit.of(context);
    return RefreshIndicator(
      onRefresh: () async => WorkshopsCubit.of(context).getAllWorkshops(),
      child: Scaffold(
        appBar: const CustomAppBar(title: 'قائمة بمراكز الصيانة', isCenter: true),
        body: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.0.h),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 5.w),
                child: AppText('حدد موقعك', fontSize: 16.sp),
              ),
              5.heightBox,
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SvgPicture.asset(AppIcons.pinMap),
                  3.widthBox,
                  AppText('الرياض , شارع العليا', fontSize: 16.sp, color: AppColors.text.shade300),
                  Icon(Icons.keyboard_arrow_down, color: AppColors.secondary, size: 25.sp),
                ],
              ),
              20.heightBox,
              //=============================================================================
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8.r),
                  border: Border.all(color: AppColors.border),
                ),
                child: DropdownButtonHideUnderline(
                  child: DropdownButton2<Service>(
                    isExpanded: true,
                    hint: AppText('اختر الخدمات', color: AppColors.text.shade200),
                    items: services.map((service) {
                      return DropdownMenuItem(
                        value: service,
                        enabled: false,
                        child: StatefulBuilder(
                          builder: (context, menuSetState) {
                            final isSelected = selectedItems.contains(service);
                            return InkWell(
                              onTap: () {
                                isSelected ? selectedItems.remove(service) : selectedItems.add(service);
                                setState(() {});
                                menuSetState(() {});
                              },
                              child: Container(
                                padding: EdgeInsets.only(left: 4.w, right: 16.w, top: 16.h, bottom: 16.h),
                                margin: EdgeInsets.symmetric(vertical: 6.h, horizontal: 12.w),
                                decoration: BoxDecoration(
                                  border: Border(
                                    left: BorderSide(color: AppColors.border.shade100),
                                    top: BorderSide(color: AppColors.border.shade100),
                                    bottom: BorderSide(color: AppColors.border.shade100),
                                  ),
                                  borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(8.r),
                                    bottomLeft: Radius.circular(8.r),
                                  ),
                                ),
                                child: Row(
                                  children: [
                                    SvgPicture.asset(service.icon),
                                    25.widthBox,
                                    AppText(service.name, fontSize: 16.sp, fontWeight: FontWeight.w700),
                                    const Spacer(),
                                    AppText(
                                      service.price,
                                      fontWeight: FontWeight.w500,
                                      color: AppColors.text.shade300,
                                    ),
                                    Checkbox(
                                      fillColor: WidgetStateProperty.resolveWith((states) {
                                        if (!states.contains(WidgetState.selected)) {
                                          return AppColors.text.shade100.withOpacity(0.7);
                                        }
                                        return null;
                                      }),
                                      checkColor: Colors.white,
                                      activeColor: AppColors.primary,
                                      side: const BorderSide(color: Colors.transparent),
                                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4.r)),
                                      value: isSelected,
                                      onChanged: (value) {
                                        isSelected ? selectedItems.remove(service) : selectedItems.add(service);
                                        setState(() {});
                                        menuSetState(() {});
                                      },
                                    ),
                                  ],
                                ),
                              ),
                            );
                          },
                        ),
                      );
                    }).toList(),
                    value: selectedItems.isEmpty ? null : selectedItems.last,
                    onChanged: (value) {},
                    selectedItemBuilder: (context) {
                      return services.map(
                        (service) {
                          return Container(
                            alignment: AlignmentDirectional.centerStart,
                            child: AppText(
                              selectedItems.map((item) => item.name).toList().join(' - '),
                              overflow: TextOverflow.ellipsis,
                              maxLines: 1,
                            ),
                          );
                        },
                      ).toList();
                    },
                    buttonStyleData: ButtonStyleData(height: 40, padding: EdgeInsets.only(left: 8.w, right: 16.w)),
                    menuItemStyleData: MenuItemStyleData(height: 70.h, padding: EdgeInsets.zero),
                  ),
                ),
              ),
              25.heightBox,
              //=========================================================================
              AppText('مقدمى الخدمات', fontSize: 16.sp, fontWeight: FontWeight.w700),
              10.heightBox,
              //=========================================================================
              Expanded(
                child: BlocBuilder<WorkshopsCubit, WorkshopsState>(
                  builder: (context, state) {
                    if (state is SuccessGetAllWorkshopsState) {
                      return state.workshops.isEmpty
                          ? EmptyWidget(name: 'workshops', onPressed: () => workshopsCubit.getAllWorkshops())
                          : ListView.separated(
                              itemCount: state.workshops.length,
                              separatorBuilder: (context, i) => 12.widthBox,
                              itemBuilder: (context, i) => WorkshopCard(workshop: state.workshops[i]),
                            );
                    } else if (state is OfflineWorkshopsState) {
                      return OfflineWidget(onPressed: () => workshopsCubit.getAllWorkshops());
                    } else if (state is UnauthorizedWorkshopsState) {
                      return const UnauthorizedWidget();
                    } else if (state is FailedGetAllWorkshopsState) {
                      return ServerErrorWidget(
                        onPressed: () => workshopsCubit.getAllWorkshops(),
                        message: state.message,
                      );
                    } else {
                      return const LoadingWidget();
                    }
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
