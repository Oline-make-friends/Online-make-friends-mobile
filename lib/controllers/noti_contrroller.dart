import 'package:flutter_making_friends_app_2/models/notification_model.dart';
import 'package:flutter_making_friends_app_2/repository/noti_repository.dart';
import 'package:get/state_manager.dart';

class NotiController extends GetxController {
  var notiList = <Notification>[].obs;
  var isLoading = true.obs;

  @override
  void onInit() {
    super.onInit();
    fetchNoti();
  }

  void fetchNoti() async {
    var noties = await NotiRepository.getAllNoti("noti/getAll");
    if (noties != null) {
      notiList.value = noties;
      print(notiList.toString());
    }
    isLoading.value = false;
    update();
  }
}
