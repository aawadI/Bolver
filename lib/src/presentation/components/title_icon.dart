import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:g_customer/src/presentation/theme/app_colors.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../core/utils/local_storage.dart';

class TitleAndIcon extends StatelessWidget {
  final String title;
  final double titleSize;
  final String? rightTitle;
  final bool isIcon;
  final Color rightTitleColor;
  final VoidCallback? onRightTap;

  const TitleAndIcon({
    Key? key,
    this.isIcon = false,
    required this.title,
    this.rightTitle,
    this.rightTitleColor = AppColors.black,
    this.onRightTap,
    this.titleSize = 20,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final bool isLtr = LocalStorage.instance.getLangLtr();
    return Directionality(
      textDirection: isLtr ? TextDirection.ltr : TextDirection.rtl,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: Text(
              title,
              style: GoogleFonts.cairo(fontSize: 18.sp, color: AppColors.black),
            ),
          ),
          GestureDetector(
            onTap: onRightTap ?? () {},
            child: Row(
              children: [
                Text(
                  rightTitle ?? '',
                  style: GoogleFonts.cairo(
                    fontSize: 14.sp,
                    color: rightTitleColor,
                  ),
                ),
                isIcon
                    ? Icon(
                        isLtr
                            ? Icons.keyboard_arrow_right
                            : Icons.keyboard_arrow_left,
                      )
                    : const SizedBox.shrink()
              ],
            ),
          ),
        ],
      ),
    );
  }
}
