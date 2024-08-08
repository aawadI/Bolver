import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../core/utils/utils.dart';
import '../../theme/theme.dart';

class UnderlinedTextField extends StatelessWidget {
  final String label;
  final String? hint;
  final Widget? suffixIcon;
  final bool? obscure;
  final TextEditingController? textController;
  final ValueChanged<String>? onChanged;
  final TextInputType? inputType;
  final String? initialText;
  final String? descriptionText;
  final bool readOnly;
  final bool isError;
  final bool isSuccess;
  final TextCapitalization? textCapitalization;
  final TextInputAction? textInputAction;
  final VoidCallback? onTap;
  final String? Function(String?)? validator;

  const UnderlinedTextField({
    Key? key,
    required this.label,
    this.suffixIcon,
    this.obscure,
    this.onChanged,
    this.textController,
    this.inputType,
    this.initialText,
    this.descriptionText,
    this.readOnly = false,
    this.isError = false,
    this.isSuccess = false,
    this.textCapitalization,
    this.textInputAction,
    this.hint,
    this.onTap,
    this.validator,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final bool isDarkMode = LocalStorage.instance.getAppThemeMode();
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TextFormField(
          onTap: onTap,
          onChanged: onChanged,
          obscureText: !(obscure ?? true),
          obscuringCharacter: '*',
          controller: textController,
          style: GoogleFonts.cairo(
            fontWeight: FontWeight.w500,
            fontSize: 15.sp,
            color: isDarkMode ? AppColors.white : AppColors.black,
            letterSpacing: -14 * 0.01,
          ),
          cursorWidth: 1,
          cursorColor: isDarkMode ? AppColors.white : AppColors.black,
          keyboardType: inputType,
          initialValue: initialText,
          readOnly: readOnly,
          textCapitalization:
              textCapitalization ?? TextCapitalization.sentences,
          textInputAction: textInputAction,
          validator: validator,
          decoration: InputDecoration(
            suffixIconConstraints: BoxConstraints(
              maxHeight: suffixIcon != null ? 80.h : 30.h,
              maxWidth: suffixIcon != null ? 80.w : 30.w,
            ),
            suffixIcon: suffixIcon,
            hintText: hint,
            hintStyle: GoogleFonts.cairo(
              fontWeight: FontWeight.w500,
              fontSize: 13.sp,
              color: isDarkMode
                  ? AppColors.white.withOpacity(0.5)
                  : AppColors.hintColor,
            ),
            labelText: label.toUpperCase(),
            labelStyle: GoogleFonts.cairo(
              fontWeight: FontWeight.w500,
              fontSize: 15.sp,
              color: isDarkMode ? AppColors.white : AppColors.black,
              letterSpacing: -14 * 0.01,
            ),
            contentPadding: REdgeInsets.symmetric(horizontal: 0, vertical: 8),
            floatingLabelBehavior: FloatingLabelBehavior.always,
            enabledBorder: UnderlineInputBorder(
              borderSide: BorderSide(
                color:
                    isDarkMode ? AppColors.mainBackDark : AppColors.hintColor,
              ),
            ),
            errorBorder: const UnderlineInputBorder(
              borderSide: BorderSide(color: AppColors.red),
            ),
            border: const UnderlineInputBorder(),
            focusedErrorBorder: const UnderlineInputBorder(),
            disabledBorder: UnderlineInputBorder(
              borderSide: BorderSide(
                color:
                    isDarkMode ? AppColors.mainBackDark : AppColors.hintColor,
              ),
            ),
            focusedBorder: const UnderlineInputBorder(),
          ),
        ),
        if (descriptionText != null)
          Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              4.verticalSpace,
              Text(
                descriptionText!,
                style: GoogleFonts.cairo(
                  fontWeight: FontWeight.w400,
                  letterSpacing: -0.3,
                  fontSize: 12.sp,
                  color: isError
                      ? AppColors.red
                      : isSuccess
                          ? AppColors.accentGreen
                          : AppColors.black,
                ),
              ),
            ],
          )
      ],
    );
  }
}
