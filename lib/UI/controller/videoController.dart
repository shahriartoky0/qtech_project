import 'package:appinio_video_player/appinio_video_player.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class AppVideoController extends GetxController {
  bool _loader = false;

  bool get loader => _loader;
  bool _isPlaying = false;
  bool get isPlaying => _isPlaying;

  late CustomVideoPlayerController customVideoPlayerController;

  void initializeVideoPlayer(BuildContext context, String stringUrl) {
    VideoPlayerController videoPlayerController;
    _loader = true;
    update();
    videoPlayerController =
        VideoPlayerController.networkUrl(Uri.parse(stringUrl ?? ''))
          ..initialize().then((value) {
            _loader = false;

            update();
          });

    customVideoPlayerController = CustomVideoPlayerController(
        context: context, videoPlayerController: videoPlayerController);
  }
  void togglePlaying() {
    _isPlaying = !_isPlaying;
    update(); // Notify listeners about change.
  }

  @override
  void dispose() {
    customVideoPlayerController.dispose();
    super.dispose();
  }

}
