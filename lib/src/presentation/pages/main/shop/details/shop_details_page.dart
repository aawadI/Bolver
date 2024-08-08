import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:g_customer/src/presentation/pages/main/shop/details/riverpod/provider/home_all_product_provider.dart';
import 'package:g_customer/src/presentation/pages/main/shop/details/riverpod/provider/home_visible_provider.dart';
import 'package:g_customer/src/presentation/pages/main/shop/details/widgets/all_products_in_shop_details.dart';
import 'package:g_customer/src/presentation/pages/main/shop/details/widgets/category_banner.dart';

import '../../../../../core/constants/constants.dart';
import '../../../../../core/utils/utils.dart';
import '../../../../../riverpod/provider/app_provider.dart';
import '../../../../components/components.dart';
import '../../../../theme/theme.dart';
import '../../shop_list/riverpod/provider/home_banners_provider.dart';
import 'riverpod/provider/home_categories_provider.dart';
import 'riverpod/provider/home_discounts_provider.dart';
import 'riverpod/provider/home_most_sold_provider.dart';
import 'riverpod/provider/home_search_provider.dart';
import 'riverpod/provider/shop_details_search_filter_provider.dart';
import 'widgets/main_category_item.dart';
import 'widgets/shop_list_banners.dart';

class ShopDetailsPage extends ConsumerStatefulWidget {
  const ShopDetailsPage({Key? key}) : super(key: key);

  @override
  ConsumerState<ShopDetailsPage> createState() => _ShopDetailsPageState();
}

class _ShopDetailsPageState extends ConsumerState<ShopDetailsPage> {
  late ScrollController _scrollController;
  void listen() {
    final direction = _scrollController.position.userScrollDirection;
    if (_scrollController.position.maxScrollExtent ==
        _scrollController.position.pixels) {
      ref.read(homeAllProductsProvider.notifier).fetchMoreProducts();
    }
    if (direction == ScrollDirection.reverse) {
      ref.read(homeVisibleProvider.notifier).setScrollVisible(false);
    }
    if (direction == ScrollDirection.forward) {
      ref.read(homeVisibleProvider.notifier).setScrollVisible(true);
    }
  }

  @override
  void initState() {
    super.initState();
    _scrollController = ScrollController();
    _scrollController.addListener(listen);
    WidgetsBinding.instance.addPostFrameCallback(
      (_) {
        ref.read(homeVisibleProvider.notifier).setScrollVisible(true);
        ref.read(homeAllProductsProvider.notifier).fetchAllProducts();
        ref.read(homeBannersProvider.notifier).fetchBanners();
        ref.read(shopDetailsSearchFilterProvider.notifier).fetchBrands();
        ref.read(homeCategoriesProvider.notifier).fetchCategories();
        ref.read(homeDiscountsProvider.notifier).fetchDiscountProducts();
        ref.read(homeMostSoldProvider.notifier).fetchMostSoldProducts();
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
    int itemCount = 0;
    final bool isDarkMode = ref.watch(appProvider).isDarkMode;
    final searchState = ref.watch(homeSearchProvider);
    final categoriesState = ref.watch(homeCategoriesProvider);
    final searchEvent = ref.read(homeSearchProvider.notifier);
    return KeyboardDismisser(
      child: Scaffold(
          backgroundColor:
              isDarkMode ? AppColors.mainBackDark : AppColors.mainBack,
          body: Column(
            children: [
              1.verticalSpace,
              Consumer(builder: (context, ref, child) {
                final visibleState = ref.watch(homeVisibleProvider);
                return AnimatedContainer(
                  height: visibleState.isVisible ? 50 : 0,
                  duration: const Duration(milliseconds: 300),
                  child: SearchTextField(
                    isVisible: visibleState.isVisible,
                    hintText: AppHelpers.getTranslation(TrKeys.searchProducts),
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
                        shops: searchState.searchedShops,
                        categories: searchState.searchedCategories,
                        query: searchState.query.trim(),
                      )
                    : SingleChildScrollView(
                        controller: _scrollController,
                        // physics: const BouncingScrollPhysics(),
                        child: Column(
                          children: [
                            const ShopListBanners(),
                            1.verticalSpace,
                            // Row(
                            //   children: [
                            //     Expanded(
                            //       child: OftenBuyButton(
                            //         icAsset: AppAssets.svgIcOftenBuy,
                            //         onTap: () => context.pushRoute(
                            //             const OftenBuyProductsRoute()),
                            //         title: AppHelpers.getTranslation(
                            //             TrKeys.oftenBuy),
                            //         isDark: isDarkMode,
                            //       ),
                            //     ),
                            //     1.horizontalSpace,
                            //     Expanded(
                            //       child: OftenBuyButton(
                            //         isDark: isDarkMode,
                            //         icAsset: AppAssets.svgIcProfitable,
                            //         onTap: () => context.pushRoute(
                            //             const ProfitableProductsRoute()),
                            //         title: AppHelpers.getTranslation(
                            //             TrKeys.profitable),
                            //       ),
                            //     ),
                            //   ],
                            // ),
                            // // 16.verticalSpace,
                            // // DiscountProductsInShopDetails(
                            // //   onSeeAllPressed: () => context.pushRoute(
                            // //     DiscountProductsRoute(),
                            // //   ),
                            // // ),
                            // // 16.verticalSpace,
                            // // MostSoldProductsInShopDetails(
                            // //   onSeeAllPressed: () => context.pushRoute(
                            // //     MostSoldProductsRoute(),
                            // //   ),
                            // // ),
                            // 16.verticalSpace,
                            ListView.builder(
                              itemCount: categoriesState.categories.length < 4
                                  ? categoriesState.categories.length
                                  : 4,
                              shrinkWrap: true,
                              primary: false,
                              physics: const NeverScrollableScrollPhysics(),
                              padding: EdgeInsets.zero,
                              itemBuilder: (context, index) {
                                final category =
                                    categoriesState.categories[index];
                                if ((category.children?.length ?? 0) >= 2) {
                                  return MainCategoryItem(
                                    category: category,
                                    index: itemCount++,
                                  );
                                }
                                return const SizedBox.shrink();
                              },
                            ),
                            10.verticalSpace,
                            if (categoriesState.categories.length > 4)
                              CategoryBanner(
                                  categories: categoriesState.categories),
                            16.verticalSpace,
                            const AllProductsInShopDetails(),
                          ],
                        ),
                      ),
              ),
            ],
          )),
    );
  }
}
