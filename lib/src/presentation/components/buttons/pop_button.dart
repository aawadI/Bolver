import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:g_customer/src/presentation/theme/app_colors.dart';

import 'animation_button_effect.dart';

class PopButton extends StatelessWidget {
  final VoidCallback? onTap;

  const PopButton({Key? key, this.onTap}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap ??
          () {
            Navigator.pop(context);
          },
      child: AnimationButtonEffect(
        child: Container(
          decoration: BoxDecoration(
              color: AppColors.black,
              borderRadius: BorderRadius.all(Radius.circular(10.r))),
          padding: EdgeInsets.all(14.h),
          child: const Icon(
            Icons.keyboard_arrow_left,
            color: AppColors.white,
          ),
        ),
      ),
    );
  }
}
