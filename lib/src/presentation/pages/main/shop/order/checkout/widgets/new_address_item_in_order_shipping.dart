import 'package:flutter/material.dart';
import 'package:flutter_remix/flutter_remix.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../../../../core/utils/utils.dart';
import '../../../../../../../models/models.dart';
import '../../../../../../theme/theme.dart';

class NewAddressItemInOrderShipping extends StatelessWidget {
  final bool isSelected;
  final AddressData? address;
  final VoidCallback onTap;

  const NewAddressItemInOrderShipping({
    Key? key,
    required this.isSelected,
    required this.address,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final bool isDarkMode = LocalStorage.instance.getAppThemeMode();
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Material(
          borderRadius: BorderRadius.circular(8.r),
          color: isDarkMode
              ? AppColors.mainBackDark
              : AppColors.dontHaveAccBtnBack,
          child: InkWell(
            borderRadius: BorderRadius.circular(8.r),
            onTap: onTap,
            child: Container(
              height: 58.r,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8.r),
              ),
              alignment: Alignment.center,
              child: Padding(
                padding: REdgeInsets.symmetric(horizontal: 16),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: Row(
                        children: [
                          Icon(
                            FlutterRemix.map_pin_2_line,
                            color:
                                isDarkMode ? AppColors.white : AppColors.black,
                            size: 20.r,
                          ),
                          9.horizontalSpace,
                          Expanded(
                            child: Text(
                              '${address?.title}',
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                              style: GoogleFonts.cairo(
                                fontWeight: FontWeight.w500,
                                fontSize: 14.sp,
                                color: isDarkMode
                                    ? AppColors.white
                                    : AppColors.black,
                                letterSpacing: -14 * 0.03,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    if (isSelected)
                      Icon(
                        FlutterRemix.check_double_line,
                        color: isDarkMode ? AppColors.white : AppColors.black,
                        size: 22.r,
                      ),
                  ],
                ),
              ),
            ),
          ),
        ),
        8.verticalSpace,
      ],
    );
  }
}
