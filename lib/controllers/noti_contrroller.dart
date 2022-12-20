import 'dart:async';
import 'dart:developer';

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
    getUserFriendRequest();
    getUserNoti();
    notiTimer = Timer.periodic(const Duration(seconds: 10), (timer) {
      log("Repeating inside notiConmtroller");
      getUserFriendRequest();
      getUserNoti();
    });
  }

  Future<void> getUserFriendRequest() async {
    // print(currentUser.id!);
    var response = await NotiRepository.getUserFriendRequest(
        'user/getFrRq', currentUser.id!);
    // print("response: ${response}");
    if (response != null) {
      friendReqList.value = response;
      // print("Friend request: ${friendReqList.toString()}");
    }
  }

  Future<void> getUserNoti() async {
    var response =
        await NotiRepository.getUserNoti('noti/get', currentUser.id!);
    if (response != null) {
      notiList.value = response;
    }
  }

  Future<void> addNoti(String content, String title, String userId) async {
    Notification newNoti = Notification(
      title: title,
      content: content,
      userId: userId,
    );
    var response =
        await NotiRepository.addNoti('noti/add', notificationToJson(newNoti));
    if (response == true) {
      log("Noti created!");
    } else {
      log("Noti error!");
    }
  }
}
