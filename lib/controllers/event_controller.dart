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
  late TextEditingController titleController;
  late TextEditingController typeController;
  late TextEditingController descController;
  late DateTime startDateController;
  var isLoading = true.obs;
  var errorString = "".obs;
  final loginController = Get.put(LoginController());
  late UserModel currentUser;
  var eventCreated = <Event>[].obs;

  @override
  void onInit() {
    fetchEvent();
    getEventCreated();
    currentUser = loginController.loginedUser.value;
    searchController = TextEditingController();
    titleController = TextEditingController();
    typeController = TextEditingController();
    descController = TextEditingController();
    startDateController = DateTime.now();
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
      for (UserModel u in e.userJoined!) {
        if (u.id == currentUser.id) {
          joinedEventList.add(e);
          // print("Joined events: ${joinedEventList.toString()}");
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

  Future<void> createEvent() async {
    Event newEvent = Event(
      title: titleController.text,
      type: typeController.text,
      description: descController.text,
      updatedAt: startDateController,
      createdBy: loginController.loginedUser.value,
    );

    var response =
        await EventRepository.addEvent('event/add', eventToJson(newEvent));
  }

  Future<void> getEventCreated() async {
    var response = await EventRepository.getUserEvent(
        "event/getEventCreated", loginController.loginedUser.value.username!);
    if (response != null) {
      eventCreated.value = eventCreatedFromJson(response);
    }
  }
}
