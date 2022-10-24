import 'package:flutter_making_friends_app_2/repository/repository.dart';
import 'package:get/state_manager.dart';

import '../models/models.dart';

class GroupController extends GetxController {
  var groupList = <Group>[].obs;
  var isLoading = true.obs;
  var errorString = ''.obs;

  @override
  void onInit() {
    super.onInit();
    fetchGroups();
  }

  Future<void> fetchGroups() async {
    var groups = await GroupRepository.getAllGroup('group/getAll');
    print("groups: ${groups.toString()}");
    if (groups != null) {
      groupList.value = groups;
      print("groups fetch: ${groupList.toString()}");
    }
    isLoading.value = false;
  }
}
