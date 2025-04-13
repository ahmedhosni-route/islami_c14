import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:islamic_c14_sun/core/theme/app_colors/app_colors.dart';

import '../../widgets/hadeth_card_widget.dart';

class HadethScreen extends StatefulWidget {
  const HadethScreen({super.key});

  @override
  State<HadethScreen> createState() => _HadethScreenState();
}

class _HadethScreenState extends State<HadethScreen> {
  List<HadethData> ahadeth = [];

  @override
  void initState() {
    readFile();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        image: DecorationImage(
            image: AssetImage("assets/images/hadeth_bg.png"),
            fit: BoxFit.cover),
      ),
      child: SafeArea(
        bottom: false,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              Center(
                child: Image.asset("assets/logo/home_logo.png"),
              ),
              ahadeth.isEmpty
                  ? const Center(
                      child: CircularProgressIndicator(),
                    )
                  : Expanded(
                      child: CarouselSlider(
                        options: CarouselOptions(
                          height: 1000,
                          viewportFraction: 0.8,
                          pageSnapping: true,
                          disableCenter: true,
                          enlargeCenterPage: true,
                        ),
                        items: ahadeth.map((hadeth) {
                          return Builder(
                            builder: (BuildContext context) {
                              return HadethCardWidget(hadeth: hadeth);
                            },
                          );
                        }).toList(),
                      ),
                    )
            ],
          ),
        ),
      ),
    );
  }

  Future<void> readFile() async {
    String data = await rootBundle.loadString("assets/ahadeth.txt");
    List<String> dataSplit = data.split("#");
    for (var e in dataSplit) {
      e = e.trim();
      if (e.isNotEmpty) {
        String title = e.split("\n")[0].trim();
        String body = e.split("\n")[1].trim();
        ahadeth.add(HadethData(title: title, body: body));
      }
    }
    setState(() {});
  }
}

class HadethData {
  String title;
  String body;

  HadethData({required this.title, required this.body});
}
