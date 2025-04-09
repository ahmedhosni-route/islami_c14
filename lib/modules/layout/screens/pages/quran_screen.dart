import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:islamic_c14_sun/core/constanat/quarn_helper.dart';
import 'package:islamic_c14_sun/core/models/sura_data.dart';
import 'package:islamic_c14_sun/core/theme/app_colors/app_colors.dart';
import 'package:islamic_c14_sun/modules/layout/widgets/most_recently_widget.dart';
import 'package:islamic_c14_sun/modules/layout/widgets/sura_card_widget.dart';
import 'package:shared_preferences/shared_preferences.dart';

class QuranScreen extends StatefulWidget {
  QuranScreen({super.key});

  @override
  State<QuranScreen> createState() => _QuranScreenState();
}

class _QuranScreenState extends State<QuranScreen> {
  List<SuraData> mostRecintly = [];
  List<String> mostRecintlyIds = [];
  List<SuraData> searchData = [];
  @override
  void initState() {
    getData();
    super.initState();
  }

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
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(child: Image.asset("assets/logo/home_logo.png")),
              TextFormField(
                style: const TextStyle(fontSize: 20, color: Colors.white),
                autovalidateMode: AutovalidateMode.onUserInteraction,
                decoration: InputDecoration(
                    prefixIcon: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: SvgPicture.asset(
                        "assets/icons/quran.svg",
                        color: AppColors.prime,
                      ),
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(16),
                      borderSide: const BorderSide(
                        color: AppColors.prime,
                      ),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(16),
                      borderSide: const BorderSide(
                        color: AppColors.prime,
                      ),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(16),
                      borderSide: const BorderSide(
                        color: AppColors.prime,
                      ),
                    ),
                    hintText: "Sura Name",
                    hintStyle: const TextStyle(color: Colors.white)),
                onChanged: (value) {
                  search(value);
                },
              ),
              if (mostRecintly.isNotEmpty)
                const Padding(
                  padding: EdgeInsets.all(4.0),
                  child: Text(
                    "Most Recently ",
                    style: TextStyle(fontSize: 18, color: Colors.white),
                  ),
                ),
              if (mostRecintly.isNotEmpty)
                SizedBox(
                  height: 150,
                  child: ListView.builder(
                    itemCount: mostRecintly.length,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) {
                      return MostRecentlyWidget(
                          data: SuraData(
                              number: mostRecintly[index].number,
                              nameAr: mostRecintly[index].nameAr,
                              nameEn: mostRecintly[index].nameEn,
                              verses: mostRecintly[index].verses));
                    },
                  ),
                ),
              searchData.isEmpty
                  ? Expanded(
                      child: ListView.separated(
                        itemCount: 114,
                        itemBuilder: (context, index) {
                          return SuraCardWidget(
                              onTap: saveSura,
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
                    )
                  : Expanded(
                      child: ListView.separated(
                        itemCount: searchData.length,
                        itemBuilder: (context, index) {
                          return SuraCardWidget(
                              onTap: saveSura,
                              suraData: SuraData(
                                  number: searchData[index].number,
                                  nameAr: searchData[index].nameAr,
                                  nameEn: searchData[index].nameEn,
                                  verses: searchData[index].verses));
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

  void saveSura(SuraData data) {
    mostRecintly.insert(0, data);
    mostRecintly = mostRecintly.toSet().toList();
    saveLocalData((int.parse(data.number) - 1).toString());
    setState(() {});
  }

  Future<void> saveLocalData(String id) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    mostRecintlyIds.insert(0, id);
    await prefs.setStringList("most", mostRecintlyIds);
  }

  Future<void> getData() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    mostRecintlyIds = prefs.getStringList("most") ?? [];
    for (String id in mostRecintlyIds) {
      int index = int.parse(id);
      mostRecintly.add(
        SuraData(
          number: (index + 1).toString(),
          nameAr: QuranHelper.suraNameAr[index],
          nameEn: QuranHelper.suraNameEn[index],
          verses: QuranHelper.ayaNumber[index],
        ),
      );
    }
    setState(() {});
  }

  void search(String value) {
    searchData = [];
    QuranHelper.suraNameEn.where(
      (element) {
        if (element.toLowerCase().contains(value.toLowerCase())) {
          int index = QuranHelper.suraNameEn.indexOf(element);
          searchData.add(
            SuraData(
              number: (index + 1).toString(),
              nameAr: QuranHelper.suraNameAr[index],
              nameEn: QuranHelper.suraNameEn[index],
              verses: QuranHelper.ayaNumber[index],
            ),
          );
        }
        return true;
      },
    ).toList();
    QuranHelper.suraNameAr.where(
      (element) {
        if (element.contains(value)) {
          int index = QuranHelper.suraNameAr.indexOf(element);
          searchData.add(
            SuraData(
              number: (index + 1).toString(),
              nameAr: QuranHelper.suraNameAr[index],
              nameEn: QuranHelper.suraNameEn[index],
              verses: QuranHelper.ayaNumber[index],
            ),
          );
        }
        return true;
      },
    ).toList();
    setState(() {});
  }
}
