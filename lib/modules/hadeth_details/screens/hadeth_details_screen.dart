import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:islamic_c14_sun/core/theme/app_colors/app_colors.dart';
import 'package:islamic_c14_sun/modules/layout/screens/pages/hadeth_screen.dart';

class HadethDetailsScreen extends StatelessWidget {
  HadethDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    HadethData hadeth =
        ModalRoute.of(context)!.settings.arguments as HadethData;
    return Scaffold(
      backgroundColor: AppColors.black,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        surfaceTintColor: Colors.transparent,
        title: Text(hadeth.title),
        titleTextStyle: const TextStyle(color: AppColors.prime, fontSize: 24),
        iconTheme: const IconThemeData(color: AppColors.prime),
      ),
      body: Padding(
        padding: const EdgeInsets.only(top: 8, left: 8, right: 8),
        child: Stack(
          alignment: Alignment.bottomCenter,
          children: [
            Hero(
                tag: "bg",
                child: Image.asset("assets/images/bg_hadeth.png")),
            Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  textDirection: TextDirection.ltr,
                  children: [
                    Image.asset("assets/images/left.png"),
                    Expanded(
                        child: Center(
                            child: Text(
                      hadeth.title,
                      style:
                          const TextStyle(color: AppColors.prime, fontSize: 24),
                    ))),
                    Image.asset("assets/images/right.png"),
                  ],
                ),
                Expanded(
                  child: SingleChildScrollView(
                    child: Text(
                      hadeth.body,
                      style:
                          const TextStyle(color: AppColors.prime, fontSize: 24),
                      textAlign: TextAlign.center,
                    ),
                  ),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
