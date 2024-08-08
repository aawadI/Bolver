import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_remix/flutter_remix.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../../../../core/constants/constants.dart';
import '../../../../../../../core/routes/app_router.gr.dart';
import '../../../../../../../core/utils/utils.dart';
import '../../../../../../components/components.dart';
import '../../../../../../theme/theme.dart';
import '../../../../profile/riverpod/provider/address_modal_provider.dart';
import '../riverpod/provider/checkout_provider.dart';
import 'address_item_in_order_shipping.dart';

class AddressesModalInOrderShipping extends ConsumerWidget {
  const AddressesModalInOrderShipping({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(checkoutProvider);
    final notifier = ref.read(checkoutProvider.notifier);
    final notifierAddress = ref.read(addressModalProvider.notifier);
    final bool isDarkMode = LocalStorage.instance.getAppThemeMode();
    return Padding(
      padding: REdgeInsets.symmetric(horizontal: 15),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          11.verticalSpace,
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
            children: [
              Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  AppHelpers.getTranslation(TrKeys.address).toUpperCase(),
                  style: GoogleFonts.cairo(
                    fontSize: 18.sp,
                    fontWeight: FontWeight.w500,
                    letterSpacing: -14 * 0.01,
                    color: isDarkMode ? AppColors.white : AppColors.black,
                  ),
                ),
              ),
              const Spacer(),
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
                    await context.pushRoute(AddAddressRoute(isRequired: false));
                    // ignore: use_build_context_synchronously
                    Navigator.pop(context);
                    notifierAddress.changeLocalAddress(0);
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
              maxHeight: 400.h, // Set the maximum height here
            ),
            child: ListView.builder(
              physics: const CustomBouncingScrollPhysics(),
              shrinkWrap: true,
              padding: REdgeInsets.symmetric(vertical: 30),
              itemCount: LocalStorage.instance.getNewAddresses().length,
              itemBuilder: (context, index) {
                final address = LocalStorage.instance.getNewAddresses()[index];
                final isSelected = index == state.addressIndex;
                return AddressItemInOrderShipping(
                  isSelected: isSelected,
                  address: address,
                  onTap: () {
                    notifier.changeAddress(index);
                    context.popRoute();
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
