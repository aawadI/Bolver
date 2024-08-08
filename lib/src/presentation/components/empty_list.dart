import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../core/constants/constants.dart';
import '../../core/utils/utils.dart';
import '../theme/theme.dart';

class EmptyList extends StatelessWidget {
  final String text;

  const EmptyList({Key? key, required this.text}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final bool isDarkMode = LocalStorage.instance.getAppThemeMode();
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          width: 110.r,
          height: 110.r,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8.r),
            color: isDarkMode ? AppColors.mainBackDark : AppColors.mainBack,
          ),
          alignment: Alignment.center,
          child: Image.asset(
            AppAssets.pngNoViewedProducts,
            width: 77.r,
            height: 50.r,
            fit: BoxFit.cover,
          ),
        ),
        14.verticalSpace,
        Text(
          text,
          style: GoogleFonts.cairo(
            fontSize: 14.sp,
            fontWeight: FontWeight.w600,
            letterSpacing: -14 * 0.02,
            color: isDarkMode ? AppColors.white : AppColors.black,
          ),
        ),
      ],
    );
  }
}
