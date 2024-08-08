import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:cached_network_image/cached_network_image.dart';
import '../theme/theme.dart';
import '../../core/utils/utils.dart';

class CommonImage extends StatelessWidget {
  final String? imageUrl;
  final double? width;
  final double? height;
  final double radius;
  final double errorRadius;
  final Color? errorBackground;
  final BoxFit? fit;

  const CommonImage({
    Key? key,
    required this.imageUrl,
    this.width,
    this.height,
    this.radius = 10,
    this.errorRadius = 10,
    this.errorBackground,
    this.fit,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(radius.r),
      child: AppHelpers.checkIsSvg(imageUrl)
          ? SvgPicture.network(
              '$imageUrl',
              width: width?.r,
              height: height?.r,
              fit: BoxFit.cover,
              placeholderBuilder: (_) => Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(radius.r),
                  color: AppColors.mainBack,
                ),
              ),
            )
          : CachedNetworkImage(
              imageUrl: '$imageUrl',
              width: width?.r,
              height: height?.r,
              fit: fit ?? BoxFit.cover,
              progressIndicatorBuilder: (_, __, ___) => Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(radius.r),
                  color: AppColors.mainBack,
                ),
              ),
              errorWidget: (_, __, ___) => Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(errorRadius.r),
                  color: errorBackground ?? AppColors.mainBack,
                ),
                alignment: Alignment.center,
                child: Icon(
                  Icons.person,
                  color: AppColors.black.withOpacity(0.5),
                  size: 20.r,
                ),
              ),
            ),
    );
  }
}
