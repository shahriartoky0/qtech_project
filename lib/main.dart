import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:qtech_project/UI/controller/homePageController.dart';
import 'package:qtech_project/UI/controller/videoController.dart';
import 'package:qtech_project/UI/screen/homePage.dart';

main() {
  HttpOverrides.global = new MyHttpOverrides(); //development only
  runApp(MyApp());
}

// Bypass SSL check - for development purposes only
class MyHttpOverrides extends HttpOverrides {
  @override
  HttpClient createHttpClient(SecurityContext? context) {
    return super.createHttpClient(context)
      ..badCertificateCallback =
          (X509Certificate cert, String host, int port) => true;
  }
}

class MyApp extends StatelessWidget {
  static GlobalKey<NavigatorState> navigationKey = GlobalKey<NavigatorState>();

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      home: const HomePageScreen(),
      initialBinding: ControllerBindiner(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class ControllerBindiner extends Bindings {
  @override
  void dependencies() {
    Get.put(HomePageController());
    Get.put(AppVideoController());
  }
}
