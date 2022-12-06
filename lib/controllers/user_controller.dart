import 'dart:convert';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_making_friends_app_2/models/models.dart';
import 'package:flutter_making_friends_app_2/repository/repository.dart';
import 'package:flutter_making_friends_app_2/repository/user_repository.dart';
import 'package:get/state_manager.dart';
import 'package:get/get.dart';

class UserController extends GetxController {
  var userList = <UserModel>[].obs;
  var isLoading = true.obs;
  var errorString = "".obs;
  var foundUser = UserModel().obs;

  @override
  void onInit() {
    super.onInit();
    fetchUsers();
  }

  Future<void> fetchUsers() async {
    var users = await UserRepository.getAllUser('user/getAllUser');
    // print(users.toString());
    if (users != null) {
      userList.value = users;
      // print(userList[0]);
    }
    isLoading.value = false;
    update();
  }

  void swipeLeft(UserModel currentUser) {
    List<UserModel> users = userList.value;
    userList.value = List.from(users)..remove(currentUser);
  }

  Future<void> addFriend(
      BuildContext context, String userId, String friendId) async {
    var response =
        await UserRepository.addFriend('user/addFriend', userId, friendId);
    var data = json.decode(response);
    ScaffoldMessenger.of(context)
        .showSnackBar(const SnackBar(content: Text('Friend Added')));
    print(data);
  }

  void sendFriendRequest(String senderId, String receiverId) async {
    var response = await UserRepository.sendFriendRequest(
        'user/requestFriend', senderId, receiverId);
    var data = json.decode(response);
    print(data);
    Get.showSnackbar(
      GetSnackBar(
        title: "A friend request has been sent",
      ),
    );
    update();
  }

  Future<void> deleteFriendRequest(String requestId) async {
    var response = await UserRepository.deleletFriendRequest(
        'friendRequest/deleteFrRq/$requestId');
    print(response);
  }

  Future<void> sendEmailResetPassword(String username) async {
    var response = await UserRepository.sendEmailResetPassword(
        'sendMail/sendEmailResetPassword/$username');
    log(response);
  }
}
