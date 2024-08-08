import 'package:flutter/material.dart';
import 'package:flutter_remix/flutter_remix.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../../../core/constants/constants.dart';
import '../../../../../../core/utils/utils.dart';
import '../../../../../../models/models.dart';
import '../../../../../components/components.dart';
import '../../../../../theme/theme.dart';

class NewAddressItem extends StatelessWidget {
  final AddressData? address;
  final int? length;
  final VoidCallback onDelete;
  final VoidCallback onEdit;
  final VoidCallback onTap;

  const NewAddressItem({
    Key? key,
    required this.address,
    required this.onDelete,
    required this.onEdit,
    required this.onTap,
    this.length,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final bool isDarkMode = LocalStorage.instance.getAppThemeMode();
    return ButtonsBouncingEffect(
      child: GestureDetector(
        onTap: onTap,
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8.r),
            border: Border.all(
              color: (address?.active ?? false)
                  ? AppColors.accentGreen
                  : isDarkMode
                      ? AppColors.borderDark
                      : AppColors.borderColor,
              width: 1.r,
            ),
          ),
          margin: REdgeInsets.only(bottom: 11),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              16.verticalSpace,
              Padding(
                padding: REdgeInsets.symmetric(horizontal: 14),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                          child: Row(
                            children: [
                              Container(
                                width: 40.r,
                                height: 40.r,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20.r),
                                  color: (address?.active ?? false)
                                      ? AppColors.accentGreen
                                      : (isDarkMode
                                          ? AppColors.mainBackDark
                                          : AppColors.divider),
                                ),
                                alignment: Alignment.center,
                                child: Icon(
                                  FlutterRemix.map_pin_line,
                                  color: (address?.active ?? false)
                                      ? AppColors.white
                                      : AppColors.black,
                                  size: 22.r,
                                ),
                              ),
                              12.horizontalSpace,
                              Expanded(
                                child: Text(
                                  '${address?.title}',
                                  maxLines: 2,
                                  overflow: TextOverflow.ellipsis,
                                  style: GoogleFonts.cairo(
                                    fontWeight: FontWeight.w600,
                                    fontSize: 15.sp,
                                    color: isDarkMode
                                        ? AppColors.white
                                        : AppColors.black,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        if ((length ?? 0) > 1)
                          GestureDetector(
                            child: Icon(
                              FlutterRemix.more_2_line,
                              size: 22.r,
                              color: isDarkMode
                                  ? AppColors.white
                                  : AppColors.black,
                            ),
                            onTapDown: (TapDownDetails details) {
                              final left = details.globalPosition.dx;
                              final right = details.globalPosition.dy;
                              showMenu(
                                context: context,
                                color: isDarkMode
                                    ? AppColors.mainBackDark
                                    : AppColors.white,
                                position: RelativeRect.fromLTRB(
                                  left.r,
                                  right.r + 20.r,
                                  20.r,
                                  0,
                                ),
                                items: [
                                  PopupMenuItem(
                                    height: 25.r,
                                    textStyle: GoogleFonts.cairo(
                                      fontWeight: FontWeight.w500,
                                      fontSize: 13.sp,
                                      color: isDarkMode
                                          ? AppColors.white
                                          : AppColors.black,
                                      letterSpacing: -0.2,
                                    ),
                                    onTap: onEdit,
                                    child: Padding(
                                      padding:
                                          REdgeInsets.symmetric(vertical: 10),
                                      child: Text(
                                        AppHelpers.getTranslation(TrKeys.edit),
                                      ),
                                    ),
                                  ),
                                  PopupMenuItem(
                                    height: 25.r,
                                    textStyle: GoogleFonts.cairo(
                                      fontWeight: FontWeight.w500,
                                      fontSize: 13.sp,
                                      color: isDarkMode
                                          ? AppColors.white
                                          : AppColors.black,
                                      letterSpacing: -0.2,
                                    ),
                                    onTap: onDelete,
                                    child: Padding(
                                      padding:
                                          REdgeInsets.symmetric(vertical: 10),
                                      child: Text(
                                        AppHelpers.getTranslation(
                                            TrKeys.delete),
                                      ),
                                    ),
                                  ),
                                ],
                              );
                            },
                          ),
                      ],
                    ),
                    12.verticalSpace,
                    Text(address?.address ?? "",
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        style: GoogleFonts.cairo(
                          fontWeight: FontWeight.w600,
                          fontSize: 14.sp,
                          color: isDarkMode ? AppColors.white : AppColors.black,
                        )),
                    10.verticalSpace,
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
