import 'package:flutter/material.dart';

class HadethScreen extends StatelessWidget {
  const HadethScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        image: DecorationImage(
            image: AssetImage("assets/images/hadeth_bg.png"),
            fit: BoxFit.cover),
      ),
    );
  }
}
