import 'package:flutter/widgets.dart';
import 'package:flutter_making_friends_app_2/models/models.dart';
import 'package:flutter_making_friends_app_2/repository/event_repository.dart';
import 'package:get/get.dart';

import 'login_controller.dart';

class EventController extends GetxController {
  var eventList = <Event>[].obs;
  var searchList = <Event>[].obs;
  var joinedEventList = <Event>[].obs;
  late TextEditingController searchController;
  var isLoading = true.obs;
  var errorString = "".obs;
  final loginController = Get.put(LoginController());
  late User currentUser;

  @override
  void onInit() {
    fetchEvent();
    currentUser = loginController.loginedUser.value;
    searchController = TextEditingController();
    super.onInit();
  }

  Future<void> fetchEvent() async {
    var response = await EventRepository.getAllEvent('event/getAll');
    if (response != null) {
      eventList.value = response;
      // print(eventList.toString());
    }
    joinedEventList.clear();
    for (Event e in eventList) {
      for (User u in e.userJoined!) {
        if (u.id == currentUser.id) {
          joinedEventList.add(e);
          print("Joined events: ${joinedEventList.toString()}");
        }
      }
    }
    isLoading.value = false;
  }

  void searchEvent() {
    searchList.clear();
    for (Event e in eventList) {
      if (e.title!.toLowerCase().contains(searchController.text)) {
        searchList.add(e);
        // print(searchList.toString());
      }
    }
  }

  Future<void> joinEvent({required String eventId}) async {
    var response = await EventRepository.joinEvent(
        'event/joinEvent', eventId, currentUser.id!);
    Get.showSnackbar(
      GetSnackBar(
        message: response,
        duration: const Duration(seconds: 2),
      ),
    );
  }

  Future<void> leaveEvent({required String eventId}) async {
    var response = await EventRepository.joinEvent(
        'event/unJoinEvent', eventId, currentUser.id!);
    Get.showSnackbar(
      GetSnackBar(
        message: "You have left this event!",
        duration: const Duration(seconds: 2),
      ),
    );
  }
}
