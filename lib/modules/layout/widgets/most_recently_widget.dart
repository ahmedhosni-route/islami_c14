import 'package:flutter/material.dart';
import 'package:islamic_c14_sun/core/models/sura_data.dart';

import '../../../core/routes/app_routes_name.dart';
import '../../../core/theme/app_colors/app_colors.dart';

class MostRecentlyWidget extends StatelessWidget {
  final SuraData data;
  const MostRecentlyWidget({super.key, required this.data});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.pushNamed(context, AppRoutesName.quranDetails, arguments: data);
      },
      child: Container(
        padding: const EdgeInsets.all(8),
        margin: const EdgeInsets.all(4),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20), color: AppColors.prime),
        child: Row(
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  data.nameEn,
                  style:
                      const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                ),
                Text(
                  data.nameAr,
                  style:
                      const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                ),
                Text(
                  "${data.verses} verses",
                  style: const TextStyle(fontSize: 16),
                )
              ],
            ),
            Image.asset(
              "assets/images/quranSura.png",
              width: 150,
            ),
          ],
        ),
      ),
    );
  }
}
