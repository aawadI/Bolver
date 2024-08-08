import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../core/utils/local_storage.dart';
import '../../theme/theme.dart';

class ProductGridListShimmer extends StatelessWidget {
  final int itemCount;
  final int verticalPadding;
  final ScrollPhysics physics;

  const ProductGridListShimmer({
    Key? key,
    this.itemCount = 6,
    this.verticalPadding = 20,
    this.physics = const BouncingScrollPhysics(),
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final bool isDarkMode = LocalStorage.instance.getAppThemeMode();
    return GridView.builder(
      shrinkWrap: true,
      itemCount: itemCount,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        childAspectRatio: 168 / 272,
        mainAxisSpacing: 30.r,
        crossAxisSpacing: 9.r,
        crossAxisCount: 2,
      ),
      padding: REdgeInsets.symmetric(vertical: verticalPadding.r),
      physics: physics,
      itemBuilder: (context, index) {
        return Container(
          width: 168.r,
          height: 272.r,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8.r),
              color: isDarkMode
                  ? AppColors.shimmerBaseDark
                  : AppColors.shimmerBase,
          ),
        );
      },
    );
  }
}
