import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_remix/flutter_remix.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl_phone_field/countries.dart';
import 'package:intl_phone_field/intl_phone_field.dart';

import '../../../../core/constants/constants.dart';
import '../../../../core/routes/app_router.gr.dart';
import '../../../../core/utils/utils.dart';
import '../../../components/components.dart';
import '../../../theme/theme.dart';
import 'riverpod/provider/login_provider.dart';

class LoginPage extends ConsumerWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final notifier = ref.read(loginProvider.notifier);
    final state = ref.watch(loginProvider);
    final bool isDarkMode = LocalStorage.instance.getAppThemeMode();
    final bool isLtr = LocalStorage.instance.getLangLtr();
    return Directionality(
      textDirection: isLtr ? TextDirection.ltr : TextDirection.rtl,
      child: AbsorbPointer(
        absorbing: state.isGoogleLoading || state.isLoading,
        child: KeyboardDismisser(
          child: Scaffold(
            resizeToAvoidBottomInset: false,
            backgroundColor:
                isDarkMode ? AppColors.dontHaveAnAccBackDark : AppColors.white,
            body: SafeArea(
              child: Column(
                children: [
                  Padding(
                    padding: REdgeInsets.symmetric(
                      vertical: 12,
                      horizontal: 15,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          '${AppHelpers.getAppName()}',
                          style: GoogleFonts.cairo(
                            fontWeight: FontWeight.w700,
                            fontSize: 14.sp,
                            letterSpacing: -1,
                            color:
                                isDarkMode ? AppColors.white : AppColors.black,
                          ),
                        ),
                        SkipAuthButton(
                          title: AppHelpers.getTranslation(TrKeys.skip),
                          onPressed: () => notifier.skipForNow(
                            goToMain: () =>
                                context.replaceRoute(const ShopMainRoute()),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    height: 16.r,
                    color: isDarkMode
                        ? AppColors.mainBackDark
                        : AppColors.mainBack,
                  ),
                  Padding(
                    padding: REdgeInsets.symmetric(horizontal: 15),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        18.verticalSpace,
                        Text(
                          AppHelpers.getTranslation(TrKeys.login),
                          style: GoogleFonts.cairo(
                            fontWeight: FontWeight.w500,
                            fontSize: 18.sp,
                            color:
                                isDarkMode ? AppColors.white : AppColors.black,
                          ),
                        ),
                        26.verticalSpace,
                        Directionality(
                          textDirection: TextDirection.ltr,
                          child: IntlPhoneField(
                            showDropdownIcon: false,
                            textAlign: TextAlign.left,
                            countries: countries
                                .where((country) {
                              return country.code == "SA";
                            })
                                .toList(),
                            decoration: InputDecoration(
                              labelText: '',
                              hintText: 'رقم الهاتف',
                              border: OutlineInputBorder(
                                borderSide: BorderSide(
                                    color: isDarkMode ? AppColors.borderDark : AppColors.borderColor),
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                    color: isDarkMode ? AppColors.borderDark : AppColors.borderColor),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                    color: isDarkMode ? AppColors.borderDark : AppColors.borderColor),
                              ),
                            ),
                            dropdownIconPosition: IconPosition.trailing,
                            initialCountryCode: 'SA',
                            onChanged: (phone) {
                              notifier.setEmail(phone.number);
                              print(state.email);
                            },
                          ),
                        ),
                        16.verticalSpace,
                        OutlinedBorderTextField(
                          obscure: state.showPassword,
                          label: AppHelpers.getTranslation(TrKeys.password),
                          onChanged: notifier.setPassword,
                          textCapitalization: TextCapitalization.none,
                          isError:
                              state.isLoginError || state.isPasswordNotValid,
                          descriptionText: state.isPasswordNotValid
                              ? AppHelpers.getTranslation(TrKeys
                                  .passwordShouldContainMinimum8Characters)
                              : (state.isLoginError
                                  ? AppHelpers.getTranslation(
                                      TrKeys.loginCredentialsAreNotValid)
                                  : null),
                          suffixIcon: IconButton(
                            splashRadius: 25,
                            icon: Icon(
                              state.showPassword
                                  ? FlutterRemix.eye_line
                                  : FlutterRemix.eye_close_line,
                              color: isDarkMode
                                  ? AppColors.white
                                  : AppColors.black,
                              size: 20.r,
                            ),
                            onPressed: () =>
                                notifier.setShowPassword(!state.showPassword),
                          ),
                        ),
                        12.verticalSpace,
                        Align(
                          alignment: Alignment.centerRight,
                          child: ForgotTextButton(
                            title:
                                '${AppHelpers.getTranslation(TrKeys.forgotPassword)}?',
                            fontColor:
                                isDarkMode ? AppColors.white : AppColors.black,
                            onPressed: () =>
                                context.pushRoute(const ResetPasswordRoute()),
                          ),
                        ),
                        40.verticalSpace,
                        AccentLoginButton(
                          title: AppHelpers.getTranslation(TrKeys.login),
                          isLoading: state.isLoading,
                          onPressed: () {
                            if (state.email.trim().isNotEmpty) {
                              print(state.email);
                              print(state.password);
                              return notifier.login(
                                checkYourNetwork: () {
                                  AppHelpers.showCheckFlash(
                                      context,
                                      AppHelpers.getTranslation(
                                          TrKeys.checkYourNetworkConnection));
                                },
                                success: () {
                                  context.replaceRoute(const ShopMainRoute());
                                },
                              );
                            }
                          },
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            bottomNavigationBar: Padding(
              padding: REdgeInsets.only(left: 15, right: 15, bottom: 40),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  // Row(
                  //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  //   children: [
                  //     Expanded(
                  //       child: GoogleSignButton(
                  //         isLoading: state.isGoogleLoading,
                  //         onPressed: () => notifier.loginWithGoogle(
                  //           checkNetwork: () {
                  //             AppHelpers.showCheckFlash(
                  //                 context,
                  //                 AppHelpers.getTranslation(
                  //                     TrKeys.checkYourNetworkConnection));
                  //           },
                  //           error: (text) {
                  //             AppHelpers.showCheckFlash(context, text);
                  //           },
                  //           success: () {
                  //             context.replaceRoute(const ShopMainRoute());
                  //           },
                  //         ),
                  //       ),
                  //     ),
                  //     9.horizontalSpace,
                  //     Row(
                  //       children: [
                  //         AppleFbButton(
                  //           isLoading: state.isFacebookLoading,
                  //           iconData: FlutterRemix.facebook_fill,
                  //           onPressed: () =>
                  //               notifier.loginWithFacebook(context),
                  //         ),
                  //         9.horizontalSpace,
                  //         if (Platform.isIOS)
                  //           AppleFbButton(
                  //             iconData: FlutterRemix.apple_fill,
                  //             onPressed: () => notifier.loginWithApple(context),
                  //             isLoading: state.isAppleLoading,
                  //           ),
                  //       ],
                  //     ),
                  //
                  //   ],
                  // ),
                  28.verticalSpace,
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        '${AppHelpers.getTranslation(TrKeys.dontHaveAnAcc)}?',
                        style: GoogleFonts.cairo(
                          fontWeight: FontWeight.w500,
                          fontSize: 13.sp,
                          color: isDarkMode ? AppColors.white : AppColors.black,
                        ),
                      ),
                      8.horizontalSpace,
                      SignUpInButton(
                        title: AppHelpers.getTranslation(TrKeys.register),
                        onPressed: () =>
                            context.replaceRoute(const EnterPhoneRoute()),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
