import 'package:date_time_format/date_time_format.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:qtech_project/style/style.dart';

import '../../data/model/videoList.dart';
import '../screen/videoScreen.dart';

class VideoCardWidget extends StatefulWidget {
  const VideoCardWidget({super.key, required this.result});

  @override
  _VideoCardWidgetState createState() => _VideoCardWidgetState();
  final Results result;
}

class _VideoCardWidgetState extends State<VideoCardWidget> {
  @override
  Widget build(BuildContext context) {
    final dateTime = DateTime.parse(widget.result.dateAndTime ?? '');
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: <Widget>[
            InkWell(
              onTap: () {
                Get.to(VideoScreen(
                  playingVideo: widget.result,
                ));
              },
              child: Stack(
                alignment: Alignment.center,
                children: [
                  Image.network(
                    widget.result.thumbnail ??
                        'https://img.freepik.com/premium-vector/repairs-computer-software-trending-concept-flat-illustration_720185-1381.jpg',
                    fit: BoxFit.cover,
                  ),
                  const Icon(Icons.play_circle_outline,
                      size: 50, color: Colors.white),
                  Positioned(
                    bottom: 10,
                    right: 10,
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 8, vertical: 4),
                      // Adjust padding as needed
                      color: Colors.black.withOpacity(0.5),
                      // Semi-transparent dark background
                      child: Text(
                        widget.result.duration ?? '00 : 00',
                        style: videoDurationText(colorWhite),
                      ),
                    ),
                  )
                ],
              ),
            ),
            ListTile(
              onLongPress: () {
                Get.to(VideoScreen(
                  playingVideo: widget.result,
                ));
              },
              leading: CircleAvatar(
                child: Image.network(widget.result.channelImage ?? ''),
              ),
              title: Text(
                '${widget.result.title}',
                style: homePageVideoTitle(colorGray900),
              ),
              // Replace with actual video title
              subtitle: Text(
                '${widget.result.viewers} views . ${DateTimeFormat.format(dateTime, format: 'M j, Y')}',
                style: homePageVideoSubtitle(colorGray600),
              ),
            )
          ],
        ),
      ),
    );
  }
}
