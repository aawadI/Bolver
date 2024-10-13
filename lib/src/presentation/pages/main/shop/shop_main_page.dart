import 'dart:io';
import 'dart:ui';

import 'package:auto_route/auto_route.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_remix/flutter_remix.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../../core/constants/constants.dart';
import '../../../../core/routes/app_router.gr.dart';
import '../../../../core/utils/utils.dart';
import '../../../../models/data/remote_message_data.dart';
import '../../../../riverpod/provider/app_provider.dart';
import '../../../components/components.dart';
import '../../../theme/theme.dart';
import '../../pages.dart';
import '../profile/profile_modal.dart';
import 'liked/riverpod/provider/liked_provider.dart';

class ShopMainPage extends ConsumerStatefulWidget {
  const ShopMainPage({Key? key}) : super(key: key);

  @override
  ConsumerState<ShopMainPage> createState() => _ShopMainPageState();
}

class _ShopMainPageState extends ConsumerState<ShopMainPage> {
  @override
  @override
  void initState() {
    //initDynamicLinks();
    FirebaseMessaging.instance.requestPermission(
      sound: true,
      alert: true,
      badge: false,
    );

    FirebaseMessaging.onMessageOpenedApp.listen((RemoteMessage message) async {
      RemoteMessageData data = RemoteMessageData.fromJson(message.data);
      if (data.type == "news_publish") {
        context.router.popUntilRoot();
        // ignore: deprecated_member_use
        await launch(
          "${AppConstants.baseUrl}/blog/${message.data["uuid"]}",
          forceSafariVC: true,
          forceWebView: true,
          enableJavaScript: true,
        );
      } else {
        context.router.popUntilRoot();
        context.pushRoute(
          OrderDetailsRoute(
              orderId: data.id?.toInt() ?? 0,
              date: message.sentTime.toString()),
        );
      }
    });

    FirebaseMessaging.onMessage.listen((RemoteMessage message) {
      RemoteMessageData data = RemoteMessageData.fromJson(message.data);
      if (data.type == "news_publish") {
        AppHelpers.showCheckTopSnackBarInfo(
            context, "${message.notification?.body}", onTap: () async {
          Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const NotificationsPage(),
              ));
          // ignore: deprecated_member_use
          // await launch(
          //   "${AppConstants.baseUrl}/blog/${message.data["uuid"]}",
          //   forceSafariVC: true,
          //   forceWebView: true,
          //   enableJavaScript: true,
          // );
        });
      } else {
        AppHelpers.showCheckTopSnackBarInfo(context,
            "${AppHelpers.getTranslation(TrKeys.id)} #${message.notification?.title} ${message.notification?.body}",
            onTap: () async {
              context.router.popUntilRoot();
              context.pushRoute(
                OrderDetailsRoute(
                    orderId: data.id?.toInt() ?? 0,
                    date: message.sentTime.toString()),
              );
            });
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final bool isDarkMode = ref.watch(appProvider).isDarkMode;
    final bool isLtr = ref.watch(appProvider).isLtr;
    return Directionality(
      textDirection: isLtr ? TextDirection.ltr : TextDirection.rtl,
      child: KeyboardDismisser(
        child: AutoTabsScaffold(
          backgroundColor:
          isDarkMode ? AppColors.dontHaveAnAccBackDark : AppColors.white,
          extendBody: true,
          appBarBuilder: (context, tabsRouter) {
            return tabsRouter.activeIndex == 0
                ? AppBar(
              backgroundColor: isDarkMode
                  ? AppColors.dontHaveAnAccBackDark
                  : AppColors.white,
              elevation: 0,
              leadingWidth: 0.r,
              leading: const SizedBox.shrink(),
              centerTitle: false,
              // title: Text(
              //   '${AppHelpers.getAppName()}',
              //   style: GoogleFonts.cairo(
              //     fontSize: 15.sp,
              //     fontWeight: FontWeight.w500,
              //     color: isDarkMode ? AppColors.white : AppColors.black,
              //     letterSpacing: -0.7,
              //   ),
              // ),
              title: Image.network(
                "https://api.bolversa.com/storage/images/languages/101-1713042860.webp",
                scale: 5,
                color: isDarkMode ? AppColors.white : AppColors.black,
              ),
              actions: [
                IconButton(
                  splashRadius: 18.r,
                  onPressed: () =>
                      context.pushRoute(const NotificationsRoute()),
                  icon: Icon(
                    FlutterRemix.notification_line,
                    color: isDarkMode ? AppColors.white : AppColors.black,
                    size: 22.r,
                  ),
                ),
              ],
            )
                : tabsRouter.activeIndex == 1
                ? AppBar(
              backgroundColor: isDarkMode
                  ? AppColors.dontHaveAnAccBackDark
                  : AppColors.white,
              elevation: 0,
              leadingWidth: 0.r,
              leading: const SizedBox.shrink(),
              centerTitle: true,
              title: Text(
                AppHelpers.getTranslation(TrKeys.categories)
                    .toUpperCase(),
                style: GoogleFonts.cairo(
                  fontSize: 15.sp,
                  fontWeight: FontWeight.w500,
                  color:
                  isDarkMode ? AppColors.white : AppColors.black,
                  letterSpacing: -0.7,
                ),
              ),
            )
                : AppBar(
              backgroundColor: isDarkMode
                  ? AppColors.dontHaveAnAccBackDark
                  : AppColors.white,
              elevation: 0,
              leadingWidth: 0.r,
              leading: const SizedBox.shrink(),
              title: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    AppHelpers.getTranslation(TrKeys.likedProducts)
                        .toUpperCase(),
                    style: GoogleFonts.cairo(
                      fontSize: 15.sp,
                      fontWeight: FontWeight.w500,
                      letterSpacing: -0.7,
                      color: isDarkMode
                          ? AppColors.white
                          : AppColors.black,
                    ),
                  ),
                  10.horizontalSpace,
                  Container(
                    width: 4.r,
                    height: 4.r,
                    decoration: BoxDecoration(
                      color: isDarkMode
                          ? AppColors.white.withOpacity(0.5)
                          : AppColors.brandTitleDivider
                          .withOpacity(0.4),
                      borderRadius: BorderRadius.circular(2.r),
                    ),
                  ),
                  7.horizontalSpace,
                  Text(
                    '${LocalStorage.instance.getLikedProductsList().length} ${AppHelpers.getTranslation(TrKeys.products)}',
                    style: GoogleFonts.cairo(
                      fontSize: 12.sp,
                      fontWeight: FontWeight.w500,
                      letterSpacing: -0.7,
                      color: isDarkMode
                          ? AppColors.white
                          : AppColors.black,
                    ),
                  ),
                ],
              ),
              centerTitle: true,
            );
          },
          routes: const [
            ShopDetailsRoute(),
            CategoriesRoute(),
            LikedRoute(),
          ],
          bottomNavigationBuilder: (context, tabRouter) {
            return ClipRRect(
              child: BackdropFilter(
                filter: ImageFilter.blur(sigmaX: 3.5, sigmaY: 3.5),
                child: Container(
                    height: Platform.isAndroid ? 72.r : 99.r,
                    decoration: BoxDecoration(
                      color: isDarkMode
                          ? AppColors.dontHaveAnAccBackDark.withOpacity(0.7)
                          : AppColors.white.withOpacity(0.7),
                      boxShadow: [
                        BoxShadow(
                          color: AppColors.bottomNavigationShadow,
                          spreadRadius: 25.r,
                          blurRadius: 35.r,
                          offset: Offset(0.r, 0.r),
                        ),
                      ],
                    ),
                    alignment: Alignment.bottomCenter,
                    child: BottomNavigationBar(
                      selectedItemColor:
                      isDarkMode ? AppColors.white : AppColors.black,
                      selectedLabelStyle: GoogleFonts.cairo(
                        color: isDarkMode ? AppColors.white : AppColors.black,
                        fontSize: 11.sp,
                        fontWeight: FontWeight.w600,
                      ),
                      currentIndex: tabRouter.activeIndex,
                      unselectedItemColor: AppColors.unselectedBottomItem,
                      backgroundColor: AppColors.bottomNavigationBack,
                      onTap: (index) {
                        if (index == 3) {
                          context.pushRoute(const OrderRoute());
                          return;
                        } else if (index == 4) {
                          AppHelpers.showCustomModalBottomSheet(
                            context: context,
                            modal: const ProfileModal(),
                            isDarkMode: isDarkMode,
                            paddingTop: 50,
                          );
                          return;
                        }
                        if (index == 2 && tabRouter.activeIndex != 2) {
                          ref.read(likedProvider.notifier).fetchLikedProducts();
                        }
                        tabRouter.setActiveIndex(index);
                      },
                      type: BottomNavigationBarType.fixed,
                      elevation: 0,
                      showSelectedLabels: true,
                      showUnselectedLabels: true,
                      items: [
                        _barItem(
                          iconData: FlutterRemix.store_2_fill,
                          // label: '${AppHelpers.getAppName()}',
                          label: AppHelpers.getTranslation(TrKeys.HomeScreen),
                          isSelected: tabRouter.activeIndex == 0,
                        ),
                        _barItem(
                          iconData: FlutterRemix.apps_2_fill,
                          label: AppHelpers.getTranslation(TrKeys.categories),
                          isSelected: tabRouter.activeIndex == 1,
                        ),
                        _barItem(
                          iconData: FlutterRemix.heart_3_fill,
                          label: AppHelpers.getTranslation(TrKeys.liked),
                          isSelected: tabRouter.activeIndex == 2,
                        ),
                        _barItem(
                          iconData: FlutterRemix.shopping_bag_3_fill,
                          label: AppHelpers.getTranslation(TrKeys.cart),
                          isSelected: tabRouter.activeIndex == 3,
                        ),
                        BottomNavigationBarItem(
                          icon: CommonImage(
                            imageUrl: LocalStorage.instance.getProfileImage(),
                            width: 34,
                            height: 34,
                            radius: 20,
                            errorRadius: 20,
                          ),
                          label: AppHelpers.getTranslation(TrKeys.profile),
                        ),
                      ],
                    )),
              ),
            );
          },
        ),
      ),
    );
  }

  BottomNavigationBarItem _barItem(
      {required IconData iconData,
        required String label,
        required bool isSelected}) {
    final bool isDarkMode = LocalStorage.instance.getAppThemeMode();
    return BottomNavigationBarItem(
      icon: Badge(
        isLabelVisible: label == AppHelpers.getTranslation(TrKeys.order),
        label: Consumer(
          builder: (context, ref, child) {
            return Text(
              LocalStorage.instance.getCartProducts().length.toString(),
              style: GoogleFonts.cairo(
                color: isDarkMode ? AppColors.white : AppColors.black,
                fontSize: 11.sp,
                fontWeight: FontWeight.w600,
              ),
            );
          },
        ),
        child: Icon(
          iconData,
          color: isSelected
              ? (isDarkMode ? AppColors.white : AppColors.black)
              : (isDarkMode
              ? AppColors.white.withOpacity(0.5)
              : AppColors.unselectedBottomItem),
          size: 24.r,
        ),
      ),
      label: label,
    );
  }
}