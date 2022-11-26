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
  var isLoading = true.obs;
  var errorString = ''.obs;
  final loginController = Get.put(LoginController());
  late UserModel currentUser;

  @override
  void onInit() {
    super.onInit();
    currentUser = loginController.loginedUser.value;
    fetchGroups();
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
}
