import 'package:flutter/material.dart';
import 'package:islamic_c14_sun/core/constanat/quarn_helper.dart';
import 'package:islamic_c14_sun/core/models/sura_data.dart';
import 'package:islamic_c14_sun/modules/layout/widgets/sura_card_widget.dart';

class QuranScreen extends StatelessWidget {
  const QuranScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        image: DecorationImage(
            image: AssetImage("assets/images/quran_bg.png"), fit: BoxFit.cover),
      ),
      child: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          gradient: LinearGradient(colors: [
            const Color(0xff202020).withOpacity(0.7),
            const Color(0xff202020),
          ], end: Alignment.bottomCenter),
        ),
        child: SafeArea(
          child: Column(
            children: [
              Image.asset("assets/logo/home_logo.png"),
              Expanded(
                child: ListView.separated(
                  itemCount: 114,
                  itemBuilder: (context, index) {
                    return SuraCardWidget(
                        suraData: SuraData(
                            number: (index + 1).toString(),
                            nameAr: QuranHelper.suraNameAr[index],
                            nameEn: QuranHelper.suraNameEn[index],
                            verses: QuranHelper.ayaNumber[index]));
                  },
                  separatorBuilder: (context, index) {
                    return const Divider(
                      indent: 40,
                      endIndent: 40,
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
