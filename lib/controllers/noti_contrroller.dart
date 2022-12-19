import 'dart:async';

import 'package:flutter_making_friends_app_2/models/friendRequest_model.dart';
import 'package:flutter_making_friends_app_2/models/models.dart';
import 'package:flutter_making_friends_app_2/models/notification_model.dart';
import 'package:flutter_making_friends_app_2/repository/noti_repository.dart';
import 'package:get/get.dart';
import 'package:get/state_manager.dart';

import 'login_controller.dart';

class NotiController extends GetxController {
  var notiList = <Notification>[].obs;
  var isLoading = true.obs;
  final loginController = Get.put(LoginController());
  late UserModel currentUser;
  var friendReqList = <FriendRequest>[].obs;
  Timer? notiTimer;

  @override
  void onInit() {
    super.onInit();
    // fetchNoti();
    currentUser = loginController.loginedUser.value;
    getUserNoti();
    notiTimer = Timer.periodic(const Duration(seconds: 10), (timer) {
      print("Repeating inside notiConmtroller");
      getUserNoti();
    });
  }

  void fetchNoti() async {
    var noties = await NotiRepository.getAllNoti("noti/getAll");
    if (noties != null) {
      notiList.value = noties;
      // print(notiList.toString());
    }
    isLoading.value = false;
    update();
  }

  Future<void> getUserNoti() async {
    // print(currentUser.id!);
    var response =
        await NotiRepository.getUserNoti('user/getFrRq', currentUser.id!);
    // print("response: ${response}");
    if (response != null) {
      friendReqList.value = response;
      // print("Friend request: ${friendReqList.toString()}");
    }
  }
}
