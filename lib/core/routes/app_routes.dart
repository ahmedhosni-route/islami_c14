import 'package:flutter/material.dart';
import 'package:islamic_c14_sun/core/routes/app_routes_name.dart';
import 'package:islamic_c14_sun/modules/layout/screens/layout_screen.dart';
import 'package:islamic_c14_sun/modules/quran_details/screens/quran_details_screen.dart';
import 'package:islamic_c14_sun/modules/splash/screens/splash_screen.dart';

class AppRoutes {
  static Map<String, Widget Function(BuildContext)> routes = {
    AppRoutesName.splash: (_) => SplashScreen(),
    AppRoutesName.layout: (_) => LayoutScreen(),
    AppRoutesName.quranDetails: (_) => QuranDetailsScreen(),
  };
}
