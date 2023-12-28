import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:qtech_project/style/style.dart';

import '../widgets/commentsInListTile.dart';
import '../widgets/reactionCard.dart';

class VideoScreen extends StatefulWidget {
  const VideoScreen({Key? key});

  @override
  State<VideoScreen> createState() => _VideoScreenState();
}

class _VideoScreenState extends State<VideoScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: 300,
              width: double.infinity,
              color: Colors
                  .grey, // Placeholder color, replace with your video content
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(8),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Video Heading',
                      style: videoHeading(Colors.black),
                    ),
                    SizedBox(height: 5),
                    Text(
                      '9334 views • 87 days ago',
                      style: mainPageSubtitle(colorLightGray),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        reactionCard(
                            'assets/images/heart.svg', 'MASH ALLAH (12k)'),
                        reactionCard('assets/images/like.svg', 'LIKE (12k)'),
                        reactionCard('assets/images/share.svg', 'SHARE'),
                        reactionCard('assets/images/flag.svg', 'REPORT'),
                      ],
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    ListTile(
                      leading: CircleAvatar(
                        child: Icon(Icons.person_add_alt_sharp),
                      ),
                      title: Text('Chanel Name'),
                      subtitle: Text(
                        '3M Subscribers',
                        style: mainPageSubtitle(colorLightGray),
                      ),
                      trailing: FittedBox(
                        child: ElevatedButton(
                          onPressed: () {},
                          child: Row(
                            children: [Text('+   '), Text('Subscribe')],
                          ),
                        ),
                      ),
                    ),
                    Divider(
                      height: 2,
                    ),
                    ListTile(
                      title: Text('Comments  7.5k',
                          style: comment(colorLightGray)),
                      trailing: Column(
                        children: [
                          SizedBox(height: 5),
                          Icon(Icons.keyboard_arrow_up, size: 20),
                          Icon(Icons.keyboard_arrow_down, size: 20),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8),
                      child: TextFormField(
                        decoration: commentTextForm('Add Comment'),
                      ),
                    ),
                    Expanded(
                      child: ListView.separated(
                          itemBuilder: (context, index) {
                            return commentsInListTile();
                          },
                          separatorBuilder: (_, __) {
                            return const Divider();
                          },
                          itemCount: 10),
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
