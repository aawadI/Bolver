import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../core/utils/utils.dart';
import '../../theme/theme.dart';
import '../components.dart';

class AppleFbButton extends StatelessWidget {
  final IconData iconData;
  final VoidCallback onPressed;
  final bool isLoading;

  const AppleFbButton({
    Key? key,
    required this.iconData,
    required this.onPressed,
    required this.isLoading,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final bool isDarkMode = LocalStorage.instance.getAppThemeMode();
    return OutlinedButton(
      style: OutlinedButton.styleFrom(
        backgroundColor:
            isDarkMode ? AppColors.dontHaveAnAccBackDark : AppColors.white,
        minimumSize: Size(46.r, 46.r),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8.r),
          side: const BorderSide(
            color: AppColors.outlineButtonBorder,
          ),
        ),
      ),
      onPressed: onPressed,
      child: isLoading
          ? JumpingDots(
              radius: 5,
              color: isDarkMode ? AppColors.white : AppColors.black,
            )
          : Icon(
              iconData,
              color: isDarkMode ? AppColors.white : AppColors.black,
            ),
    );
  }
}
