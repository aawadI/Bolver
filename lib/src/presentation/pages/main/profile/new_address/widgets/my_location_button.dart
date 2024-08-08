import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../theme/theme.dart';
import '../../../../../../core/utils/utils.dart';

class MyLocationButton extends StatelessWidget {
  final IconData iconData;
  final VoidCallback onTap;
  final int width;

  const MyLocationButton({
    Key? key,
    required this.iconData,
    required this.onTap,
    this.width = 60,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final bool isDarkMode = LocalStorage.instance.getAppThemeMode();
    return Material(
      borderRadius: BorderRadius.circular((width / 2).r),
      elevation: 2,
      color: isDarkMode ? AppColors.dontHaveAnAccBackDark : AppColors.white,
      child: InkWell(
        borderRadius: BorderRadius.circular((width / 2).r),
        onTap: onTap,
        child: Container(
          width: width.r,
          height: width.r,
          decoration: const BoxDecoration(shape: BoxShape.circle),
          alignment: Alignment.center,
          child: Icon(
            iconData,
            size: 28.r,
            color: isDarkMode ? AppColors.white : AppColors.black,
          ),
        ),
      ),
    );
  }
}
