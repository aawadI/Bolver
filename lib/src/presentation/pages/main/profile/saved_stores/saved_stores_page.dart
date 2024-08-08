import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_remix/flutter_remix.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../../core/constants/constants.dart';
import '../../../../../core/utils/utils.dart';
import '../../../../components/components.dart';
import '../../../../theme/theme.dart';
import '../../home/widgets/shops_loading_shimmer.dart';
import 'riverpod/provider/saved_stores_provider.dart';

class SavedStoresPage extends ConsumerStatefulWidget {
  const SavedStoresPage({Key? key}) : super(key: key);

  @override
  ConsumerState<SavedStoresPage> createState() => _SavedStoresPageState();
}

class _SavedStoresPageState extends ConsumerState<SavedStoresPage> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback(
      (_) => ref.read(savedStoresProvider.notifier).fetchSavedShops(),
    );
  }

  @override
  Widget build(BuildContext context) {
    final bool isDarkMode = LocalStorage.instance.getAppThemeMode();
    final bool isLtr = LocalStorage.instance.getLangLtr();
    return Directionality(
      textDirection: isLtr ? TextDirection.ltr : TextDirection.rtl,
      child: KeyboardDismisser(
        child: Consumer(
          builder: (context, ref, child) {
            final state = ref.watch(savedStoresProvider);
            final event = ref.read(savedStoresProvider.notifier);
            return Scaffold(
              backgroundColor: isDarkMode
                  ? AppColors.dontHaveAnAccBackDark
                  : AppColors.white,
              appBar: AppBar(
                backgroundColor: isDarkMode
                    ? AppColors.dontHaveAnAccBackDark
                    : AppColors.white,
                elevation: 0,
                leading: IconButton(
                  splashRadius: 18.r,
                  onPressed: context.popRoute,
                  icon: Icon(
                    isLtr
                        ? FlutterRemix.arrow_left_s_line
                        : FlutterRemix.arrow_right_s_line,
                    size: 24.r,
                    color: isDarkMode ? AppColors.white : AppColors.black,
                  ),
                ),
                title: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      AppHelpers.getTranslation(TrKeys.savedStores)
                          .toUpperCase(),
                      style: GoogleFonts.cairo(
                        fontSize: 15.sp,
                        fontWeight: FontWeight.w500,
                        letterSpacing: -0.7,
                        color: isDarkMode ? AppColors.white : AppColors.black,
                      ),
                    ),
                    10.horizontalSpace,
                    Container(
                      width: 4.r,
                      height: 4.r,
                      decoration: BoxDecoration(
                        color: isDarkMode
                            ? AppColors.dragElementDark
                            : AppColors.brandTitleDivider,
                        borderRadius: BorderRadius.circular(2.r),
                      ),
                    ),
                    7.horizontalSpace,
                    Text(
                      '${state.shops.length} ${AppHelpers.getTranslation(TrKeys.stores).toLowerCase()}',
                      style: GoogleFonts.cairo(
                        fontSize: 12.sp,
                        fontWeight: FontWeight.w500,
                        letterSpacing: -0.7,
                        color: isDarkMode ? AppColors.white : AppColors.black,
                      ),
                    ),
                  ],
                ),
                centerTitle: true,
              ),
              body: Column(
                children: [
                  Container(
                    height: 1.r,
                    color: isDarkMode
                        ? AppColors.white.withOpacity(0.07)
                        : AppColors.mainBack,
                  ),
                  SearchTextField(
                    onChanged: event.setQuery,
                    hintText: AppHelpers.getTranslation(TrKeys.searchStores),
                  ),
                  Container(
                    height: 1.r,
                    color: isDarkMode
                        ? AppColors.dontHaveAnAccBackDark
                        : AppColors.mainBack,
                  ),
                  Expanded(
                    child: state.isSearching
                        ? ShopSearchBody(
                            isSearchLoading: state.isSearchLoading,
                            searchedShops: state.searchedShops,
                            query: state.query.trim(),
                          )
                        : state.isLoading
                            ? const ShopsLoadingShimmer(
                                horizontalPadding: 15,
                                verticalPadding: 20,
                              )
                            : state.shops.isNotEmpty
                                ? ListView.builder(
                                    itemCount: state.shops.length,
                                    shrinkWrap: true,
                                    padding: REdgeInsets.symmetric(
                                      horizontal: 15,
                                      vertical: 20,
                                    ),
                                    physics:
                                        const CustomBouncingScrollPhysics(),
                                    itemBuilder: (context, index) =>
                                        MainShopItem(shop: state.shops[index]),
                                  )
                                : Column(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      170.verticalSpace,
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
                                          AppAssets.pngNoStoreImage,
                                          width: 57.r,
                                          height: 87.r,
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                      14.verticalSpace,
                                      Text(
                                        '${AppHelpers.getTranslation(TrKeys.thereAreNoItemsInThe)} ${AppHelpers.getTranslation(TrKeys.savedStores).toLowerCase()}',
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
            );
          },
        ),
      ),
    );
  }
}
