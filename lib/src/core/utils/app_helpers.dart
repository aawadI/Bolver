import 'package:flash/flash.dart';
import 'package:flutter/material.dart';
import 'package:flutter_remix/flutter_remix.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:top_snackbar_flutter/custom_snack_bar.dart';
import 'package:top_snackbar_flutter/top_snack_bar.dart';

import '../../models/models.dart';
import '../../presentation/pages/main/profile/order_history/widgets/shop_logo_in_order_history_item.dart';
import '../../presentation/theme/app_colors.dart';
import '../constants/constants.dart';
import 'local_storage.dart';

class AppHelpers {
  AppHelpers._();

  static int getOrderStatusNumber(NewOrderStatus status) {
    switch (status) {
      case NewOrderStatus.newOrder:
        return 1;
      case NewOrderStatus.ready:
        return 2;
      case NewOrderStatus.declarationInAdvance:
        return 5;
      case NewOrderStatus.externalWarehouse:
        return 7;
      case NewOrderStatus.onTheWay:
        return 8;
      case NewOrderStatus.atCustoms:
        return 36;
      case NewOrderStatus.localWarehouse:
        return 9;
      case NewOrderStatus.inTheCourier:
        return 11;
      case NewOrderStatus.delivered:
        return 12;
      default:
        return 1;
    }
  }

  static bool checkIsSvg(String? url) {
    if (url == null) {
      return false;
    }
    final length = url.length;
    if (length < 3) {
      return false;
    }
    return url.substring(length - 3, length) == 'svg';
  }

  static List<Extras> getAllCheckedExtras(List<ExtraGroup> groups) {
    List<Extras> checked = [];
    for (final group in groups) {
      final List<Extras> extras = group.filterExtras ?? [];
      for (final item in extras) {
        if (item.isCheckedForFilter ?? false) {
          checked.add(item);
        }
      }
    }
    return checked;
  }

  static List<BrandData> getCheckedBrands(List<BrandData> brands) {
    List<BrandData> checked = [];
    for (final brand in brands) {
      if (brand.isCheckedForFilter ?? false) {
        checked.add(brand);
      }
    }
    return checked;
  }

  static List<Extras> getCheckedExtras(List<Extras>? extras) {
    if (extras == null || extras.isEmpty) {
      return [];
    }
    List<Extras> checked = [];
    for (final item in extras) {
      if (item.isCheckedForFilter ?? false) {
        checked.add(item);
      }
    }
    return checked;
  }

  static int getType() {
    // final List<SettingsData> settings = LocalStorage.instance.getSettingsList();
    // for (final setting in settings) {
    //   if (setting.key == 'ui_type') {
    //     return (int.tryParse(setting.value ?? "1") ?? 1) - 1;
    //   }
    // }
    // return 0;
    return LocalStorage.getUiType() ?? 0;
  }

  static List<ShopData> getCheckedShops(List<ShopData> shops) {
    List<ShopData> checked = [];
    for (final shop in shops) {
      if (shop.visibility ?? false) {
        checked.add(shop);
      }
    }
    return checked;
  }

  static showCheckTopSnackBarInfo(BuildContext context, String text,
      {VoidCallback? onTap}) {
    return showTopSnackBar(
        context,
        CustomSnackBar.info(
          message: text,
        ),
        onTap: onTap);
  }

  static int getSubCategoriesLength(int length, int? index) {
    if (index == 0) {
      return 2;
    }
    if (index == 1) {
      if (length > 5) {
        return 6;
      } else if (length % 2 == 1) {
        return length - 1;
      }
    }
    if (index == 2 || index == 3) {
      if (length > 5) {
        return 4;
      } else if (length % 2 == 1) {
        return length - 1;
      }
    }
    return length;
  }

  static showNoConnectionSnackBar(BuildContext context) {
    ScaffoldMessenger.of(context).hideCurrentSnackBar();
    final snackBar = SnackBar(
      backgroundColor: Colors.teal,
      behavior: SnackBarBehavior.floating,
      duration: const Duration(seconds: 3),
      content: Text(
        'No internet connection',
        style: GoogleFonts.cairo(
          fontSize: 14,
          fontWeight: FontWeight.w600,
          color: AppColors.white,
        ),
      ),
      action: SnackBarAction(
        label: 'Close',
        disabledTextColor: Colors.white,
        textColor: Colors.yellow,
        onPressed: () {
          ScaffoldMessenger.of(context).hideCurrentSnackBar();
        },
      ),
    );
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }

  static bool isLikedProduct(int? id) {
    final List<int> likedProducts =
        LocalStorage.instance.getLikedProductsList();
    for (final likedId in likedProducts) {
      if (likedId == id) {
        return true;
      }
    }
    return false;
  }

  static ExtrasType getExtraTypeByValue(String? value) {
    switch (value) {
      case 'color':
        return ExtrasType.color;
      case 'text':
        return ExtrasType.text;
      case 'image':
        return ExtrasType.image;
      default:
        return ExtrasType.text;
    }
  }

  static OrderStatus getOrderStatus(String? value) {
    switch (value) {
      case 'accepted':
        return OrderStatus.accepted;
      case 'ready':
        return OrderStatus.ready;
      case 'on_a_way':
        return OrderStatus.onAWay;
      case 'delivered':
        return OrderStatus.delivered;
      default:
        return OrderStatus.accepted;
    }
  }

  static String getOrderStatusText(String? value) {
    switch (value) {
      case 'new':
        return 'new';
      case 'accepted':
        return 'accepted';
      case 'ready':
        return 'ready';
      case 'on_a_way':
        return 'on_a_way';
      case 'delivered':
        return 'delivered';
      default:
        return 'canceled';
    }
  }

  static String getOrderStatusTextNew(String? value) {
    switch (value) {
      case '1':
        return "New";
      case '2':
        return "Ready";
      case '5':
        return "Declaration in advance";
      case '7':
        return "External warehouse";
      case '8':
        return "On the way";
      case '36':
        return "At customs";
      case '9':
      case '10':
        return "Local warehouse";
      case '11':
        return "In the courier";
      case '12':
        return "Delivered";
      case '13':
        return "Canceled";
      default:
        return "Canceled";
    }
  }

  static IconData getOrderStatusIconNew(String? value) {
    switch (value) {
      case '1':
        return FlutterRemix.flag_fill;
      case '2':
        return FlutterRemix.file_list_line;
      case '5':
        return FlutterRemix.calendar_check_line;
      case '7':
        return FlutterRemix.file_user_line;
      case '8':
        return FlutterRemix.taxi_line;
      case '36':
        return FlutterRemix.map_2_line;
      case '9':
      case '10':
        return FlutterRemix.rocket_line;
      case '11':
        return FlutterRemix.check_line;
      case '12':
        return FlutterRemix.flag_fill;
      default:
        return FlutterRemix.flag_fill;
    }
  }

  static IconData getOrderStatusIcon(String? value) {
    switch (value) {
      case 'new':
        return FlutterRemix.flag_fill;
      case 'accepted':
        return FlutterRemix.check_double_fill;
      case 'ready':
        return FlutterRemix.check_fill;
      case 'on_a_way':
        return FlutterRemix.e_bike_2_fill;
      case 'delivered':
        return FlutterRemix.flag_fill;
      default:
        return FlutterRemix.flag_fill;
    }
  }

  static int getOrderProductsCount(OrderData orderData) {
    int count = 0;
    final int orderDetailsCount = orderData.orderDetailsCount ?? 0;
    for (int i = 0; i < orderDetailsCount; i++) {
      count += orderData.details?[i].orderStocks?.length ?? 0;
    }
    return count;
  }

  static List<Widget> getOrderShopLogos(
    List<ShopOrderDetails>? shops,
  ) {
    List<Widget> widgets = [];
    final List<ShopOrderDetails> orderDetails = shops ?? [];
    int positioningLeft = 0;
    for (int i = 0; i < orderDetails.length; i++) {
      widgets.add(
        ShopLogoInOrderHistoryItem(
          positioningLeft: positioningLeft,
          imageUrl: orderDetails[i].shop?.logoImg,
        ),
      );
      positioningLeft += 25;
    }
    return widgets;
  }

  static String getShopName(
    int shopId,
    List<ShopData> shops,
  ) {
    for (final shop in shops) {
      if (shop.id == shopId) {
        return shop.translation?.title ?? '';
      }
    }
    return '';
  }

  static RichText getSearchResultText(
    String mainText,
    String subtext,
  ) {
    final bool isDarkMode = LocalStorage.instance.getAppThemeMode();
    if (!mainText.toUpperCase().contains(subtext.toUpperCase())) {
      return RichText(
        text: TextSpan(
          text: mainText,
          style: GoogleFonts.cairo(
            fontWeight: FontWeight.w500,
            fontSize: 13.sp,
            color: isDarkMode
                ? AppColors.white.withOpacity(0.26)
                : AppColors.black.withOpacity(0.2),
            letterSpacing: -14 * 0.01,
          ),
        ),
      );
    }
    final int startIndex =
        mainText.toUpperCase().indexOf(subtext.toUpperCase());
    final String prefixText = mainText.substring(0, startIndex);
    final String centerText =
        mainText.substring(startIndex, startIndex + subtext.length);
    final hasPostText = subtext.length + startIndex < mainText.length - 1;
    final String postText = hasPostText
        ? mainText.substring(subtext.length + startIndex, mainText.length - 1)
        : '';
    return RichText(
      text: TextSpan(
        text: prefixText,
        style: GoogleFonts.cairo(
          fontWeight: FontWeight.w500,
          fontSize: 13.sp,
          color: isDarkMode
              ? AppColors.white.withOpacity(0.26)
              : AppColors.black.withOpacity(0.2),
          letterSpacing: -14 * 0.01,
        ),
        children: <TextSpan>[
          TextSpan(
            text: centerText,
            style: GoogleFonts.cairo(
              fontWeight: FontWeight.w500,
              fontSize: 13.sp,
              color: isDarkMode ? AppColors.white : AppColors.black,
              letterSpacing: -14 * 0.01,
            ),
          ),
          TextSpan(
            text: postText,
            style: GoogleFonts.cairo(
              fontWeight: FontWeight.w500,
              fontSize: 13.sp,
              color: isDarkMode
                  ? AppColors.white.withOpacity(0.26)
                  : AppColors.black.withOpacity(0.2),
              letterSpacing: -14 * 0.01,
            ),
          ),
        ],
      ),
    );
  }

  static showCheckFlash(BuildContext context, String text) {
    return showFlash(
      context: context,
      duration: const Duration(seconds: 3),
      builder: (BuildContext context, FlashController controller) {
        return Flash(
          controller: controller,
          backgroundColor: AppColors.mainBack,
          position: FlashPosition.top,
          borderRadius: BorderRadius.circular(8.r),
          behavior: FlashBehavior.floating,
          margin: REdgeInsets.all(15),
          brightness: Brightness.light,
          barrierBlur: 1.5.r,
          barrierColor: Colors.black38,
          barrierDismissible: true,
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8.r),
              border: Border.all(
                color: AppColors.dontHaveAccBtnBack,
                width: 2.r,
              ),
            ),
            child: Padding(
              padding: REdgeInsets.all(15),
              child: Text(
                text,
                style: GoogleFonts.cairo(
                  color: AppColors.black,
                  fontSize: 13.sp,
                  fontWeight: FontWeight.w500,
                  letterSpacing: -0.4,
                ),
                textAlign: TextAlign.center,
              ),
            ),
          ),
        );
      },
    );
  }

  static DateTime getMinTime(String openTime) {
    final int openHour = int.parse(openTime.substring(3, 5)) == 0
        ? int.parse(openTime.substring(0, 2))
        : int.parse(openTime.substring(0, 2)) + 1;
    final DateTime now = DateTime.now();
    return DateTime(now.year, now.month, now.day, openHour);
  }

  static DateTime getMaxTime(String closeTime) {
    final int closeHour = int.parse(closeTime.substring(0, 2));
    final DateTime now = DateTime.now();
    return DateTime(now.year, now.month, now.day, closeHour);
  }

  static double getOrderStatusProgress(String? status) {
    switch (status) {
      case 'new':
        return 0.2;
      case 'accepted':
        return 0.4;
      case 'ready':
        return 0.6;
      case 'on_a_way':
        return 0.8;
      case 'delivered':
        return 1;
      default:
        return 0;
    }
  }

  static double getOrderStatusProgressNew(String? status) {
    switch (status) {
      case '1':
        return 0.1;
      case '2':
        return 0.2;
      case '5':
        return 0.3;
      case '7':
        return 0.4;
      case '8':
        return 0.5;
      case '36':
        return 0.6;
      case '9':
      case '10':
        return 0.7;
      case '11':
        return 0.9;
      case '12':
        return 1;
      case '13':
        return 0;
      default:
        return 0;
    }
  }

  static String? getAppName() {
    final List<SettingsData> settings = LocalStorage.instance.getSettingsList();
    for (final setting in settings) {
      if (setting.key == 'title') {
        return setting.value;
      }
    }
    return 'GoShops';
  }

  static String getTranslation(String trKey) {
    final Map<String, dynamic> translations =
        LocalStorage.instance.getTranslations();
    for (final key in translations.keys) {
      if (trKey == key) {
        return translations[key];
      }
    }
    return trKey;
  }

  static double? getInitialLatitude() {
    final List<SettingsData> settings = LocalStorage.instance.getSettingsList();
    for (final setting in settings) {
      if (setting.key == 'location') {
        final String? latString =
            setting.value?.substring(0, setting.value?.indexOf(','));
        if (latString == null) {
          return null;
        }
        final double? lat = double.tryParse(latString);
        return lat;
      }
    }
    return null;
  }

  static double? getInitialLongitude() {
    final List<SettingsData> settings = LocalStorage.instance.getSettingsList();
    for (final setting in settings) {
      if (setting.key == 'location') {
        final String? latString =
            setting.value?.substring(0, setting.value?.indexOf(','));
        if (latString == null) {
          return null;
        }
        final String? lonString = setting.value
            ?.substring((latString.length) + 2, setting.value?.length);
        if (lonString == null) {
          return null;
        }
        final double lon = double.parse(lonString);
        return lon;
      }
    }
    return null;
  }

  static void showCustomModalBottomSheet({
    required BuildContext context,
    required Widget modal,
    required bool isDarkMode,
    int paddingTop = 200,
  }) {
    showModalBottomSheet(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(16.r),
          topRight: Radius.circular(16.r),
        ),
      ),
      isScrollControlled: true,
      constraints: BoxConstraints(
        maxHeight: MediaQuery.of(context).size.height - paddingTop.r,
      ),
      backgroundColor:
          isDarkMode ? AppColors.dontHaveAnAccBackDark : AppColors.white,
      context: context,
      builder: (context) => modal,
    );
  }

  static bool checkIfHex(String? type) {
    if (type == null || type.isEmpty) {
      return false;
    }
    if (type.length == 7 && type[0] == '#') {
      return true;
    } else {
      return false;
    }
  }

  static bool check(String type) {
    if (type.length == 7 && type[0] == "#") {
      return true;
    } else {
      return false;
    }
  }
}
