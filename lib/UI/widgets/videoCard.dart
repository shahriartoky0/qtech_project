import 'package:date_time_format/date_time_format.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

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
                        'https://via.placeholder.com/150',
                    // Replace with actual image URL
                    fit: BoxFit.cover,
                  ),
                  const Icon(Icons.play_circle_outline,
                      size: 50, color: Colors.white),
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
                style: const TextStyle(
                  fontFamily: 'Hind Siliguri',
                ),
              ),
              // Replace with actual video title
              subtitle: Text(
                '${widget.result.viewers} views . ${DateTimeFormat.format(dateTime, format: 'M j, Y')}', // Replace with actual data
              ),
            )
          ],
        ),
      ),
    );
  }
}
