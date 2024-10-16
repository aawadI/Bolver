import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl_phone_field/countries.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../../../core/constants/constants.dart';
import '../../../../../core/routes/app_router.gr.dart';
import '../../../../../core/utils/utils.dart';
import '../../../../components/components.dart';
import '../../../../theme/theme.dart';
import 'riverpod/provider/enter_phone_provider.dart';

class EnterPhonePage extends ConsumerStatefulWidget {
  const EnterPhonePage({Key? key}) : super(key: key);

  @override
  ConsumerState<EnterPhonePage> createState() => _EnterPhonePageState();
}

class _EnterPhonePageState extends ConsumerState<EnterPhonePage> {
  final GlobalKey<FormState> from = GlobalKey();

  @override
  void initState() {
    super.initState();
    Future.delayed(
      Duration.zero,
      () {
        ref.read(enterPhoneProvider.notifier).clearStates();
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final notifier = ref.read(enterPhoneProvider.notifier);
    final state = ref.watch(enterPhoneProvider);
    final bool isDarkMode = LocalStorage.instance.getAppThemeMode();
    final bool isLtr = LocalStorage.instance.getLangLtr();
    return Directionality(
      textDirection: isLtr ? TextDirection.ltr : TextDirection.rtl,
      child: AbsorbPointer(
        absorbing: state.isLoading,
        child: KeyboardDismisser(
          child: Scaffold(
            backgroundColor:
                isDarkMode ? AppColors.dontHaveAnAccBackDark : AppColors.white,
            body: SafeArea(
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: REdgeInsets.symmetric(
                        vertical: 21,
                        horizontal: 15,
                      ),
                      child: Text(
                        '${AppHelpers.getAppName()}',
                        style: GoogleFonts.cairo(
                          fontWeight: FontWeight.w700,
                          fontSize: 14.sp,
                          letterSpacing: -1,
                          color: isDarkMode ? AppColors.white : AppColors.black,
                        ),
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
                            AppHelpers.getTranslation(TrKeys.register),
                            style: GoogleFonts.cairo(
                              fontWeight: FontWeight.w500,
                              fontSize: 18.sp,
                              color: isDarkMode
                                  ? AppColors.white
                                  : AppColors.black,
                              letterSpacing: -14 * 0.02,
                            ),
                          ),
                          26.verticalSpace,
                          Form(
                            key: from,
                            child: Directionality(
                              textDirection: TextDirection.ltr,
                              child: IntlPhoneField(
                                showDropdownIcon: false,
                                countries: countries
                                    .where((country) => country.code == "SA")
                                    .toList(),
                                validator: (s) {
                                  if (s?.number.isEmpty ?? true) {
                                    return TrKeys.empty;
                                  }
                                  return null;
                                },
                                decoration: InputDecoration(
                                  labelText: '',
                                  hintText: 'رقم الهاتف',
                                  border: OutlineInputBorder(
                                    borderSide: BorderSide(
                                        color: isDarkMode
                                            ? AppColors.borderDark
                                            : AppColors.borderColor),
                                  ),
                                  enabledBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                        color: isDarkMode
                                            ? AppColors.borderDark
                                            : AppColors.borderColor),
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                        color: isDarkMode
                                            ? AppColors.borderDark
                                            : AppColors.borderColor),
                                  ),
                                ),
                                initialCountryCode: 'SA',
                                keyboardType: TextInputType.phone,
                                onChanged: (phone) {
                                  notifier.setPhone(phone.completeNumber);
                                },
                              ),
                            ),
                          ),
                          16.verticalSpace,
                          Row(
                            children: [
                              Checkbox(
                                side: BorderSide(
                                  color: isDarkMode
                                      ? AppColors.white
                                      : AppColors.black,
                                  width: 2.r,
                                ),
                                activeColor: isDarkMode
                                    ? AppColors.accentGreen
                                    : AppColors.black,
                                value: state.agreedToPrivacy,
                                onChanged: (value) => notifier.toggleAgreed(),
                              ),
                              Text(
                                AppHelpers.getTranslation(
                                    TrKeys.iAgreeToSendASms),
                                style: GoogleFonts.cairo(
                                  fontWeight: FontWeight.w500,
                                  fontSize: 12.sp,
                                  color: isDarkMode
                                      ? AppColors.white
                                      : AppColors.black,
                                  letterSpacing: -14 * 0.01,
                                ),
                              ),
                              SignUpInButton(
                                title: AppHelpers.getTranslation(
                                    TrKeys.privacyPolicy),
                                fontSize: 12,
                                onPressed: () async {
                                  if (!await launchUrl(Uri.parse(
                                      AppConstants.privacyPolicyUrl))) {
                                    throw 'Could not launch';
                                  }
                                },
                              ),
                            ],
                          ),
                          52.verticalSpace,
                          AccentLoginButton(
                            title:
                                AppHelpers.getTranslation(TrKeys.sendSmsCode),
                            isLoading: state.isLoading,
                            onPressed: state.agreedToPrivacy &&
                                    state.phone.replaceAll(" ", "").length >= 13
                                ? () {
                                    if (from.currentState?.validate() ??
                                        false) {
                                      return notifier.sendOtp(context);
                                    }
                                  }
                                : null,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
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
                  //         onPressed: () => notifier.registerWithGoogle(context),
                  //       ),
                  //     ),
                  //     9.horizontalSpace,
                  //     Row(
                  //       children: [
                  //         AppleFbButton(
                  //           isLoading: state.isFacebookLoading,
                  //           iconData: FlutterRemix.facebook_fill,
                  //           onPressed: () =>
                  //               notifier.registerWithFacebook(context),
                  //         ),
                  //         9.horizontalSpace,
                  //         if (Platform.isIOS)
                  //           AppleFbButton(
                  //             iconData: FlutterRemix.apple_fill,
                  //             onPressed: () {
                  //               notifier.registrationWithApple(context);
                  //             },
                  //             isLoading: state.isAppleLoading,
                  //           ),
                  //       ],
                  //     ),
                  //   ],
                  // ),
                  28.verticalSpace,
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        AppHelpers.getTranslation(
                            TrKeys.youAlreadyHaveAnAccount),
                        style: GoogleFonts.cairo(
                          fontWeight: FontWeight.w500,
                          fontSize: 13.sp,
                          color: isDarkMode ? AppColors.white : AppColors.black,
                        ),
                      ),
                      8.horizontalSpace,
                      SignUpInButton(
                        title: AppHelpers.getTranslation(TrKeys.login),
                        onPressed: () =>
                            context.replaceRoute(const LoginRoute()),
                      ),
                    ],
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
