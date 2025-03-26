import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:islamic_c14_sun/core/routes/app_routes_name.dart';
import 'package:islamic_c14_sun/core/theme/app_colors/app_colors.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  @override
  void initState() {
    Future.delayed(
      const Duration(seconds: 3),
      () {
        Navigator.pushNamedAndRemoveUntil(
          context,
          AppRoutesName.layout,
          (route) => false,
        );
      },
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.black,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded(
              child: ZoomIn(
            duration: const Duration(seconds: 1),
            child: Center(
              child: Image.asset("assets/logo/app_logo.png"),
            ),
          )),
          FadeInUp(
              delay: const Duration(seconds: 1),
              child: Image.asset("assets/logo/logo_route.png")),
        ],
      ),
    );
  }
}
