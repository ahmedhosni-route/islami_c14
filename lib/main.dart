import 'package:flutter/material.dart';
import 'package:islamic_c14_sun/core/routes/app_routes.dart';
import 'package:islamic_c14_sun/core/routes/app_routes_name.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Islamic',
      theme: ThemeData(
        useMaterial3: true,
      ),
      initialRoute: AppRoutesName.splash,
      routes: AppRoutes.routes,
    );
  }
}
