import 'package:flutter/material.dart';
import 'package:flutter_remix/flutter_remix.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:g_customer/src/presentation/pages/auth/register/riverpod/provider/register_provider.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../core/constants/constants.dart';
import '../../../../core/utils/app_helpers.dart';
import '../../../../core/utils/local_storage.dart';
import '../../../components/components.dart';
import '../../../theme/app_colors.dart';
import 'enter_phone/riverpod/provider/enter_phone_provider.dart';

class RegisterModal extends ConsumerWidget {
  const RegisterModal({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final notifier = ref.read(registerProvider.notifier);
    final state = ref.watch(registerProvider);
    final registerState = ref.watch(enterPhoneProvider);
    final bool isDarkMode = LocalStorage.instance.getAppThemeMode();
    final bool isLtr = LocalStorage.instance.getLangLtr();
    return Directionality(
      textDirection: isLtr ? TextDirection.ltr : TextDirection.rtl,
      child: AbsorbPointer(
        absorbing: state.isLoading,
        child: KeyboardDismisser(
          child: AnimatedPadding(
            padding: REdgeInsets.only(
              bottom: MediaQuery.of(context).viewInsets.bottom,
            ),
            duration: const Duration(milliseconds: 150),
            child: Padding(
              padding: REdgeInsets.symmetric(horizontal: 15),
              child: SingleChildScrollView(
                physics: const CustomBouncingScrollPhysics(),
                child: Column(
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
                        AppHelpers.getTranslation(TrKeys.register)
                            .toUpperCase(),
                        style: GoogleFonts.cairo(
                          fontSize: 18.sp,
                          fontWeight: FontWeight.w500,
                          color: isDarkMode ? AppColors.white : AppColors.black,
                          letterSpacing: -14 * 0.01,
                        ),
                      ),
                    ),
                    28.verticalSpace,
                    OutlinedBorderTextField(
                      label: AppHelpers.getTranslation(TrKeys.firstname),
                      initialText: state.firstName,
                      onChanged: notifier.setFirstName,
                    ),
                    14.verticalSpace,
                    OutlinedBorderTextField(
                      label: AppHelpers.getTranslation(TrKeys.lastname),
                      initialText: state.lastName,
                      onChanged: notifier.setLatName,
                    ),
                    14.verticalSpace,
                    PopupMenuButton<String>(
                      initialValue: state.male,
                      elevation: 0,
                      itemBuilder: (context) {
                        return [
                          PopupMenuItem<String>(
                            value: 'male',
                            child: Text(
                              AppHelpers.getTranslation(TrKeys.male),
                              style: GoogleFonts.cairo(
                                fontSize: 13.sp,
                                fontWeight: FontWeight.w500,
                                color: isDarkMode
                                    ? AppColors.white
                                    : AppColors.black,
                              ),
                            ),
                          ),
                          PopupMenuItem<String>(
                            value: 'female',
                            child: Text(
                              AppHelpers.getTranslation(TrKeys.female),
                              style: GoogleFonts.cairo(
                                fontSize: 13.sp,
                                fontWeight: FontWeight.w500,
                                color: isDarkMode
                                    ? AppColors.white
                                    : AppColors.black,
                              ),
                            ),
                          ),
                        ];
                      },
                      onSelected: notifier.setMale,
                      child: Container(
                        height: 60.r,
                        padding: REdgeInsets.symmetric(horizontal: 15),
                        decoration: BoxDecoration(
                          color: isDarkMode
                              ? AppColors.dontHaveAnAccBackDark
                              : AppColors.white,
                          borderRadius: BorderRadius.circular(8.r),
                          border: Border.all(
                            color: isDarkMode
                                ? AppColors.borderDark
                                : AppColors.borderColor,
                            width: 1.r,
                          ),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  AppHelpers.getTranslation(TrKeys.gender),
                                  style: GoogleFonts.cairo(
                                    fontSize: 12.sp,
                                    fontWeight: FontWeight.w400,
                                    color: isDarkMode
                                        ? AppColors.white
                                        : AppColors.black,
                                    letterSpacing: -14 * 0.01,
                                  ),
                                ),
                                5.verticalSpace,
                                Text(
                                  state.male == 'male'
                                      ? AppHelpers.getTranslation(TrKeys.male)
                                      : AppHelpers.getTranslation(
                                          TrKeys.female,
                                        ),
                                  style: GoogleFonts.cairo(
                                    fontSize: 15.sp,
                                    fontWeight: FontWeight.w500,
                                    color: isDarkMode
                                        ? AppColors.white
                                        : AppColors.black,
                                    letterSpacing: -14 * 0.01,
                                  ),
                                ),
                              ],
                            ),
                            Icon(
                              FlutterRemix.arrow_down_s_line,
                              color: isDarkMode
                                  ? AppColors.white
                                  : AppColors.black,
                              size: 18.r,
                            ),
                          ],
                        ),
                      ),
                    ),
                    14.verticalSpace,
                    OutlinedSelectButton(
                      label: AppHelpers.getTranslation(TrKeys.dateOfBirth),
                      text: state.dob,
                      trailingIconData: FlutterRemix.calendar_event_line,
                      onPressed: () {
                        showModalBottomSheet(
                          context: context,
                          builder: (context) => CustomDatePickerModal(
                            initialDate: state.dob,
                            onDateSaved: notifier.setDob,
                          ),
                        );
                      },
                    ),
                    14.verticalSpace,
                    OutlinedBorderTextField(
                      label: AppHelpers.getTranslation(TrKeys.phoneNumber),
                      initialText: registerState.phone,
                      inputType: TextInputType.phone,
                      readOnly: true,
                    ),
                    15.verticalSpace,
                    OutlinedBorderTextField(
                      obscure: state.showPassword,
                      label: AppHelpers.getTranslation(TrKeys.password),
                      onChanged: notifier.setPassword,
                      textCapitalization: TextCapitalization.none,
                      isError: state.isPasswordInvalid,
                      descriptionText: state.isPasswordInvalid
                          ? AppHelpers.getTranslation(
                              TrKeys.passwordShouldContainMinimum8Characters)
                          : null,
                      suffixIcon: IconButton(
                        splashRadius: 25,
                        icon: Icon(
                          state.showPassword
                              ? FlutterRemix.eye_line
                              : FlutterRemix.eye_close_line,
                          color: isDarkMode ? AppColors.white : AppColors.black,
                          size: 20.r,
                        ),
                        onPressed: notifier.toggleShowPassword,
                      ),
                    ),
                    15.verticalSpace,
                    OutlinedBorderTextField(
                      obscure: state.showConfirmPassword,
                      label: AppHelpers.getTranslation(TrKeys.confirmPassword),
                      onChanged: notifier.setConfirmPassword,
                      textCapitalization: TextCapitalization.none,
                      isError: state.isConfirmPasswordInvalid,
                      descriptionText: state.isConfirmPasswordInvalid
                          ? AppHelpers.getTranslation(
                              TrKeys.confirmPasswordIsNotTheSame)
                          : null,
                      suffixIcon: IconButton(
                        splashRadius: 25,
                        icon: Icon(
                          state.showConfirmPassword
                              ? FlutterRemix.eye_line
                              : FlutterRemix.eye_close_line,
                          color: isDarkMode ? AppColors.white : AppColors.black,
                          size: 20.r,
                        ),
                        onPressed: notifier.toggleShowConfirmPassword,
                      ),
                    ),
                    30.verticalSpace,
                    AccentLoginButton(
                      isLoading: state.isLoading,
                      background:
                          isDarkMode ? AppColors.white : AppColors.black,
                      title: AppHelpers.getTranslation(TrKeys.save),
                      textColor: isDarkMode ? AppColors.black : AppColors.white,
                      onPressed: () =>
                          notifier.register(context, registerState.phone),
                    ),
                    40.verticalSpace,
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
