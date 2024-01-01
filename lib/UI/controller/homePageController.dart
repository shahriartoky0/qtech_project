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

  int currentPage = 1;
  late int totalPages;
  int pageSize = 25;
  int? nextPageNumber;

  Future<void> loadNextPage() async {
    if (currentPage < totalPages && nextPageNumber != null) {
      await getVideoList(page: nextPageNumber!); // Use the next page number
    }
  }

  Future<bool> getVideoList({int page = 1}) async {
    _inProgressTaskLoader = true;
    update();

    final NetworkResponse response =
    await NetworkCaller().getRequest(URLS.videoList(page));
    _inProgressTaskLoader = false;
    update();

    if (response.isSuccess) {
      totalPages = (response.jsonResponse!['total'] / pageSize).ceil();
      currentPage = page;
      nextPageNumber = response.jsonResponse!['links']['next'];
      videoListDetailsModel =
          VideoListDetailsModel.fromJson(response.jsonResponse!);
      isSuccess = true;
    } else {
      // Handle error or unsuccessful response
    }
    update();
    return isSuccess;
  }
}
