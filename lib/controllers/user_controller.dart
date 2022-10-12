import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_making_friends_app_2/models/models.dart';
import 'package:flutter_making_friends_app_2/repository/user_repository.dart';
import 'package:get/state_manager.dart';

class UserController extends GetxController {
  var userList = <User>[].obs;
  var isLoading = true.obs;
  var errorString = "".obs;

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

  void swipeLeft(User currentUser) {
    List<User> users = userList.value;
    userList.value = List.from(users)..remove(currentUser);
  }

  void addFriend(BuildContext context, String userId, String friendId) async {
    var response =
        await UserRepository.addFriend('user/addFriend', userId, friendId);
    var data = json.decode(response);
    ScaffoldMessenger.of(context)
        .showSnackBar(const SnackBar(content: Text('Friend Added')));
    print(data);
  }
}
