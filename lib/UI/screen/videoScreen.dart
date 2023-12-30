import 'package:date_time_format/date_time_format.dart';
import 'package:flutter/material.dart';
import 'package:qtech_project/data/model/videoList.dart';
import 'package:qtech_project/style/style.dart';

import '../widgets/commentsInListTile.dart';
import '../widgets/reactionCard.dart';

class VideoScreen extends StatefulWidget {
  const VideoScreen({Key? key, required this.playingVideo});

  final Results playingVideo;

  @override
  State<VideoScreen> createState() => _VideoScreenState();
}

class _VideoScreenState extends State<VideoScreen> {
  @override
  Widget build(BuildContext context) {
    Results currentVideo = widget.playingVideo;
    final dateTime = DateTime.parse(currentVideo.dateAndTime ?? '');
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
                child: SingleChildScrollView(
                  scrollDirection: Axis.vertical,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        currentVideo.title.toString(),
                        style: videoHeading(colorBlack),
                      ),
                      SizedBox(height: 5),
                      Text(
                        '${currentVideo.viewers} views • ${DateTimeFormat.format(dateTime, format: 'i')} days ago',
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
                      ListView.separated(
                          shrinkWrap: true,
                          itemBuilder: (context, index) {
                            return commentsInListTile();
                          },
                          separatorBuilder: (_, __) {
                            return const Divider();
                          },
                          itemCount: 10)
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
