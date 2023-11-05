import 'package:astrofuse_abhay/view/landing_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

void main() {
  runApp(const MyApp());
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
  ]);
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'AstroFuse',
        theme: ThemeData(
          primarySwatch: Colors.orange,
        ),
        home: ResponsiveSizer(
          builder: (context, orientation, screenType) {
            return LandingPage();
          },
        ));
  }
}
