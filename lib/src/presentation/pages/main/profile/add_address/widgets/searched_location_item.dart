import 'package:flutter/material.dart';
import 'package:flutter_remix/flutter_remix.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:osm_nominatim/osm_nominatim.dart';

import '../../../../../theme/theme.dart';

class SearchedLocationItemMap extends StatelessWidget {
  final Place location;
  final Function() onTap;

  const SearchedLocationItemMap({
    Key? key,
    required this.location,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Material(
          color: AppColors.white,
          child: InkWell(
            onTap: onTap,
            child: Container(
              height: 55.r,
              padding: REdgeInsets.symmetric(horizontal: 15),
              alignment: Alignment.center,
              child: Row(
                children: [
                  Icon(
                    FlutterRemix.search_2_line,
                    color: AppColors.black,
                    size: 20.r,
                  ),
                  8.horizontalSpace,
                  Expanded(
                    child: Text(
                      location.displayName,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: GoogleFonts.cairo(
                        fontWeight: FontWeight.w500,
                        fontSize: 13.sp,
                        letterSpacing: -14 * 0.01,
                        color: AppColors.black,
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
        Divider(
          color: AppColors.black.withOpacity(0.06),
          thickness: 1.r,
          height: 0.r,
        ),
      ],
    );
  }
}
