import 'dart:convert';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_making_friends_app_2/controllers/login_controller.dart';
import 'package:flutter_making_friends_app_2/models/models.dart';
import 'package:flutter_making_friends_app_2/repository/repository.dart';
import 'package:flutter_making_friends_app_2/repository/user_repository.dart';
import 'package:get/get.dart';

class UserController extends GetxController {
  final GlobalKey<FormState> updatePasswordFormKey = GlobalKey<FormState>();

  var userList = <UserModel>[].obs;
  var isLoading = true.obs;
  var errorString = "".obs;
  var foundUsers = <UserModel>[].obs;
  late TextEditingController currentPasswordController;
  late TextEditingController newPasswordController;
  late TextEditingController retypeNewPasswordController;
  final loginController = Get.put(LoginController());
  late UserModel currentUser;
  var isHidden = true.obs;
  late TextEditingController searchController;

  var currentPassword = "";
  var newPassword = "";
  var retypePassword = "";

  @override
  void onInit() {
    super.onInit();
    fetchUsers();
    currentPasswordController = TextEditingController();
    newPasswordController = TextEditingController();
    currentUser = loginController.loginedUser.value;
    retypeNewPasswordController = TextEditingController();
    searchController = TextEditingController();
  }

  String? validatePassword(String value) {
    if (value.isEmpty || value.length < 4) {
      return "Password must have more than 6 characters";
    }
    return null;
  }

  String? validatecurrentPassword(String value) {
    if (value != currentUser.password) {
      return "Your current password is not matched! ";
    }
    return null;
  }

  String? validateRetpyePassword(String value) {
    if (value != newPasswordController.text) {
      return "New password is not matched!";
    }
    return null;
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

  void searchUser() {
    foundUsers.clear();
    log(searchController.text);
    for (UserModel user in userList) {
      if (user.fullname!
          .toLowerCase()
          .contains(searchController.text.toLowerCase())) {
        // log("found!");
        foundUsers.add(user);
        log(foundUsers[0].fullname!.toString());
      }
    }
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

  void sendFriendRequest(
      String senderId, String receiverId, BuildContext context) async {
    for (dynamic friend in currentUser.friends!) {
      Friend currentFriend = Friend.fromJson(friend);
      if (currentFriend.id == receiverId) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            duration: const Duration(seconds: 2),
            content: Text("You've already friend with this user!"),
          ),
        );
        return;
      }
    }
    var response = await UserRepository.sendFriendRequest(
        'user/requestFriend', senderId, receiverId);
    var data = json.decode(response);
    print(data);
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        duration: const Duration(seconds: 2),
        content: Text("A friend request has been sent!"),
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

  Future<void> followUser(
      String userId, String followerId, BuildContext context) async {
    var response =
        await UserRepository.followUser("user/followUser", userId, followerId);
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        duration: const Duration(seconds: 2),
        content: Text("You are following this user!"),
      ),
    );
  }

  Future<String?> updatePassword(BuildContext context) async {
    final isValid = updatePasswordFormKey.currentState!.validate();
    if (!isValid) {
      return null;
    }
    updatePasswordFormKey.currentState!.save();
    var response = await UserRepository.updatePassword(
        "user/update/${currentUser.id}", newPasswordController.text);
    if (response != null) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: const Text('Update password successfully'),
        ),
      );
      Get.back();
    }
    return null;
  }
}
