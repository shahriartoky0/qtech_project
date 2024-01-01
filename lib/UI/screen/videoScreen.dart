import 'package:appinio_video_player/appinio_video_player.dart';
import 'package:date_time_format/date_time_format.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:qtech_project/data/model/videoList.dart';
import 'package:qtech_project/style/style.dart';
import '../controller/videoController.dart';
import '../widgets/commentsInListTile.dart';
import '../widgets/reactionCard.dart';

class VideoScreen extends StatefulWidget {
  const VideoScreen({Key? key, required this.playingVideo});

  final Results playingVideo;

  @override
  State<VideoScreen> createState() => _VideoScreenState();
}

class _VideoScreenState extends State<VideoScreen> {
  late CustomVideoPlayerController _customVideoPlayerController;

  @override
  void initState() {
    super.initState();
    Get.find<AppVideoController>()
        .initializeVideoPlayer(context, widget.playingVideo.manifest ?? '');
  }

  Widget build(BuildContext context) {
    Results currentVideo = widget.playingVideo;
    double screenSize = MediaQuery.of(context).size.width;
    final dateTime = DateTime.parse(currentVideo.dateAndTime ?? '');

    return SafeArea(
      child: Scaffold(
        body: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            GetBuilder<AppVideoController>(builder: (appVideoController) {
              if (appVideoController.isPlaying) {
                // Show Video Player
                return Visibility(
                  replacement:
                      const Stack(alignment: Alignment.center, children: [
                    SizedBox(
                      width: 200,
                      height: 200,
                    ),
                    Center(child: CircularProgressIndicator())
                  ]),
                  visible: appVideoController.loader == false,
                  child: CustomVideoPlayer(
                    customVideoPlayerController:
                        appVideoController.customVideoPlayerController,
                  ),
                );
              } else {
                // Show Thumbnail and Play Button
                return GestureDetector(
                  onTap: () {
                    appVideoController.initializeVideoPlayer(
                        context, currentVideo.manifest ?? '');
                    appVideoController.togglePlaying(); // toggle video state
                  },
                  child: Stack(
                    alignment: Alignment.center,
                    children: [
                      Image.network(
                        currentVideo.thumbnail ??
                            'https://img.freepik.com/premium-vector/repairs-computer-software-trending-concept-flat-illustration_720185-1381.jpg',
                        fit: BoxFit.cover,
                        width: double.infinity,
                        height: 200,
                      ),
                      const Icon(Icons.play_circle_outline,
                          size: 64, color: Colors.white),
                    ],
                  ),
                );
              }
            }),
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
                        style: playingVideoHeading(colorGray900),
                      ),
                      const SizedBox(height: 5),
                      Text(
                        '${currentVideo.viewers} views • ${DateTimeFormat.format(dateTime, format: 'i')} days ago',
                        style: channelSubscriber(colorGray600),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      screenSize < 300
                          ? Wrap(
                              spacing: 8.0,
                              runSpacing: 8.0,
                              children: [
                                reactionCard('assets/images/heart.svg',
                                    'MASH ALLAH (12k)'),
                                reactionCard(
                                    'assets/images/like.svg', 'LIKE (12k)'),
                                reactionCard(
                                    'assets/images/share.svg', 'SHARE'),
                                reactionCard(
                                    'assets/images/flag.svg', 'REPORT'),
                              ],
                            )
                          : Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                reactionCard('assets/images/heart.svg',
                                    'MASH ALLAH (12k)'),
                                reactionCard(
                                    'assets/images/like.svg', 'LIKE (12k)'),
                                reactionCard(
                                    'assets/images/share.svg', 'SHARE'),
                                reactionCard(
                                    'assets/images/flag.svg', 'REPORT'),
                              ],
                            ),
                      const SizedBox(
                        height: 10,
                      ),
                      ListTile(
                        leading: CircleAvatar(
                          // child: Icon(Icons.person_add_alt_sharp),
                          child: Image.network(currentVideo.channelImage ??
                              'https://w7.pngwing.com/pngs/81/570/png-transparent-profile-logo-computer-icons-user-user-blue-heroes-logo-thumbnail.png'),
                        ),
                        title: Text('${currentVideo.channelName}',style: comment(colorGray900),),
                        subtitle: Text(
                          '${currentVideo.channelSubscriber} subscribers',
                          style: mainPageSubtitle(colorLightGray),
                        ),
                        trailing: FittedBox(
                          child: ElevatedButton(
                            onPressed: () {},
                            child: const Row(
                              children: [Text('+   '), Text('Subscribe')],
                            ),
                          ),
                        ),
                      ),
                      const Divider(
                        height: 2,
                      ),
                      ListTile(
                        title:
                            Text('Comments 5', style: comment(colorGray600)),
                        trailing: const Column(
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
                        itemCount: 5,
                      )
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

  @override
  void dispose() {
    _customVideoPlayerController.dispose();
    super.dispose();
  }
}
