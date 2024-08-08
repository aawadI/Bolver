import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:g_customer/src/presentation/theme/app_colors.dart';

class ModalDrag extends StatelessWidget {
  const ModalDrag({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.center,
      child: Column(
        children: [
          8.verticalSpace,
          Container(
            width: 48.r,
            height: 4.r,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(40.r),
              color: AppColors.shimmerBase,
            ),
          ),
          18.verticalSpace,
        ],
      ),
    );
  }
}
