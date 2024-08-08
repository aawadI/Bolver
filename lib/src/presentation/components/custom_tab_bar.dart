import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../theme/theme.dart';

class CustomTabBar extends StatelessWidget {
  final bool isScrollable;
  final TabController tabController;
  final List<Tab> tabs;

  const CustomTabBar(
      {Key? key,
      required this.tabController,
      required this.tabs,
      this.isScrollable = false})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(8.r),
      height: 56.h,
      decoration: BoxDecoration(
          color: AppColors.mainBack,
          borderRadius: BorderRadius.circular(10.r),
          border: Border.all(color: AppColors.white)),
      child: TabBar(
        padding: EdgeInsets.zero,
          isScrollable: isScrollable,
          controller: tabController,
          indicator: BoxDecoration(
              borderRadius: BorderRadius.circular(10.r), color: AppColors.black),
          labelColor: AppColors.white,
          unselectedLabelColor: AppColors.black,

          tabs: tabs),
    );
  }
}
