import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../../../core/utils/utils.dart';
import '../../../../../theme/theme.dart';

class SectionTitle extends StatelessWidget {
  final String title;

  const SectionTitle({Key? key, required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final bool isDarkMode = LocalStorage.instance.getAppThemeMode();
    return Text(
      title,
      style: GoogleFonts.cairo(
        fontSize: 18.sp,
        fontWeight: FontWeight.w500,
        color: isDarkMode ? AppColors.white : AppColors.black,
        letterSpacing: -14 * 0.01,
      ),
    );
  }
}
