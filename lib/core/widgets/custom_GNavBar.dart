import 'package:chef_app/core/utilis/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_nav_bar/google_nav_bar.dart';


//reusable component
class CustomGBottomNavComponent extends StatelessWidget {
  const CustomGBottomNavComponent({
    super.key, required this.currentIndex,required this.onChanged, required this.tabs,
  });

  final int currentIndex;
  final Function(int)? onChanged;
  final List<GButton> tabs;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:EdgeInsets.symmetric(horizontal: 24.w,vertical: 16.h),
      child: GNav(
          activeColor: AppColors.primary,
          selectedIndex: currentIndex,
          gap: 8,
          tabBackgroundColor: AppColors.black12,
          tabBorderRadius: 16,
          padding:const EdgeInsets.all(16),
          onTabChange:onChanged,
          tabs: tabs
      ),
    );
  }
}