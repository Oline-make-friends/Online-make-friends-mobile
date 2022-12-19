import 'dart:convert';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_making_friends_app_2/repository/repository.dart';
import 'package:get/get.dart';
import 'package:get/state_manager.dart';

import '../models/models.dart';
import 'controllers.dart';

class GroupController extends GetxController {
  var groupList = <Group>[].obs;
  var popularGroups = <Group>[].obs;
  var joinedGroup = <Group>[].obs;
  var adminList = <UserModel>[];
  var memberList = <UserModel>[];
  var currentGroup = Group().obs;
  var isLoading = true.obs;
  var errorString = ''.obs;
  final loginController = Get.put(LoginController());
  late UserModel currentUser;
  late TextEditingController contentController;
  var imgUrl = "".obs;

  @override
  void onInit() {
    super.onInit();
    currentUser = loginController.loginedUser.value;
    fetchGroups();
    contentController = TextEditingController();
  }

  Future<void> fetchGroups() async {
    var groups = await GroupRepository.getAllGroup('group/getAll');
    // print("groups: ${groups.toString()}");
    if (groups != null) {
      groupList.value = groups;
      popularGroups.value =
          groupList.where((group) => group.members!.length > 2).toList();
      joinedGroup.value = groupList
          .where((group) => group.members!.contains(currentUser.id))
          .toList();
      // print("groups fetch: ${groupList.toString()}");
    }
    isLoading.value = false;
  }

  Future<void> joinGroup({required String groupId}) async {
    // print(currentUser.id!);
    var response =
        await GroupRepository.joinGroup('group/join', groupId, currentUser.id!);
    Get.showSnackbar(GetSnackBar(
      message: response,
      duration: const Duration(seconds: 2),
    ));
  }

  Future<void> findAdminById({required String userId}) async {
    var response = await UserRepository.getUserById('user/getUser/$userId');
    // print('respone: ${response.toString()}');
    var data = json.decode(response);
    if (data.toString().contains('Cast to ObjectId failed')) {
      // print(isLoading.toString());
      // print('can not find user');
      return;
    } else {
      UserModel foundUser = UserModel.fromJson(data);
      adminList.add(foundUser);
      print("Admis: ${adminList.toString()}");
    }
    // print('data: ${data.toString()}');
  }

  Future<void> findMemberById({required String userId}) async {
    var response = await UserRepository.getUserById('user/getUser/$userId');
    // print('respone: ${response.toString()}');
    var data = json.decode(response);
    if (data.toString().contains('Cast to ObjectId failed')) {
      // print(isLoading.toString());
      // print('can not find user');
      return;
    } else {
      UserModel foundUser = UserModel.fromJson(data);
      memberList.add(foundUser);
      print("Members: ${memberList.toString()}");
    }
    // print('data: ${data.toString()}');
  }

  Future<void> uploadPost(String idGroup) async {
    var response = await GroupRepository.uploadGroupPost(
        "group/upload",
        loginController.loginedUser.value,
        imgUrl.value,
        contentController.text,
        idGroup);
    log(response);
  }

  Future<void> leaveGroup() async {
    var response = await GroupRepository.leaveGroup("group/leave",
        currentGroup.value.id!, loginController.loginedUser.value.id!);
    log(response.toString());
  }
}
