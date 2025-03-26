import 'package:flutter/material.dart';
import 'package:islamic_c14_sun/core/models/sura_data.dart';
import 'package:islamic_c14_sun/core/routes/app_routes_name.dart';

class SuraCardWidget extends StatelessWidget {
  final SuraData suraData;
  const SuraCardWidget({super.key, required this.suraData});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.pushNamed(context, AppRoutesName.quranDetails,
            arguments: suraData);
      },
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          children: [
            Container(
              padding: const EdgeInsets.all(8),
              width: 65,
              height: 65,
              decoration: const BoxDecoration(
                image: DecorationImage(
                    image: AssetImage("assets/images/sura.png")),
              ),
              child: Center(
                  child: Text(
                suraData.number,
                style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Colors.white),
              )),
            ),
            const SizedBox(
              width: 12,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  suraData.nameEn,
                  style: const TextStyle(
                      fontSize: 20,
                      color: Colors.white,
                      fontWeight: FontWeight.bold),
                ),
                Text(
                  "Verses ${suraData.verses}",
                  style: const TextStyle(fontSize: 16, color: Colors.white),
                ),
              ],
            ),
            const Spacer(),
            Text(
              suraData.nameAr,
              style: const TextStyle(
                  fontSize: 20,
                  color: Colors.white,
                  fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }
}
