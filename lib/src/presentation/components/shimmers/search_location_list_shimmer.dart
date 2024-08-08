import 'package:shimmer/shimmer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../theme/theme.dart';
import '../../../core/utils/utils.dart';

class SearchLocationListShimmer extends StatelessWidget {
  final int height;
  final int spacing;
  final int borderRadius;
  final ScrollPhysics physics;
  final int itemCount;

  const SearchLocationListShimmer({
    Key? key,
    this.height = 55,
    this.spacing = 1,
    this.borderRadius = 0,
    this.physics = const BouncingScrollPhysics(),
    this.itemCount = 5,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final bool isDarkMode = LocalStorage.instance.getAppThemeMode();
    return ListView.builder(
      shrinkWrap: true,
      itemCount: itemCount,
      physics: physics,
      padding: EdgeInsets.zero,
      itemBuilder: (context, index) {
        return Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Shimmer.fromColors(
              baseColor: isDarkMode
                  ? AppColors.shimmerBaseDark
                  : AppColors.shimmerBase,
              highlightColor: isDarkMode
                  ? AppColors.shimmerHighlightDark
                  : AppColors.shimmerHighlight,
              child: Container(
                height: height.r,
                decoration: BoxDecoration(
                  color: isDarkMode
                      ? AppColors.dontHaveAnAccBackDark
                      : AppColors.white,
                  borderRadius: BorderRadius.circular(borderRadius.r),
                ),
              ),
            ),
            spacing.verticalSpace,
          ],
        );
      },
    );
  }
}
