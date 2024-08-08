import 'package:flutter/material.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../theme/theme.dart';
import 'riverpod/provider/brands_provider.dart';
import '../../../../../../core/utils/utils.dart';
import '../../../../../components/components.dart';
import '../../../../../../core/constants/constants.dart';
import '../../../../../../core/routes/app_router.gr.dart';

class BrandsPage extends ConsumerStatefulWidget {
  const BrandsPage({Key? key}) : super(key: key);

  @override
  ConsumerState<BrandsPage> createState() => _BrandsPageState();
}

class _BrandsPageState extends ConsumerState<BrandsPage> {
  late ScrollController _scrollController;

  @override
  void initState() {
    super.initState();
    _scrollController = ScrollController();
    _scrollController.addListener(
      () {
        if (_scrollController.position.maxScrollExtent ==
            _scrollController.position.pixels) {
          ref.read(brandsProvider.notifier).fetchMoreBrands();
        }
      },
    );
    WidgetsBinding.instance.addPostFrameCallback(
      (_) => ref.read(brandsProvider.notifier).initialFetchBrands(),
    );
  }

  @override
  void dispose() {
    super.dispose();
    _scrollController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final state = ref.watch(brandsProvider);
    final notifier = ref.read(brandsProvider.notifier);
    final bool isDarkMode = LocalStorage.instance.getAppThemeMode();
    return KeyboardDismisser(
      child: Scaffold(
        backgroundColor:
            isDarkMode ? AppColors.dontHaveAnAccBackDark : AppColors.white,
        appBar: AppBarWithProductCount(
          hasProductCount: false,
          hasSearchFilter: false,
          title: AppHelpers.getTranslation(TrKeys.brands),
          searchHintText:
              '${AppHelpers.getTranslation(TrKeys.search)} ${AppHelpers.getTranslation(TrKeys.brands).toLowerCase()}',
          onSearchChanged: notifier.setQuery,
        ),
        body: state.isSearching
            ? NewProductSearchBody(
                isSearchLoading: state.isSearchLoading,
                brands: state.searchedBrands,
                query: state.query,
                hasShops: false,
                hasCategories: false,
                hasProducts: false,
              )
            : (state.isLoading
                ? GridView.builder(
                    shrinkWrap: true,
                    primary: false,
                    itemCount: 18,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      childAspectRatio: 1,
                      mainAxisSpacing: 9.r,
                      crossAxisSpacing: 9.r,
                      crossAxisCount: 3,
                    ),
                    padding: REdgeInsets.symmetric(horizontal: 16, vertical: 9),
                    itemBuilder: (context, index) => ClipRRect(
                      borderRadius: BorderRadius.circular(8.r),
                      child: MakeShimmer(
                        child: Container(
                          width: double.infinity,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8.r),
                            color: AppColors.white,
                          ),
                        ),
                      ),
                    ),
                  )
                : ListView(
                    physics: const CustomBouncingScrollPhysics(),
                    shrinkWrap: true,
                    controller: _scrollController,
                    children: [
                      16.verticalSpace,
                      GridView.builder(
                        shrinkWrap: true,
                        primary: false,
                        itemCount: state.brands.length,
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          childAspectRatio: 1,
                          mainAxisSpacing: 9.r,
                          crossAxisSpacing: 9.r,
                          crossAxisCount: 3,
                        ),
                        padding: REdgeInsets.symmetric(horizontal: 16),
                        itemBuilder: (context, index) => InkWell(
                          onTap: () => context.pushRoute(
                              BrandDetailsRoute(brand: state.brands[index])),
                          child: CommonImage(
                            imageUrl: state.brands[index].img,
                            width: double.infinity,
                          ),
                        ),
                      ),
                      if (state.isMoreLoading)
                        GridView.builder(
                          shrinkWrap: true,
                          primary: false,
                          itemCount: 18,
                          gridDelegate:
                              SliverGridDelegateWithFixedCrossAxisCount(
                            childAspectRatio: 1,
                            mainAxisSpacing: 9.r,
                            crossAxisSpacing: 9.r,
                            crossAxisCount: 3,
                          ),
                          padding: REdgeInsets.symmetric(
                            horizontal: 16,
                            vertical: 9,
                          ),
                          itemBuilder: (context, index) => ClipRRect(
                            borderRadius: BorderRadius.circular(8.r),
                            child: MakeShimmer(
                              child: Container(
                                width: double.infinity,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(8.r),
                                  color: AppColors.white,
                                ),
                              ),
                            ),
                          ),
                        ),
                      16.verticalSpace,
                    ],
                  )),
      ),
    );
  }
}
