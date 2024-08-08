import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:g_customer/src/presentation/pages/main/profile/add_address/riverpod/provider/add_address_provider.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../../core/constants/constants.dart';
import '../../../../../core/routes/app_router.gr.dart';
import '../../../../../core/utils/utils.dart';
import '../../../../components/components.dart';
import '../../../../theme/theme.dart';
import 'riverpod/provider/saved_locations_provider.dart';
import 'widgets/new_address_item.dart';

class SavedLocationsPage extends ConsumerStatefulWidget {
  const SavedLocationsPage({Key? key}) : super(key: key);

  @override
  ConsumerState<SavedLocationsPage> createState() => _SavedLocationsPageState();
}

class _SavedLocationsPageState extends ConsumerState<SavedLocationsPage> {
  late ScrollController _scrollController;
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback(
      (_) => ref.read(savedLocationsProvider.notifier).fetchSavedLocations(),
    );

    _scrollController = ScrollController();
    _scrollController.addListener(
      () {
        if (_scrollController.position.maxScrollExtent ==
            _scrollController.position.pixels) {
          ref.read(savedLocationsProvider.notifier).fetchMoreSavedLocations();
        }
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final state = ref.watch(savedLocationsProvider);
    final notifier = ref.read(savedLocationsProvider.notifier);
    final bool isDarkMode = LocalStorage.instance.getAppThemeMode();
    final bool isLtr = LocalStorage.instance.getLangLtr();
    return Directionality(
      textDirection: isLtr ? TextDirection.ltr : TextDirection.rtl,
      child: AbsorbPointer(
        absorbing: state.isLoading || state.isUpdating,
        child: Scaffold(
          extendBody: true,
          backgroundColor:
              isDarkMode ? AppColors.dontHaveAnAccBackDark : AppColors.white,
          appBar: CommonAppBar(
            title: AppHelpers.getTranslation(TrKeys.savedLocations),
            onLeadingPressed: context.popRoute,
          ),
          body: Stack(
            children: [
              Padding(
                padding: REdgeInsets.symmetric(horizontal: 15),
                child: state.isLoading
                    ? const ProductHorizontalListShimmer(
                        height: 110,
                        spacing: 10,
                        verticalPadding: 30,
                      )
                    : (LocalStorage.instance.getNewAddresses().isNotEmpty
                        ? ListView(
                            controller: _scrollController,
                            shrinkWrap: true,
                            physics: const CustomBouncingScrollPhysics(),
                            children: [
                                ListView.builder(
                                  shrinkWrap: true,
                                  physics: const CustomBouncingScrollPhysics(),
                                  padding:
                                      REdgeInsets.only(top: 30, bottom: 10),
                                  itemCount: LocalStorage.instance
                                      .getNewAddresses()
                                      .length,
                                  itemBuilder: (context, index) {
                                    final address = LocalStorage.instance
                                        .getNewAddresses()[index];
                                    return NewAddressItem(
                                      onEdit: () {
                                        ref
                                            .read(addAddressProvider.notifier)
                                            .setIDIndex(
                                                id: address.id ?? 0,
                                                index: index);
                                        if (ref.watch(addAddressProvider).id !=
                                            null) {
                                          context.pushRoute(AddAddressRoute(
                                              isRequired: false,
                                              onEditID: address.id));
                                        }
                                      },
                                      length: LocalStorage.instance
                                          .getNewAddresses()
                                          .length,
                                      address: address,
                                      onDelete: () {
                                        notifier.deleteNewAddress(
                                            address, context);
                                      },
                                      onTap: () =>
                                          notifier.makeDefaultAddress(index),
                                    );
                                  },
                                ),
                                if (state.isMoreLoading)
                                  const ProductHorizontalListShimmer(
                                    height: 110,
                                    spacing: 10,
                                    verticalPadding: 30,
                                  )
                              ])
                        : Center(
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Container(
                                  width: 142.r,
                                  height: 142.r,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(8.r),
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
                                  '${AppHelpers.getTranslation(TrKeys.thereAreNoItemsInThe)} ${AppHelpers.getTranslation(TrKeys.savedLocations).toLowerCase()}',
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
                          )),
              ),
              BlurLoadingWidget(isLoading: state.isUpdating),
            ],
          ),
          bottomNavigationBar: Padding(
            padding: REdgeInsets.only(left: 15, right: 15, bottom: 24),
            child: AccentLoginButton(
              title: AppHelpers.getTranslation(TrKeys.addLocation),
              onPressed: () {
                return context.pushRoute(AddAddressRoute(isRequired: false));
              },
            ),
          ),
        ),
      ),
    );
  }
}
