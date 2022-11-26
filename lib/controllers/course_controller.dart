import 'package:flutter_making_friends_app_2/models/course_model.dart';
import 'package:flutter_making_friends_app_2/repository/course_repository.dart';
import 'package:get/state_manager.dart';

class CourseController extends GetxController {
  var courseList = <Course>[].obs;
  var isLoading = true.obs;
  var errorString = "".obs;
  var score = 0.obs;

  @override
  void onInit() {
    fetchCourse();
    super.onInit();
  }

  Future<void> fetchCourse() async {
    var response = await CourseRepository.getAllCourse("course/getAll");
    if (response != null) {
      courseList.value = response;
      print(courseList.toString());
    }
    isLoading.value = false;
  }
}
