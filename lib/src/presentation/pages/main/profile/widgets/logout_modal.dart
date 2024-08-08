import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:google_sign_in/google_sign_in.dart';

import '../../../../../core/constants/constants.dart';
import '../../../../../core/routes/app_router.gr.dart';
import '../../../../../core/utils/utils.dart';
import '../../../../components/components.dart';
import '../../../../theme/theme.dart';
import '../settings/riverpod/provider/profile_settings_provider.dart';

class LogoutModal extends StatelessWidget {
  final bool isDeleteAccount;

  const LogoutModal({Key? key, this.isDeleteAccount = false}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final bool isDarkMode = LocalStorage.instance.getAppThemeMode();
    final bool isLtr = LocalStorage.instance.getLangLtr();
    return Directionality(
      textDirection: isLtr ? TextDirection.ltr : TextDirection.rtl,
      child: Padding(
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
            40.verticalSpace,
            Text(
              isDeleteAccount
                  ? '${AppHelpers.getTranslation(TrKeys.doYouReallyWantToDelete)}?'
                  : '${AppHelpers.getTranslation(TrKeys.doYouReallyWantToLogout)}?',
              style: GoogleFonts.cairo(
                fontSize: 18.sp,
                color: isDarkMode ? AppColors.white : AppColors.black,
                fontWeight: FontWeight.w500,
                letterSpacing: -14 * 0.02,
              ),
            ),
            36.verticalSpace,
            Row(
              children: [
                Expanded(
                  child: AccentLoginButton(
                    title: AppHelpers.getTranslation(TrKeys.cancel),
                    onPressed: () => context.popRoute(),
                  ),
                ),
                16.horizontalSpace,
                Expanded(
                  child: Consumer(
                    builder: (context, ref, child) {
                      return AccentLoginButton(
                        isLoading: ref.watch(profileSettingsProvider).isLoading,
                        background: AppColors.red,
                        title: AppHelpers.getTranslation(TrKeys.yes),
                        onPressed: () {
                          if (isDeleteAccount) {
                            ref
                                .read(profileSettingsProvider.notifier)
                                .deleteAccount(context);
                          } else {
                            final GoogleSignIn signIn = GoogleSignIn();
                            signIn.disconnect();
                            signIn.signOut();
                            context.replaceRoute(const LoginRoute());
                            LocalStorage.instance.logout();
                          }
                        },
                      );
                    },
                  ),
                ),
              ],
            ),
            40.verticalSpace,
          ],
        ),
      ),
    );
  }
}
