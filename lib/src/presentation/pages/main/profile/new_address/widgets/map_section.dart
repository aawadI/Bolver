import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_remix/flutter_remix.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:lottie/lottie.dart';

import '../../../../../../core/constants/constants.dart';
import '../../../../../../core/utils/utils.dart';
import '../../../../../theme/theme.dart';
import 'my_location_button.dart';

class MapSection extends StatelessWidget {
  final AnimationController animationController;
  final ValueSetter<CameraPosition> onCameraMove;
  final VoidCallback onCameraIdle;
  final VoidCallback onMyLocationTap;
  final ValueSetter<GoogleMapController> onMapCreated;
  final VoidCallback onSearchTap;

  const MapSection({
    Key? key,
    required this.animationController,
    required this.onCameraMove,
    required this.onCameraIdle,
    required this.onMyLocationTap,
    required this.onMapCreated,
    required this.onSearchTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final bool isDarkMode = LocalStorage.instance.getAppThemeMode();
    return SizedBox(
      height: 360.r,
      child: Stack(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(8.r),
            child: GoogleMap(
              zoomControlsEnabled: false,
              gestureRecognizers: {
                Factory<OneSequenceGestureRecognizer>(
                  () => EagerGestureRecognizer(),
                )
              },
              initialCameraPosition: CameraPosition(
                target: LatLng(
                  AppHelpers.getInitialLatitude() ?? AppConstants.demoLatitude,
                  AppHelpers.getInitialLongitude() ??
                      AppConstants.demoLongitude,
                ),
                zoom: 14,
              ),
              onMapCreated: (controller) {
                onMapCreated(controller);
                controller.setMapStyle(
                  json.encode(
                    isDarkMode
                        ? AppMapThemes.mapDarkTheme
                        : AppMapThemes.mapLightTheme,
                  ),
                );
              },
              onCameraMoveStarted: () {
                animationController.repeat(
                  min: AppConstants.pinLoadingMin,
                  max: AppConstants.pinLoadingMax,
                  period: animationController.duration! *
                      (AppConstants.pinLoadingMax - AppConstants.pinLoadingMin),
                );
              },
              onCameraIdle: () async {
                animationController.forward(from: AppConstants.pinLoadingMax);
                onCameraIdle();
              },
              onCameraMove: onCameraMove,
            ),
          ),
          IgnorePointer(
            child: Center(
              child: Padding(
                padding: REdgeInsets.only(bottom: 78),
                child: Lottie.asset(
                  AppAssets.lottiePin,
                  onLoaded: (composition) {
                    animationController.duration = composition.duration;
                  },
                  controller: animationController,
                  width: 250.r,
                  height: 250.r,
                ),
              ),
            ),
          ),
          Positioned(
            bottom: 16.r,
            right: 16.r,
            child: MyLocationButton(
              iconData: FlutterRemix.navigation_fill,
              onTap: onMyLocationTap,
            ),
          ),
          Positioned(
            top: 16.r,
            right: 16.r,
            child: GestureDetector(
              onTap: onSearchTap,
              child: Container(
                height: 42.r,
                width: MediaQuery.of(context).size.width - 64.w,
                padding: REdgeInsets.symmetric(horizontal: 24),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(16.r),
                  color: AppColors.white,
                  boxShadow: <BoxShadow>[
                    BoxShadow(
                      offset: const Offset(0, 1),
                      blurRadius: 2.r,
                      spreadRadius: 0,
                      color: AppColors.shadowCart,
                    ),
                  ],
                ),
                alignment: Alignment.center,
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Icon(
                      FlutterRemix.search_line,
                      size: 20.r,
                      color: AppColors.hintColor,
                    ),
                    10.horizontalSpace,
                    Text(
                      AppHelpers.getTranslation(TrKeys.search),
                      style: GoogleFonts.cairo(
                        fontWeight: FontWeight.w400,
                        color: AppColors.hintColor,
                        fontSize: 16.sp,
                        letterSpacing: -0.3,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
