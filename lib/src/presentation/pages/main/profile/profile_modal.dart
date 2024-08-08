import 'package:auto_route/auto_route.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_remix/flutter_remix.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../core/constants/constants.dart';
import '../../../../core/routes/app_router.gr.dart';
import '../../../../core/utils/utils.dart';
import '../../../components/components.dart';
import '../../../theme/theme.dart';
import 'chat/riverpod/provider/chat_provider.dart';
import 'riverpod/provider/address_modal_provider.dart';
import 'widgets/address_button.dart';
import 'widgets/image_wallet_settings.dart';
import 'widgets/logout_modal.dart';
import 'widgets/profile_menu_button.dart';

class ProfileModal extends ConsumerStatefulWidget {
  const ProfileModal({Key? key}) : super(key: key);

  @override
  ConsumerState<ProfileModal> createState() => _ProfileModalState();
}

class _ProfileModalState extends ConsumerState<ProfileModal> {
  final FirebaseFirestore _fireStore = FirebaseFirestore.instance;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback(
      (_) {
        ref.read(addressModalProvider.notifier).fetchLocalAddresses();
        ref.read(chatProvider.notifier).fetchChats(context);
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final bool isDarkMode = LocalStorage.instance.getAppThemeMode();
    final chatState = ref.watch(chatProvider);
    final chatNotifier = ref.read(chatProvider.notifier);
    final bool isLtr = LocalStorage.instance.getLangLtr();
    return Directionality(
      textDirection: isLtr ? TextDirection.ltr : TextDirection.rtl,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          12.verticalSpace,
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
          Align(
            alignment: AlignmentDirectional.centerEnd,
            child: Container(
              width: 20.r,
              height: 20.r,
              margin: EdgeInsetsDirectional.only(end: 15.r),
              child: IconButton(
                padding: EdgeInsets.zero,
                splashRadius: 20.r,
                onPressed: context.popRoute,
                icon: Icon(
                  FlutterRemix.close_circle_fill,
                  size: 20.r,
                  color: isDarkMode
                      ? AppColors.white
                      : AppColors.black.withOpacity(0.3),
                ),
              ),
            ),
          ),
          if (LocalStorage.instance.getUser() != null)
            Align(
              alignment: AlignmentDirectional.centerStart,
              child: Padding(
                padding: EdgeInsetsDirectional.only(start: 15.r),
                child: const AddressButton(),
              ),
            ),
          15.verticalSpace,
          Divider(
            thickness: 1.r,
            height: 0.r,
            color: isDarkMode
                ? AppColors.white.withOpacity(0.06)
                : AppColors.black.withOpacity(0.01),
          ),
          15.verticalSpace,
          Expanded(
            child: Padding(
              padding: REdgeInsets.symmetric(horizontal: 15),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const ImageWalletSettings(),
                  16.verticalSpace,
                  Expanded(
                    child: ListView(
                      shrinkWrap: true,
                      physics: const CustomBouncingScrollPhysics(),
                      children: [
                        // ProfileMenuButton(
                        //   title: AppHelpers.getTranslation(TrKeys.uiType),
                        //   iconData: FlutterRemix.typhoon_line,
                        //   onTap: () {
                        //     context.pushRoute(UiTypeRoute(isBack: true));
                        //   },
                        // ),
                        if (LocalStorage.instance.getUser() != null)
                          ProfileMenuButton(
                            iconData: FlutterRemix.user_settings_line,
                            title: AppHelpers.getTranslation(
                                TrKeys.personalInformation),
                            onTap: () {
                              if (LocalStorage.instance.getToken().isEmpty) {
                                LocalStorage.instance.deleteToken();
                                AppHelpers.showCheckFlash(
                                  context,
                                  AppHelpers.getTranslation(
                                      TrKeys.youNeedToLoginFirst),
                                );
                                context.replaceRoute(const LoginRoute());
                                return;
                              }
                              context.router
                                  .popAndPush(const ProfileSettingsRoute());
                            },
                          ),
                        // ProfileMenuButton(
                        //   iconData: FlutterRemix.bookmark_3_line,
                        //   title: AppHelpers.getTranslation(TrKeys.savedStores),
                        //   onTap: () => context.router
                        //       .popAndPush(const SavedStoresRoute()),
                        // ),
                        ProfileMenuButton(
                          iconData: FlutterRemix.percent_line,
                          title: AppHelpers.getTranslation(TrKeys.discount),
                          onTap: () => context.router
                              .popAndPush(DiscountProductsRoute()),
                        ),
                        ProfileMenuButton(
                          iconData: FlutterRemix.eye_line,
                          title:
                              AppHelpers.getTranslation(TrKeys.viewedProducts),
                          onTap: () =>
                              context.router.popAndPush(ViewedProductsRoute()),
                        ),
                        if (LocalStorage.instance.getUser() != null)
                          ProfileMenuButton(
                            iconData: FlutterRemix.bank_card_line,
                            title:
                                AppHelpers.getTranslation(TrKeys.walletHistory),
                            onTap: () => context.router
                                .popAndPush(const WalletHistoriesRoute()),
                          ),
                        ProfileMenuButton(
                          iconData: FlutterRemix.shirt_line,
                          title: AppHelpers.getTranslation(TrKeys.blogs),
                          onTap: () =>
                              context.router.popAndPush(const BlogRoute()),
                        ),
                        if (LocalStorage.instance.getUser() != null)
                          ProfileMenuButton(
                            iconData: FlutterRemix.map_pin_2_line,
                            title: AppHelpers.getTranslation(
                                TrKeys.savedLocations),
                            onTap: () => context.router
                                .popAndPush(const SavedLocationsRoute()),
                          ),
                        if (LocalStorage.instance.getUser() != null)
                          ProfileMenuButton(
                            iconData: FlutterRemix.file_list_2_line,
                            title:
                                AppHelpers.getTranslation(TrKeys.orderHistory),
                            onTap: () {
                              if (LocalStorage.instance.getToken().isEmpty) {
                                LocalStorage.instance.deleteToken();
                                AppHelpers.showCheckFlash(
                                  context,
                                  AppHelpers.getTranslation(
                                      TrKeys.youNeedToLoginFirst),
                                );
                                context.replaceRoute(const LoginRoute());
                                return;
                              }
                              context.router
                                  .popAndPush(const OrderHistoryRoute());
                            },
                          ),
                        if (LocalStorage.instance.getUser() != null)
                          ProfileMenuButton(
                            iconData: FlutterRemix.chat_smile_2_line,
                            title: AppHelpers.getTranslation(TrKeys.chat),
                            onTap: () => chatNotifier.checkAuthorised(context),
                            widget: chatState.isLoading
                                ? JumpingDots(
                                    color: isDarkMode
                                        ? AppColors.white
                                        : AppColors.black,
                                    radius: 5,
                                  )
                                : StreamBuilder<QuerySnapshot>(
                                    stream: _fireStore
                                        .collection('messages')
                                        .where('chat_id',
                                            isEqualTo: chatState.chatId)
                                        .where('unread', isEqualTo: true)
                                        .where('sender', isEqualTo: 0)
                                        .snapshots(),
                                    builder: (context, snapshot) {
                                      if (!snapshot.hasData) {
                                        return const SizedBox.shrink();
                                      }
                                      final List<DocumentSnapshot> docs =
                                          snapshot.data!.docs;
                                      if (docs.isEmpty) {
                                        return Container();
                                      }
                                      return Container(
                                        margin: REdgeInsets.only(right: 10),
                                        height: 24.r,
                                        width: 24.r,
                                        decoration: BoxDecoration(
                                          color: AppColors.red,
                                          borderRadius:
                                              BorderRadius.circular(12.r),
                                        ),
                                        alignment: Alignment.center,
                                        child: Text(
                                          docs.length.toString(),
                                          style: GoogleFonts.cairo(
                                            fontWeight: FontWeight.w500,
                                            fontSize: 12.sp,
                                            letterSpacing: -0.5,
                                            color: AppColors.white,
                                          ),
                                        ),
                                      );
                                    },
                                  ),
                          ),
                        if (LocalStorage.instance.getUser() != null)
                          ProfileMenuButton(
                            iconData: FlutterRemix.store_2_line,
                            title:
                                AppHelpers.getTranslation(TrKeys.becomeSeller),
                            onTap: () => context.router
                                .popAndPush(const BecomeSellerRoute()),
                          ),
                        ProfileMenuButton(
                          iconData: FlutterRemix.logout_circle_r_line,
                          title: LocalStorage.instance.getToken().isEmpty
                              ? AppHelpers.getTranslation(TrKeys.login)
                              : AppHelpers.getTranslation(TrKeys.logout),
                          onTap: () {
                            if (LocalStorage.instance.getToken().isEmpty) {
                              LocalStorage.instance.logout();
                              context.replaceRoute(const LoginRoute());
                            } else {
                              AppHelpers.showCustomModalBottomSheet(
                                context: context,
                                modal: const LogoutModal(),
                                isDarkMode: isDarkMode,
                              );
                            }
                          },
                        ),
                        LocalStorage.instance.getToken().isNotEmpty
                            ? ProfileMenuButton(
                                iconData: FlutterRemix.delete_bin_6_line,
                                title: AppHelpers.getTranslation(
                                    TrKeys.deleteAccount),
                                onTap: () {
                                  AppHelpers.showCustomModalBottomSheet(
                                    context: context,
                                    modal: const LogoutModal(
                                      isDeleteAccount: true,
                                    ),
                                    isDarkMode: isDarkMode,
                                  );
                                },
                              )
                            : const SizedBox.shrink(),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
