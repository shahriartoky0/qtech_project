import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:qtech_project/UI/controller/homePageController.dart';
import 'package:qtech_project/UI/screen/homePage.dart';

main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  static GlobalKey<NavigatorState> navigationKey = GlobalKey<NavigatorState>();

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      home: HomePageScreen(),
      initialBinding: ControllerBindiner(),
    );
  }
}

class ControllerBindiner extends Bindings {
  @override
  void dependencies() {
    Get.put(HomePageController());
  }
}
