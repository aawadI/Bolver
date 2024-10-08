import 'package:flutter/material.dart';
import 'package:flutter_remix/flutter_remix.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../theme/app_colors.dart';

class ResendButton extends StatelessWidget {
  final String title;
  final IconData iconData;
  final bool isTimeExpired;
  final bool isResending;
  final Function()? onPressed;

  const ResendButton({
    Key? key,
    required this.title,
    this.iconData = FlutterRemix.refresh_line,
    this.isTimeExpired = false,
    this.isResending = false,
    required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        elevation: 0,
        shadowColor: AppColors.transparent,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        ),
        minimumSize: Size(97.r, 46.r),
        backgroundColor: AppColors.black,
      ),
      onPressed: onPressed,
      child: isTimeExpired
          ? isResending
              ? SizedBox(
                  width: 10.r,
                  height: 10.r,
                  child: CircularProgressIndicator(
                    strokeWidth: 1.r,
                    color: AppColors.white,
                  ),
                )
              : Icon(
                  iconData,
                  color: AppColors.white,
                  size: 20,
                )
          : Text(
              title,
              style: GoogleFonts.cairo(
                fontWeight: FontWeight.w500,
                fontSize: 15.sp,
                color: AppColors.white,
              ),
            ),
    );
  }
}
