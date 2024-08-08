import 'package:flutter/material.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../riverpod/provider/home_visible_provider.dart';
import 'widgets/single_shop_brands.dart';
import 'widgets/single_shop_viewed.dart';
import 'widgets/single_shop_discounts.dart';
import 'widgets/single_shop_most_sold.dart';
import '../../../../../../models/models.dart';
import '../../../../../theme/app_colors.dart';
import 'widgets/single_shop_new_products.dart';
import 'widgets/main_banner_in_single_shop.dart';
import 'widgets/mini_banners_in_single_shop.dart';
import '../../../../../components/components.dart';
import 'riverpod/provider/single_shop_provider.dart';
import 'riverpod/provider/shop_banners_provider.dart';
import '../../../../../../core/utils/app_helpers.dart';
import '../../../../../../core/constants/constants.dart';
import '../../../../../../core/utils/local_storage.dart';
import '../../../../../../core/routes/app_router.gr.dart';
import 'riverpod/provider/single_shop_brands_provider.dart';
import 'riverpod/provider/single_shop_viewed_provider.dart';
import 'riverpod/provider/single_shop_search_provider.dart';
import 'riverpod/provider/single_shop_most_sold_provider.dart';
import 'riverpod/provider/single_shop_discounts_provider.dart';
import 'riverpod/provider/single_shop_new_products_provider.dart';

class SingleShopPage extends ConsumerStatefulWidget {
  final ShopData? shop;

  const SingleShopPage({Key? key, required this.shop}) : super(key: key);

  @override
  ConsumerState<SingleShopPage> createState() => _SingleShopPageState();
}

class _SingleShopPageState extends ConsumerState<SingleShopPage> {
  late ScrollController _scrollController;

  void listen() {
    final direction = _scrollController.position.userScrollDirection;
    if (direction == ScrollDirection.reverse) {
      ref.read(homeVisibleProvider.notifier).setScrollVisible(true);
    } else if (direction == ScrollDirection.forward) {
      ref.read(homeVisibleProvider.notifier).setScrollVisible(false);
    }
  }

  @override
  void initState() {
    super.initState();
    _scrollController = ScrollController();
    _scrollController.addListener(listen);
    WidgetsBinding.instance.addPostFrameCallback(
      (_) {
        ref.read(homeVisibleProvider.notifier).setScrollVisible(false);
        ref.read(singleShopProvider.notifier).fetchShopDetails(
              shop: widget.shop,
              failed: () {
                AppHelpers.showCheckFlash(
                  context,
                  AppHelpers.getTranslation(
                      TrKeys.somethingWentWrongWithTheServer),
                );
                context.popRoute();
              },
            );
        ref.read(shopBannersProvider.notifier).fetchBanners();
        ref
            .read(singleShopNewProductsProvider.notifier)
            .fetchNewProducts(shopId: widget.shop?.id);
        ref
            .read(singleShopDiscountsProvider.notifier)
            .fetchDiscountProducts(shopId: widget.shop?.id);
        ref
            .read(singleShopMostSoldProvider.notifier)
            .fetchMostSoldProducts(shopId: widget.shop?.id);
        ref
            .read(singleShopViewedProvider.notifier)
            .fetchViewedProducts(shopId: widget.shop?.id);
        ref
            .read(singleShopBrandsProvider.notifier)
            .fetchBrands(shopId: widget.shop?.id);
      },
    );
  }

  @override
  void dispose() {
    super.dispose();
    _scrollController.removeListener(listen);
    _scrollController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final searchEvent = ref.read(singleShopSearchProvider.notifier);
    final bannersEvent = ref.read(shopBannersProvider.notifier);
    final state = ref.watch(singleShopProvider);
    final searchState = ref.watch(singleShopSearchProvider);
    final bool isDarkMode = LocalStorage.instance.getAppThemeMode();
    return state.isLoading
        ? Scaffold(
            backgroundColor:
                isDarkMode ? AppColors.mainBackDark : AppColors.mainBack,
            body: JumpingDots(
              color: isDarkMode ? AppColors.white : AppColors.black,
            ),
          )
        : KeyboardDismisser(
            child: Scaffold(
              appBar: CommonAppBar(
                title: widget.shop?.translation?.title ??
                    AppHelpers.getTranslation(TrKeys.noTitle),
                onLeadingPressed: context.popRoute,
              ),
              backgroundColor:
                  isDarkMode ? AppColors.mainBackDark : AppColors.mainBack,
              body: SafeArea(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    1.verticalSpace,
                    Consumer(builder: (context, ref, child) {
                      final visibleState = ref.watch(homeVisibleProvider);
                      return AnimatedContainer(
                        height: visibleState.isVisible ? 0 : 50,
                        duration: const Duration(milliseconds: 300),
                        child: SearchTextField(
                          isVisible: !visibleState.isVisible,
                          hintText:
                              '${AppHelpers.getTranslation(TrKeys.searchProducts)} ${AppHelpers.getTranslation(TrKeys.searchIn).toLowerCase()} ${widget.shop?.translation?.title ?? 'store'}',
                          onChanged: searchEvent.setQuery,
                        ),
                      );
                    }),
                    1.verticalSpace,
                    Expanded(
                      child: searchState.isSearching
                          ? NewProductSearchBody(
                              isSearchLoading: searchState.isSearchLoading,
                              products: searchState.searchedProducts,
                              brands: searchState.searchedBrands,
                              categories: searchState.searchedCategories,
                              query: searchState.query.trim(),
                              hasShops: false,
                            )
                          : ListView(
                              controller: _scrollController,
                              shrinkWrap: true,
                              physics: const CustomBouncingScrollPhysics(),
                              children: [
                                1.verticalSpace,
                                const MainBannerInSingleShop(),
                                16.verticalSpace,
                                MiniBannersInSingleShop(
                                  onPageChanged: bannersEvent.setIndex,
                                ),
                                16.verticalSpace,
                                SingleShopNewProducts(
                                  onSeeAllPressed: () => context.pushRoute(
                                      NewProductsRoute(
                                          shopId: widget.shop?.id)),
                                ),
                                16.verticalSpace,
                                SingleShopDiscounts(
                                  onSeeAllPressed: () => context.pushRoute(
                                      DiscountProductsRoute(
                                          shopId: widget.shop?.id)),
                                ),
                                16.verticalSpace,
                                SingleShopMostSold(
                                  onSeeAllPressed: () => context.pushRoute(
                                      MostSoldProductsRoute(
                                          shopId: widget.shop?.id)),
                                ),
                                15.verticalSpace,
                                SingleShopViewed(
                                  onSeeAllPressed: () => context.pushRoute(
                                    ViewedProductsRoute(
                                        shopId: widget.shop?.id),
                                  ),
                                ),
                                16.verticalSpace,
                                SingleShopBrands(
                                  onSeeAllPressed: () =>
                                      context.pushRoute(const BrandsRoute()),
                                ),
                              ],
                            ),
                    ),
                  ],
                ),
              ),
            ),
          );
  }
}
