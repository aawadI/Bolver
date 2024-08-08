import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../../core/constants/constants.dart';
import '../../../../../core/utils/utils.dart';
import '../../../../../riverpod/provider/app_provider.dart';
import '../../../../components/components.dart';
import '../../../../theme/theme.dart';
import 'riverpod/provider/categories_provider.dart';
import 'widgets/tab_bar_view_categories.dart';

class CategoriesPage extends ConsumerStatefulWidget {
  const CategoriesPage({Key? key}) : super(key: key);

  @override
  ConsumerState<CategoriesPage> createState() => _CategoriesPageState();
}

class _CategoriesPageState extends ConsumerState<CategoriesPage> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback(
      (_) => ref.read(categoriesProvider.notifier).fetchCategories(),
    );
  }

  @override
  Widget build(BuildContext context) {
    final state = ref.watch(categoriesProvider);
    final notifier = ref.read(categoriesProvider.notifier);
    final bool isDarkMode = ref.watch(appProvider).isDarkMode;
    return KeyboardDismisser(
      child: Scaffold(
        backgroundColor:
            isDarkMode ? AppColors.dontHaveAnAccBackDark : AppColors.mainBack,
        body: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            1.verticalSpace,
            SearchTextField(
              hintText: AppHelpers.getTranslation(TrKeys.search),
              onChanged: notifier.setQuery,
            ),
            1.verticalSpace,
            Expanded(
              child: state.isSearching
                  ? NewProductSearchBody(
                      isSearchLoading: state.isSearchLoading,
                      products: state.searchedProducts,
                      categories: state.searchedCategories,
                      query: state.query.trim(),
                      hasShops: false,
                      hasBrands: false,
                    )
                  : state.isLoading
                      ? JumpingDots(
                          color: isDarkMode ? AppColors.white : AppColors.black,
                        )
                      : state.categories.isNotEmpty
                          ? TabBarViewCategories(categories: state.categories)
                          : Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Container(
                                  width: 142.r,
                                  height: 142.r,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(8.r),
                                    color: isDarkMode
                                        ? AppColors.mainBackDark
                                        : AppColors.white,
                                  ),
                                  alignment: Alignment.center,
                                  child: Image.asset(
                                    AppAssets.pngNoViewedProducts,
                                    width: 87.r,
                                    height: 60.r,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                                14.verticalSpace,
                                Text(
                                  '${AppHelpers.getTranslation(TrKeys.thereAreNoItemsInThe)} ${AppHelpers.getTranslation(TrKeys.categories).toLowerCase()}',
                                  style: GoogleFonts.cairo(
                                    fontSize: 14.sp,
                                    fontWeight: FontWeight.w600,
                                    letterSpacing: -14 * 0.02,
                                    color: isDarkMode
                                        ? AppColors.white
                                        : AppColors.black,
                                  ),
                                ),
                              ],
                            ),
            ),
          ],
        ),
      ),
    );
  }
}
