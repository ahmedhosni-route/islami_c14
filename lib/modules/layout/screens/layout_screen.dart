import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:islamic_c14_sun/core/theme/app_colors/app_colors.dart';
import 'package:islamic_c14_sun/modules/layout/screens/pages/hadeth_screen.dart';
import 'package:islamic_c14_sun/modules/layout/screens/pages/quran_screen.dart';
import 'package:islamic_c14_sun/modules/layout/screens/pages/radio_screen.dart';
import 'package:islamic_c14_sun/modules/layout/screens/pages/sebha_screen.dart';
import 'package:islamic_c14_sun/modules/layout/screens/pages/time_screen.dart';

class LayoutScreen extends StatefulWidget {
  const LayoutScreen({super.key});

  @override
  State<LayoutScreen> createState() => _LayoutScreenState();
}

class _LayoutScreenState extends State<LayoutScreen> {
  int selectedIndex = 0;
  List<Widget> screens = [
    const QuranScreen(),
    const HadethScreen(),
    const SebhaScreen(),
    const RadioScreen(),
    const TimeScreen(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: screens[selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: selectedIndex,
        onTap: (value) {
          selectedIndex = value;
          setState(() {});
        },
        backgroundColor: AppColors.prime,
        type: BottomNavigationBarType.fixed,
        fixedColor: Colors.white,
        unselectedItemColor: AppColors.black,
        showUnselectedLabels: false,
        items: [
          _customBtnItem(image: "quran.svg", title: "Quran"),
          _customBtnItem(image: "hadeth.svg", title: "Hadith"),
          _customBtnItem(image: "sebha.svg", title: "Sebha"),
          _customBtnItem(image: "radio.svg", title: "Radio"),
          _customBtnItem(image: "salaah.svg", title: "Time"),
        ],
      ),
    );
  }

  BottomNavigationBarItem _customBtnItem(
      {required String image, required String title}) {
    return BottomNavigationBarItem(
      icon: SvgPicture.asset(
        "assets/icons/$image",
        color: AppColors.black,
        width: 30,
        height: 30,
      ),
      label: title,
      activeIcon: Container(
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(24),
          color: AppColors.black.withOpacity(0.6),
        ),
        child: BounceIn(
          child: SvgPicture.asset(
            "assets/icons/$image",
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
