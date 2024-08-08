import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_remix/flutter_remix.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../../core/constants/constants.dart';
import '../../../../../core/routes/app_router.gr.dart';
import '../../../../../core/utils/utils.dart';
import '../../../../components/components.dart';
import '../../../../theme/theme.dart';
import '../../home/widgets/drawer/new_address_item.dart';
import '../riverpod/provider/address_modal_provider.dart';

class AddressesModal extends ConsumerWidget {
  const AddressesModal({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, ref) {
    final bool isDarkMode = LocalStorage.instance.getAppThemeMode();
    final bool isLtr = LocalStorage.instance.getLangLtr();
    final notifier = ref.read(addressModalProvider.notifier);
    final state = ref.watch(addressModalProvider);
    return Directionality(
      textDirection: isLtr ? TextDirection.ltr : TextDirection.rtl,
      child: Padding(
        padding: REdgeInsets.symmetric(horizontal: 15),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            10.verticalSpace,
            Container(
              width: 49.r,
              height: 4.r,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(62.r),
                color: isDarkMode
                    ? AppColors.dragElementDark
                    : AppColors.dragElement,
              ),
            ),
            16.verticalSpace,
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  AppHelpers.getTranslation(TrKeys.address).toUpperCase(),
                  style: GoogleFonts.cairo(
                    fontSize: 18.sp,
                    fontWeight: FontWeight.w500,
                    letterSpacing: -14 * 0.01,
                    color: isDarkMode ? AppColors.white : AppColors.black,
                  ),
                ),
                TextButton(
                  style: ButtonStyle(
                    overlayColor: MaterialStateColor.resolveWith(
                      (states) => isDarkMode
                          ? AppColors.mainBackDark
                          : AppColors.dontHaveAccBtnBack,
                    ),
                  ),
                  onPressed: () async {
                    if (LocalStorage.instance.getUser() == null) {
                      LocalStorage.instance.deleteToken();
                      AppHelpers.showCheckFlash(
                        context,
                        AppHelpers.getTranslation(TrKeys.youNeedToLoginFirst),
                      );
                      context.router.pushAndPopUntil(
                        const LoginRoute(),
                        predicate: (route) => false,
                      );
                    } else {
                      await context
                          .pushRoute(AddAddressRoute(isRequired: false));
                      notifier.changeLocalAddress(0);
                    }
                  },
                  child: Row(
                    children: [
                      Icon(
                        FlutterRemix.add_line,
                        size: 20.r,
                        color: isDarkMode ? AppColors.white : AppColors.black,
                      ),
                      5.horizontalSpace,
                      Text(
                        AppHelpers.getTranslation(TrKeys.addNewAddress),
                        style: GoogleFonts.cairo(
                          fontWeight: FontWeight.w500,
                          fontSize: 14.sp,
                          color: isDarkMode ? AppColors.white : AppColors.black,
                          letterSpacing: -14 * 0.03,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            Container(
              constraints: BoxConstraints(
                maxHeight: 400.h,
              ),
              child: ListView.builder(
                  physics: const CustomBouncingScrollPhysics(),
                  shrinkWrap: true,
                  padding: REdgeInsets.only(top: 30, bottom: 24),
                  itemCount: state.addresses.length,
                  itemBuilder: (context, index) {
                    final address = state.addresses[index];
                    return NewAddressItem(
                      address: address,
                      onTap: () {
                        notifier.changeLocalAddress(index);
                        context.popRoute();
                      },
                    );
                  }),
            ),
          ],
        ),
      ),
    );
  }
}
