import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import '../../../../../../core/constants/constants.dart';
import '../../../../../../core/utils/utils.dart';
import '../../../../../components/components.dart';
import '../../../../../theme/theme.dart';
import '../riverpod/provider/new_address_provider.dart';
import '../riverpod/provider/search_address_provider.dart';

class SearchLocationModal extends ConsumerWidget {
  final GoogleMapController? mapController;

  const SearchLocationModal({Key? key, this.mapController}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final bool isDarkMode = LocalStorage.instance.getAppThemeMode();
    final bool isLtr = LocalStorage.instance.getLangLtr();
    return Directionality(
      textDirection: isLtr ? TextDirection.ltr : TextDirection.rtl,
      child: KeyboardDismisser(
        child: AnimatedPadding(
          padding: REdgeInsets.only(
            bottom: MediaQuery.of(context).viewInsets.bottom,
          ),
          duration: Duration.zero,
          child: Padding(
            padding: REdgeInsets.symmetric(horizontal: 15),
            child: SingleChildScrollView(
              physics: const CustomBouncingScrollPhysics(),
              child: Consumer(
                builder: (context, ref, child) {
                  final state = ref.watch(searchAddressProvider);
                  final event = ref.read(searchAddressProvider.notifier);
                  final addressEvent = ref.read(newAddressProvider.notifier);
                  return Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      11.verticalSpace,
                      Container(
                        width: 49.r,
                        height: 3.r,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(62.r),
                          color: isDarkMode
                              ? AppColors.dragElementDark
                              : AppColors.dragElement,
                        ),
                      ),
                      13.verticalSpace,
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          AppHelpers.getTranslation(TrKeys.search)
                              .toUpperCase(),
                          style: GoogleFonts.cairo(
                            fontSize: 18.sp,
                            fontWeight: FontWeight.w500,
                            color:
                                isDarkMode ? AppColors.white : AppColors.black,
                            letterSpacing: -14 * 0.01,
                          ),
                        ),
                      ),
                      28.verticalSpace,
                      OutlinedBorderTextField(
                        label: AppHelpers.getTranslation(TrKeys.searchLocation),
                        autofocus: true,
                        onChanged: event.setQuery,
                      ),
                      20.verticalSpace,
                      ListView.builder(
                        physics: const CustomBouncingScrollPhysics(),
                        shrinkWrap: true,
                        itemCount: state.searchedLocations.length,
                        itemBuilder: (context, index) {
                          final location = state.searchedLocations[index];
                          return SearchedLocationItem(
                            location: location,
                            onTap: () {
                              // debugPrint('===> searched location item ${location.id}');
                              // debugPrint('===> searched location item ${location.placeId}');
                              // return;
                              FocusManager.instance.primaryFocus?.unfocus();
                              addressEvent.goToLocation(
                                place: location,
                                mapController: mapController,
                              );
                              context.popRoute();
                            },
                            isLast: state.searchedLocations.length == index + 1,
                          );
                        },
                      ),
                      30.verticalSpace,
                    ],
                  );
                },
              ),
            ),
          ),
        ),
      ),
    );
  }
}
