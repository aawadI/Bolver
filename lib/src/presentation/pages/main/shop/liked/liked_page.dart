import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../../core/constants/constants.dart';
import '../../../../../core/utils/utils.dart';
import '../../../../../riverpod/provider/app_provider.dart';
import '../../../../components/components.dart';
import '../../../../theme/theme.dart';
import 'riverpod/provider/liked_provider.dart';
import 'widgets/liked_products_body.dart';

class LikedPage extends ConsumerWidget {
  const LikedPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final bool isDarkMode = ref.watch(appProvider).isDarkMode;
    final bool isLtr = LocalStorage.instance.getLangLtr();
    return Directionality(
      textDirection: isLtr ? TextDirection.ltr : TextDirection.rtl,
      child: KeyboardDismisser(
        child: Scaffold(
          backgroundColor:
              isDarkMode ? AppColors.dontHaveAnAccBackDark : AppColors.white,
          body: Consumer(
            builder: (context, ref, child) {
              final state = ref.watch(likedProvider);
              final event = ref.read(likedProvider.notifier);
              return Column(
                children: [
                  Container(
                    height: 1.r,
                    color: isDarkMode
                        ? AppColors.mainBackDark
                        : AppColors.mainBack,
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: SearchTextField(
                          onChanged: event.setQuery,
                          hintText:
                              AppHelpers.getTranslation(TrKeys.searchProducts),
                        ),
                      ),
                      ChangeAlignmentListButton(
                        alignment: state.listAlignment,
                        onChange: event.setListAlignment,
                      ),
                      16.horizontalSpace,
                    ],
                  ),
                  Divider(
                    height: 0.r,
                    thickness: 1.r,
                    color: isDarkMode
                        ? AppColors.mainBackDark
                        : AppColors.mainBack,
                  ),
                  Expanded(
                    child: state.isSearching
                        ? NewProductSearchBody(
                            isSearchLoading: state.isSearchLoading,
                            products: state.searchedProducts,
                            query: state.query.trim(),
                            hasShops: false,
                            hasCategories: false,
                            hasBrands: false,
                          )
                        : Padding(
                            padding: REdgeInsets.symmetric(horizontal: 15),
                            child: state.isLikedProductsLoading
                                ? const ProductGridListShimmer()
                                : state.likedProducts.isNotEmpty
                                    ? const LikedProductsBody()
                                    : Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Container(
                                            width: 142.r,
                                            height: 142.r,
                                            decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(8.r),
                                              color: isDarkMode
                                                  ? AppColors.mainBackDark
                                                  : AppColors.mainBack,
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
                                            '${AppHelpers.getTranslation(TrKeys.thereAreNoItemsInThe)} ${AppHelpers.getTranslation(TrKeys.likedProducts).toLowerCase()}',
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
                  ),
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}
