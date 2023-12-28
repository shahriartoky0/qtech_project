import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:qtech_project/UI/screen/homePage.dart';

main()
{
  runApp(MyApp());
}

class MyApp extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(home:HomePageScreen() ,);
  }
}