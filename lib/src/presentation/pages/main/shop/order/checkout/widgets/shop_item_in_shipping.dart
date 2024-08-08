// import 'package:flutter/material.dart';
// import 'package:flutter_remix/flutter_remix.dart';
// import 'package:flutter_riverpod/flutter_riverpod.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:google_fonts/google_fonts.dart';
// import 'package:intl/intl.dart';
//
// import '../../../../../../../core/constants/constants.dart';
// import '../../../../../../../core/utils/utils.dart';
// import '../../../../../../../models/models.dart';
// import '../../../../../../theme/theme.dart';
// import '../riverpod/provider/checkout_provider.dart';
//
// class ShopItemInShipping extends ConsumerWidget {
//   final int index;
//   final ShopData shop;
//
//   const ShopItemInShipping({Key? key, required this.index, required this.shop})
//       : super(key: key);
//
//   @override
//   Widget build(BuildContext context, WidgetRef ref) {
//     var iconEnabled = 0;
//     final state = ref.watch(checkoutProvider);
//     final notifier = ref.read(checkoutProvider.notifier);
//     final bool isDarkMode = LocalStorage.instance.getAppThemeMode();
//     return Row(
//       mainAxisAlignment: MainAxisAlignment.spaceBetween,
//       children: [
//         InkWell(
//           onTap: () {
//             notifier.setSelectedShopIndex(index);
//             if (shop.translation?.title?.toUpperCase() == 'PICKUP') {
//               notifier.changeDeliveryType(DeliveryTypeEnum.pickup, shop: shop);
//             } else {
//               notifier.changeDeliveryType(DeliveryTypeEnum.delivery,
//                   shop: shop);
//             }
//           },
//           child: Container(
//             width: 130.w,
//             height: 120.r,
//             decoration: BoxDecoration(
//                 borderRadius: BorderRadius.all(Radius.circular(12.r)),
//                 color: isDarkMode ? AppColors.mainBackDark : AppColors.white,
//                 border: Border.all(color: AppColors.unselectedTab)),
//             margin: REdgeInsets.only(left: 8),
//             padding: REdgeInsets.all(8),
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 Row(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   //  mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                   children: [
//                     Text(
//                       '${shop.translation?.title}',
//                       maxLines: 1,
//                       style: GoogleFonts.cairo(
//                         fontWeight: FontWeight.w600,
//                         fontSize: 16.sp,
//                         color: isDarkMode ? AppColors.white : AppColors.black,
//                         letterSpacing: -1,
//                       ),
//                     ),
//                     const Spacer(),
//                     state.selectedShopIndex == index
//                         ? Container(
//                             width: 18.r,
//                             height: 18.r,
//                             decoration: BoxDecoration(
//                               borderRadius: BorderRadius.circular(9.r),
//                               color: AppColors.accentGreen,
//                             ),
//                             alignment: Alignment.center,
//                             child: Icon(
//                               FlutterRemix.check_line,
//                               color: AppColors.white,
//                               size: 15.r,
//                             ),
//                           )
//                         : Container(
//                             width: 15.r,
//                             height: 15.r,
//                             decoration: BoxDecoration(
//                               borderRadius: BorderRadius.circular(9.r),
//                               color: AppColors.white,
//                               border: Border.all(
//                                 width: 1.r,
//                                 color: AppColors.black,
//                               ),
//                             ),
//                           ),
//                   ],
//                 ),
//                 Column(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   mainAxisSize: MainAxisSize.min,
//                   children: [
//                     Text(
//                       '${shop.times.toString().replaceAll('[', '').replaceAll(']', '').replaceAll(',', ' - ')}  days',
//                       style: GoogleFonts.cairo(
//                         fontWeight: FontWeight.w600,
//                         fontSize: 14.sp,
//                         color: isDarkMode ? AppColors.white : AppColors.black,
//                         letterSpacing: -1,
//                       ),
//                     ),
//                     6.verticalSpace,
//                     Text(
//                       NumberFormat.currency(
//                         symbol:
//                             LocalStorage.instance.getSelectedCurrency()?.symbol,
//                       ).format(shop.price),
//                       style: GoogleFonts.cairo(
//                         fontSize: 12.sp,
//                         fontWeight: FontWeight.w700,
//                         letterSpacing: -0.3,
//                         color: isDarkMode
//                             ? AppColors.white
//                             : AppColors.unselectedTab,
//                       ),
//                     ),
//                   ],
//                 )
//               ],
//             ),
//           ),
//         ),
//       ],
//     );
//   }
// }
import 'package:flutter/material.dart';
import 'package:flutter_remix/flutter_remix.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';

import '../../../../../../../core/constants/constants.dart';
import '../../../../../../../core/utils/utils.dart';
import '../../../../../../../models/models.dart';
import '../../../../../../theme/app_colors.dart';
import '../riverpod/provider/checkout_provider.dart';

class ShopItemInShipping extends ConsumerStatefulWidget {
  final int index;
  final ShopData shop;

  const ShopItemInShipping({Key? key, required this.index, required this.shop})
      : super(key: key);

  @override
  _ShopItemInShippingState createState() => _ShopItemInShippingState();
}

class _ShopItemInShippingState extends ConsumerState<ShopItemInShipping> {
  @override
  void initState() {
    super.initState();

    // Automatically trigger the notifier when the widget is initialized
    WidgetsBinding.instance.addPostFrameCallback((_) {
      final state = ref.read(checkoutProvider);
      final notifier = ref.read(checkoutProvider.notifier);

      // if (state.selectedShopIndex != widget.index) {
      //   notifier.setSelectedShopIndex(widget.index);
      //   if (widget.shop.translation?.title?.toUpperCase() == 'PICKUP') {
      //     notifier.changeDeliveryType(DeliveryTypeEnum.pickup,
      //         shop: widget.shop);
      //   } else {
      //     notifier.changeDeliveryType(DeliveryTypeEnum.delivery,
      //         shop: widget.shop);
      //   }
      // }
      if (true) {
        notifier.setSelectedShopIndex(widget.index);
        if (false) {
          notifier.changeDeliveryType(DeliveryTypeEnum.pickup,
              shop: widget.shop);
        } else {
          notifier.changeDeliveryType(DeliveryTypeEnum.delivery,
              shop: widget.shop);
        }
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final state = ref.watch(checkoutProvider);
    final bool isDarkMode = LocalStorage.instance.getAppThemeMode();

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Container(
          width: 130.w,
          height: 120.r,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(12.r)),
            color: isDarkMode ? AppColors.mainBackDark : AppColors.white,
            border: Border.all(color: AppColors.unselectedTab),
          ),
          margin: REdgeInsets.only(left: 8),
          padding: REdgeInsets.all(8),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    '${widget.shop.translation?.title}',
                    maxLines: 1,
                    style: GoogleFonts.cairo(
                      fontWeight: FontWeight.w600,
                      fontSize: 16.sp,
                      color: isDarkMode ? AppColors.white : AppColors.black,
                      letterSpacing: -1,
                    ),
                  ),
                  const Spacer(),
                  state.selectedShopIndex == widget.index
                      ? Container(
                          width: 18.r,
                          height: 18.r,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(9.r),
                            color: AppColors.accentGreen,
                          ),
                          alignment: Alignment.center,
                          child: Icon(
                            FlutterRemix.check_line,
                            color: AppColors.white,
                            size: 15.r,
                          ),
                        )
                      : Container(
                          width: 15.r,
                          height: 15.r,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(9.r),
                            color: AppColors.white,
                            border: Border.all(
                              width: 1.r,
                              color: AppColors.black,
                            ),
                          ),
                        ),
                ],
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    '${widget.shop.times.toString().replaceAll('[', '').replaceAll(']', '').replaceAll(',', ' - ')}  days',
                    style: GoogleFonts.cairo(
                      fontWeight: FontWeight.w600,
                      fontSize: 14.sp,
                      color: isDarkMode ? AppColors.white : AppColors.black,
                      letterSpacing: -1,
                    ),
                  ),
                  6.verticalSpace,
                  Text(
                    NumberFormat.currency(
                      symbol:
                          LocalStorage.instance.getSelectedCurrency()?.symbol,
                    ).format(widget.shop.price),
                    style: GoogleFonts.cairo(
                      fontSize: 12.sp,
                      fontWeight: FontWeight.w700,
                      letterSpacing: -0.3,
                      color: isDarkMode
                          ? AppColors.white
                          : AppColors.unselectedTab,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }
}
