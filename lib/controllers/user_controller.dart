import 'package:flutter_making_friends_app_2/models/models.dart';
import 'package:flutter_making_friends_app_2/repository/user_repository.dart';
import 'package:get/state_manager.dart';

class UserController extends GetxController {
  var userList = <User>[].obs;
  var isLoading = true.obs;

  @override
  void onInit() {
    super.onInit();
    fetchUsers();
  }

  Future<void> fetchUsers() async {
    var users = await UserRepository.getAllUser('user/getAll');
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
}
