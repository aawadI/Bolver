import 'package:auto_route/auto_route.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../../../../core/constants/constants.dart';
import '../../../../../../../core/routes/app_router.gr.dart';
import '../../../../../../../core/utils/utils.dart';
import '../../../../../../components/components.dart';
import '../../../../../../theme/theme.dart';
import '../riverpod/provider/shop_banners_provider.dart';

class MiniBannersInSingleShop extends ConsumerWidget {
  final ValueSetter<int> onPageChanged;

  const MiniBannersInSingleShop({Key? key, required this.onPageChanged})
      : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(shopBannersProvider);
    final bool isDarkMode = LocalStorage.instance.getAppThemeMode();
    return state.isLoading
        ? MakeShimmer(
            child: Container(
              height: 160.r,
              decoration: const BoxDecoration(
                color: AppColors.mainBack,
              ),
            ),
          )
        : state.banners.isNotEmpty
            ? Column(
                children: [
                  CarouselSlider.builder(
                    itemCount: state.banners.length,
                    itemBuilder: (context, index, realIndex) {
                      final banner = state.banners[index];
                      return InkWell(
                        onTap: () => context.pushRoute(
                          BannerDetailsRoute(
                            id: banner.id ?? 0,
                            imageUrl: banner.img ?? '',
                          ),
                        ),
                        child: SizedBox(
                          height: 160.r,
                          child: Stack(
                            fit: StackFit.expand,
                            children: [
                              CommonImage(
                                imageUrl: banner.img,
                                radius: 8,
                                height: 160,
                              ),
                              Column(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  InkWell(
                                    onTap: () {},
                                    child: Text(
                                      AppHelpers.getTranslation(TrKeys.seeMore)
                                          .toUpperCase(),
                                      style: GoogleFonts.cairo(
                                        fontSize: 11.sp,
                                        fontWeight: FontWeight.w500,
                                        color: AppColors.white,
                                        letterSpacing: 14 * 0.2,
                                      ),
                                    ),
                                  ),
                                  18.verticalSpace
                                ],
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                    options: CarouselOptions(
                      height: 160.r,
                      viewportFraction: 0.8,
                      autoPlay: true,
                      enlargeCenterPage: true,
                      autoPlayAnimationDuration: const Duration(seconds: 1),
                      onPageChanged: (index, reason) {
                        onPageChanged(index);
                      },
                    ),
                  ),
                  6.verticalSpace,
                  SizedBox(
                    height: 6.r,
                    child: ListView.builder(
                      shrinkWrap: true,
                      scrollDirection: Axis.horizontal,
                      itemCount: state.banners.length,
                      itemBuilder: (context, indicatorIndex) {
                        return state.bannerIndex != indicatorIndex
                            ? Container(
                                height: 6.r,
                                width: 6.r,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(3.r),
                                  color: isDarkMode
                                      ? AppColors.borderDark
                                      : AppColors.black.withOpacity(0.1),
                                ),
                                margin: REdgeInsets.only(right: 4),
                              )
                            : Container(
                                height: 4.r,
                                width: 10.r,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(100.r),
                                  color: isDarkMode
                                      ? AppColors.white
                                      : AppColors.black,
                                ),
                                margin: REdgeInsets.only(right: 4),
                              );
                      },
                    ),
                  ),
                ],
              )
            : const SizedBox.shrink();
  }
}
