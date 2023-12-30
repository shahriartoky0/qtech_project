import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:qtech_project/UI/controller/homePageController.dart';
import 'package:qtech_project/style/style.dart';

import '../widgets/videoCard.dart';

class HomePageScreen extends StatefulWidget {
  const HomePageScreen({super.key});

  @override
  State<HomePageScreen> createState() => _HomePageScreenState();
}

class _HomePageScreenState extends State<HomePageScreen> {
  @override
  void initState() {
    Get.find<HomePageController>().getVideoList();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: GetBuilder<HomePageController>(builder: (homePageController) {
      return Scaffold(
        body: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
                padding: EdgeInsets.all(8),
                child: Text(
                  'Trending Videos',
                  style: videoHeading(colorBlack),
                )),
            Expanded(
              child: ListView.builder(
                  itemBuilder: (context, index) {
                    return VideoCardWidget(
                      result: homePageController
                          .videoListDetailsModel.results![index],
                    );
                  },
                  itemCount: homePageController
                          .videoListDetailsModel.results?.length ??
                      0),
            ),
          ],
        ),
      );
    }));
  }
}
