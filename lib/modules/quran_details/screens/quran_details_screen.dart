import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:islamic_c14_sun/core/models/sura_data.dart';
import 'package:islamic_c14_sun/core/theme/app_colors/app_colors.dart';

class QuranDetailsScreen extends StatefulWidget {
  QuranDetailsScreen({super.key});

  @override
  State<QuranDetailsScreen> createState() => _QuranDetailsScreenState();
}

class _QuranDetailsScreenState extends State<QuranDetailsScreen> {
  List<String> verses = [];

  @override
  Widget build(BuildContext context) {
    SuraData suraData = ModalRoute.of(context)!.settings.arguments as SuraData;
    if (verses.isEmpty) {
      readFile(suraData.number);
    }
    return Scaffold(
      backgroundColor: AppColors.black,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        surfaceTintColor: Colors.transparent,
        title: Text(suraData.nameEn),
        titleTextStyle: const TextStyle(color: AppColors.prime, fontSize: 24),
        iconTheme: const IconThemeData(color: AppColors.prime),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              textDirection: TextDirection.ltr,
              children: [
                Image.asset("assets/images/left.png"),
                Expanded(
                    child: Center(
                        child: Text(
                  suraData.nameAr,
                  style: const TextStyle(color: AppColors.prime, fontSize: 24),
                ))),
                Image.asset("assets/images/right.png"),
              ],
            ),
            // Expanded(
            //   child: verses.isEmpty? const Center(child: CircularProgressIndicator()) : ListView.builder(
            //     itemCount: verses.length,
            //     itemBuilder: (context, index) {
            //       return InkWell(
            //         onTap: () {
            //           showModalBottomSheet(context: context, builder: (context) {
            //             return Container(
            //               decoration: const BoxDecoration(
            //                 color: AppColors.black
            //               ),
            //               width: double.infinity,
            //               child: Column(
            //                 mainAxisAlignment: MainAxisAlignment.center,
            //                 children: [
            //                   Text(
            //                     "${verses[index]} [${index + 1}]",
            //                     textAlign: TextAlign.center,
            //                     textDirection: TextDirection.rtl,
            //                     style: const TextStyle(
            //                         color: AppColors.prime,
            //                         fontSize: 18,
            //                         fontWeight: FontWeight.bold),
            //                   ),
            //                 ],
            //               ),
            //             );
            //           },);
            //         },
            //         child: Container(
            //           padding: const EdgeInsets.all(8),
            //           margin: const EdgeInsets.all(4),
            //           decoration: BoxDecoration(
            //               borderRadius: BorderRadius.circular(16),
            //               border: Border.all(color: AppColors.prime)),
            //           child: Center(
            //             child: Text(
            //               "${verses[index]} [${index + 1}]",
            //               textAlign: TextAlign.center,
            //               textDirection: TextDirection.rtl,
            //               style: const TextStyle(
            //                   color: AppColors.prime,
            //                   fontSize: 18,
            //                   fontWeight: FontWeight.bold),
            //             ),
            //           ),
            //         ),
            //       );
            //     },
            //   ),
            // )

            Expanded(
              child: SingleChildScrollView(
                child: Text.rich(
                  TextSpan(
                      children: verses.map(
                    (text) {
                      int index = verses.indexOf(text);
                      return TextSpan(
                          text: "$text[${index + 1}] ",
                          style: TextStyle(
                            fontSize: 24,
                            color: text.contains("اللَّهِ")
                                ? Colors.blue
                                : AppColors.prime,
                          ),
                          recognizer: TapGestureRecognizer()
                            ..onTap = () {
                              showModalBottomSheet(
                                context: context,
                                builder: (context) {
                                  return Container(
                                    decoration: const BoxDecoration(
                                        color: AppColors.black),
                                    width: double.infinity,
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Text(
                                          text,
                                          textAlign: TextAlign.center,
                                          textDirection: TextDirection.rtl,
                                          style: const TextStyle(
                                              color: AppColors.prime,
                                              fontSize: 18,
                                              fontWeight: FontWeight.bold),
                                        ),
                                      ],
                                    ),
                                  );
                                },
                              );
                            });
                    },
                  ).toList()),
                  textDirection: TextDirection.rtl,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  void readFile(String id) async {
    String data = await rootBundle.loadString("assets/suras/${id}.txt");
    data = data.trim();
    verses = data.split("\n");
    print(verses[0]);
    setState(() {});
  }
}
