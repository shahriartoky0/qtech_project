import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:qtech_project/UI/screen/videoScreen.dart';
import 'package:qtech_project/style/style.dart';

class HomePageScreen extends StatelessWidget {
  const HomePageScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
           Padding(padding: EdgeInsets.all(8),
           child: Text('Trending Videos',style: videoHeading(colorBlack),)),
          
          Expanded(
            child: ListView.builder(
              itemBuilder: (context, index) {
                return VideoCard();
              },
              itemCount: 10,
            ),
          ),
        ],
      ),
    ));
  }

   VideoCard() {
    return InkWell(
      onTap: (){Get.to(VideoScreen());},
      child: Card(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: <Widget>[
              Stack(
                alignment: Alignment.center,
                children: [
                  Image.network(
                    'https://via.placeholder.com/150',
                    // Replace with actual image URL
                    fit: BoxFit.cover,
                  ),
                  Icon(Icons.play_circle_outline, size: 50, color: Colors.white),
                ],
              ),
              ListTile(
                leading: CircleAvatar(child: Icon(Icons.person_add_alt_sharp),),
                title: Text('Video Title'),
                // Replace with actual video title
                subtitle: Text(
                    '53,245 views • Feb 21, 2021'), // Replace with actual data
              ),
            ],
          ),
        ),
      ),
    );
  }
}
