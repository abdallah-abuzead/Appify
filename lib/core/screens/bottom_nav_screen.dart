import 'package:appify/core/utils/extensions/size_extensions.dart';
import 'package:appify/modules/home/presentation/screens/home_screen.dart';
import 'package:appify/modules/reservations/presentation/screens/reservations_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:persistent_bottom_nav_bar_v2/persistent-tab-view.dart';

import '../../modules/settings/presentation/screens/settings_screen.dart';
import '../constants/app_colors.dart';
import '../constants/assets/app_icons.dart';

class BottomNavScreen extends StatefulWidget {
  final int initialIndex;
  final int secondaryIndex;

  const BottomNavScreen({
    this.initialIndex = 0,
    this.secondaryIndex = 0,
    super.key,
  });

  @override
  State<BottomNavScreen> createState() => _BottomNavScreenState();
}

class _BottomNavScreenState extends State<BottomNavScreen> {
  late final PersistentTabController navBarController;
  late int _selectedIndex;

  @override
  void initState() {
    super.initState();
    navBarController = PersistentTabController(initialIndex: widget.initialIndex);
    _selectedIndex = widget.initialIndex;
  }

  List<Widget> _buildScreens() {
    return [
      const HomeScreen(),
      const ReservationsScreen(),
      const SettingsScreen(),
    ];
  }

  List<PersistentBottomNavBarItem> _navBarItems() {
    return [
      _navBarItem(title: "الرئيسية", icon: AppIcons.home, isSelected: _selectedIndex == 0),
      _navBarItem(title: "الحجوزات", icon: AppIcons.reservations, isSelected: _selectedIndex == 1),
      _navBarItem(title: "الاعدادات", icon: AppIcons.settings, isSelected: _selectedIndex == 2),
    ];
  }

  PersistentBottomNavBarItem _navBarItem({
    required String title,
    required String icon,
    required bool isSelected,
  }) {
    return PersistentBottomNavBarItem(
      icon: SvgPicture.asset(
        icon,
        colorFilter: ColorFilter.mode(
          isSelected ? AppColors.primary : AppColors.text.shade200,
          BlendMode.srcIn,
        ),
      ),
      title: title,
      textStyle: TextStyle(fontWeight: isSelected ? FontWeight.w500 : FontWeight.w400, fontSize: 11.sp),
      activeColorPrimary: AppColors.primary,
      inactiveColorPrimary: AppColors.text..shade200,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PersistentTabView(
        context,
        controller: navBarController,
        navBarStyle: NavBarStyle.simple,
        navBarHeight: 64.h,
        padding: const NavBarPadding.all(0),
        decoration: NavBarDecoration(
          boxShadow: [
            BoxShadow(
              color: Colors.grey.shade300,
              spreadRadius: 1.9.r,
              blurRadius: 6.9.r,
              offset: const Offset(0, -1),
            )
          ],
        ),
        screens: _buildScreens(),
        items: _navBarItems(),
        onItemSelected: (value) => onItemSelected(value),
        confineInSafeArea: true,
        popAllScreensOnTapOfSelectedTab: true,
        popActionScreens: PopActionScreensType.all,
        itemAnimationProperties: const ItemAnimationProperties(
          duration: Duration(milliseconds: 400),
          curve: Curves.ease,
        ),
        screenTransitionAnimation: const ScreenTransitionAnimation(
          animateTabTransition: true,
          curve: Curves.ease,
          duration: Duration(milliseconds: 400),
        ),
      ),
    );
  }

  void onItemSelected(int value) => setState(() => _selectedIndex = value);
}
