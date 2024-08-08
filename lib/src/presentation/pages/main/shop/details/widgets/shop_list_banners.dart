import 'package:flutter/material.dart';
import 'package:auto_route/auto_route.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../theme/theme.dart';
import '../../../../../components/components.dart';
import '../../../../../../core/routes/app_router.gr.dart';
import '../../../shop_list/riverpod/provider/home_banners_provider.dart';

class ShopListBanners extends ConsumerWidget {
  const ShopListBanners({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(homeBannersProvider);
    final event = ref.read(homeBannersProvider.notifier);
    return state.isLoading
        ? MakeShimmer(
            child: Container(
              height: 200.r,
              decoration: const BoxDecoration(
                color: AppColors.mainBack,
              ),
            ),
          )
        : state.banners.isNotEmpty
            ? Stack(
                children: [
                  CarouselSlider.builder(
                    itemCount: state.banners.length,
                    options: CarouselOptions(
                      viewportFraction: 1,
                      autoPlay: true,
                      onPageChanged: (index, reason) =>
                          event.setActiveBanner(index),
                    ),
                    itemBuilder: (context, index, realIndex) {
                      final banner = state.banners[index];
                      return InkWell(
                        onTap: () => context.pushRoute(
                          BannerDetailsRoute(
                            id: banner.id,
                            imageUrl: banner.img,
                          ),
                        ),
                        child: SizedBox(
                          height: 377.r,
                          child: MakeGradientMask(
                            child: CommonImage(
                              imageUrl: banner.img,
                              width: double.infinity,
                              height: 377,
                              radius: 0,
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                  Positioned(
                    bottom: 15.r,
                    left: 15.r,
                    right: 0.r,
                    child: SizedBox(
                      height: 4.r,
                      child: ListView.builder(
                        shrinkWrap: true,
                        scrollDirection: Axis.horizontal,
                        itemCount: state.banners.length,
                        itemBuilder: (context, indicatorIndex) => Container(
                          height: 4.r,
                          width: 32.r,
                          margin: REdgeInsets.only(right: 4),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10.r),
                            color: state.bannerIndex == indicatorIndex
                                ? AppColors.white
                                : AppColors.white.withOpacity(0.36),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              )
            : const SizedBox.shrink();
  }
}
