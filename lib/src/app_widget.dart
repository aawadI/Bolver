import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'core/di/dependency_manager.dart';
import 'core/routes/slide_transition.dart';
import 'riverpod/provider/app_provider.dart';
import 'presentation/components/components.dart';

class AppWidget extends ConsumerWidget {

  const AppWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.refresh(appProvider);
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      builder: (context, child) {
        return MaterialApp.router(
          debugShowCheckedModeBanner: false,
          routerDelegate: appRouter.delegate(),
          routeInformationParser: appRouter.defaultRouteParser(),
          locale: Locale(state.activeLanguage?.locale ?? 'en'),
          themeMode: state.isDarkMode ? ThemeMode.dark : ThemeMode.light,
          darkTheme: ThemeData.dark().copyWith(
            pageTransitionsTheme: const PageTransitionsTheme(
              builders: {
                TargetPlatform.android: CustomTransitionBuilder(),
              },
            ),
          ),
          theme: ThemeData.light().copyWith(
            sliderTheme: SliderThemeData(
              overlayShape: SliderComponentShape.noOverlay,
              rangeThumbShape: CustomRoundRangeSliderThumbShape(
                enabledThumbRadius: 12.r,
              ),
            ),
            pageTransitionsTheme: const PageTransitionsTheme(
              builders: {
                TargetPlatform.android: CustomTransitionBuilder(),
              },
            ),
          ),
        );
      },
    );
  }
}
