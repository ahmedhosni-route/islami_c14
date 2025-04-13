import 'package:flutter/material.dart';
import 'package:islamic_c14_sun/core/routes/app_routes_name.dart';
import 'package:islamic_c14_sun/modules/hadeth_details/screens/hadeth_details_screen.dart';

import '../../../core/theme/app_colors/app_colors.dart';
import '../screens/pages/hadeth_screen.dart';

class HadethCardWidget extends StatelessWidget {
  const HadethCardWidget({super.key, required this.hadeth});
  final HadethData hadeth;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(context, AppRoutesName.hadethDetails,
            arguments: hadeth);
      },
      child: Container(
          width: MediaQuery.of(context).size.width,
          margin: const EdgeInsets.symmetric(horizontal: 5.0),
          decoration: BoxDecoration(
              color: AppColors.prime, borderRadius: BorderRadius.circular(16)),
          child: Padding(
            padding: const EdgeInsets.only(left: 8, right: 8, top: 8),
            child: Stack(
              children: [
                Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      textDirection: TextDirection.ltr,
                      children: [
                        Image.asset(
                          "assets/images/left.png",
                          color: AppColors.black,
                        ),
                        const Spacer(),
                        Image.asset("assets/images/right.png",
                            color: AppColors.black),
                      ],
                    ),
                    Expanded(
                        child: Image.asset(
                      "assets/images/HadithCardBackGround.png",
                      opacity: const AlwaysStoppedAnimation(0.2),
                    )),
                    Hero(
                      tag: "bg",
                      child: ClipRRect(
                          borderRadius: BorderRadius.circular(16),
                          child: Image.asset(
                            "assets/images/bg_hadeth.png",
                            fit: BoxFit.cover,
                            width: double.infinity,
                          )),
                    ),
                  ],
                ),
                Column(
                  children: [
                    const SizedBox(
                      height: 30,
                    ),
                    Center(
                        child: Text(
                      hadeth.title,
                      style:
                          const TextStyle(color: AppColors.black, fontSize: 20),
                    )),
                    const SizedBox(
                      height: 30,
                    ),
                    Expanded(
                      child: Text(
                        hadeth.body,
                        style: const TextStyle(
                          fontSize: 20,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    )
                  ],
                )
              ],
            ),
          )),
    );
  }
}
