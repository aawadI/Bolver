
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../theme/theme.dart';
import '../../../core/utils/utils.dart';

class ProductHorizontalListShimmer extends StatelessWidget {
  final int height;
  final int spacing;
  final int verticalPadding;
  final int horizontalPadding;
  final int itemCount;
  final ScrollPhysics physics;

  const ProductHorizontalListShimmer({
    Key? key,
    this.height = 154,
    this.spacing = 24,
    this.verticalPadding = 0,
    this.horizontalPadding = 0,
    this.itemCount = 15,
    this.physics = const BouncingScrollPhysics(),
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final bool isDarkMode = LocalStorage.instance.getAppThemeMode();
    return ListView.builder(
      shrinkWrap: true,
      itemCount: itemCount,
      primary: false,
      physics: physics,
      padding: REdgeInsets.symmetric(
        vertical: verticalPadding.r,
        horizontal: horizontalPadding.r,
      ),
      itemBuilder: (context, index) {
        return Column(
          children: [
            Container(
              height: height.r,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8.r),
                color: isDarkMode
                    ? AppColors.shimmerBaseDark
                    : AppColors.shimmerBase,
              ),
            ),
            spacing.verticalSpace,
          ],
        );
      },
    );
  }
}
