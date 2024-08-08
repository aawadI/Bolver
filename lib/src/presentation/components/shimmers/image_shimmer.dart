import 'package:g_customer/src/presentation/theme/app_colors.dart';
import 'package:shimmer/shimmer.dart';
import 'package:flutter/material.dart';

class ImageShimmer extends StatelessWidget {
  final double size;
  final bool isCircle;

  const ImageShimmer({Key? key, required this.size, required this.isCircle})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: AppColors.shimmerBase,
      highlightColor: AppColors.shimmerHighlight,
      child: Container(
        height: size,
        width: size,
        decoration: BoxDecoration(
          shape: isCircle ? BoxShape.circle : BoxShape.rectangle,
          color: AppColors.white,
        ),
      ),
    );
  }
}
