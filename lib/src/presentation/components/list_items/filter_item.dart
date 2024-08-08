import 'package:flutter/material.dart';
import 'package:flutter_remix/flutter_remix.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../core/utils/utils.dart';
import '../../theme/theme.dart';

class FilterItem extends StatelessWidget {
  final bool isSelected;
  final String title;
  final VoidCallback onTap;

  const FilterItem({
    Key? key,
    required this.isSelected,
    required this.title,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final bool isDarkMode = LocalStorage.instance.getAppThemeMode();
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        InkWell(
          onTap: onTap,
          child: Container(
            height: 56.r,
            alignment: Alignment.center,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    isSelected
                        ? Container(
                            width: 18.r,
                            height: 18.r,
                            decoration: BoxDecoration(
                              color: AppColors.accentGreen,
                              borderRadius: BorderRadius.circular(9.r),
                            ),
                            alignment: Alignment.center,
                            child: Icon(
                              FlutterRemix.check_line,
                              color: AppColors.white,
                              size: 15.r,
                            ),
                          )
                        : Container(
                            width: 18.r,
                            height: 18.r,
                            decoration: BoxDecoration(
                              color: AppColors.transparent,
                              borderRadius: BorderRadius.circular(9.r),
                              border: Border.all(
                                width: 2.r,
                                color: isDarkMode
                                    ? AppColors.white
                                    : AppColors.selectedItemsText,
                              ),
                            ),
                          ),
                    10.horizontalSpace,
                    Text(
                      title,
                      style: GoogleFonts.cairo(
                        fontWeight: FontWeight.w500,
                        fontSize: 14.sp,
                        color: isDarkMode ? AppColors.white : AppColors.black,
                        letterSpacing: -0.7,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
        Divider(
          thickness: 1.r,
          height: 1.r,
          color: isDarkMode
              ? AppColors.white.withOpacity(0.06)
              : AppColors.newStoreDataBorder.withOpacity(0.5),
        )
      ],
    );
  }
}
