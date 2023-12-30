import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:qtech_project/data/utility/urls.dart';
import '../../data/model/videoList.dart';
import '../../data/network_caller/network_caller.dart';
import '../../data/network_caller/network_response.dart';

class HomePageController extends GetxController {
  VideoListDetailsModel videoListDetailsModel = VideoListDetailsModel();

  bool get inProgressTaskLoader => _inProgressTaskLoader;
  bool _inProgressTaskLoader = false;
  bool isSuccess = false;

  Future<bool> getVideoList() async {
    _inProgressTaskLoader = true;
    update();

    final NetworkResponse response =
        await NetworkCaller().getRequest(URLS.videoList);
    _inProgressTaskLoader = false;
    update();
    if (response.isSuccess) {

      videoListDetailsModel =
          VideoListDetailsModel.fromJson(response.jsonResponse!);
      isSuccess = true;
    }
    update();
    return isSuccess;
  }
}
