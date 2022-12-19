import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_making_friends_app_2/controllers/controllers.dart';
import 'package:flutter_making_friends_app_2/models/course_model.dart';
import 'package:flutter_making_friends_app_2/models/user_model.dart';
import 'package:flutter_making_friends_app_2/repository/course_repository.dart';
import 'package:get/get.dart';
import 'package:get/state_manager.dart';

import '../widgets/alert.dart';

class CourseController extends GetxController {
  var courseList = <Course>[].obs;
  var userCourseList = <Course>[].obs;
  var isLoading = true.obs;
  var errorString = "".obs;
  var score = 0.obs;
  final loginController = Get.put(LoginController());
  late UserModel loginedUser;
  late TextEditingController nameController;
  late TextEditingController descController;

  @override
  void onInit() {
    fetchCourse();
    super.onInit();
    loginedUser = loginController.loginedUser.value;
    nameController = TextEditingController();
    descController = TextEditingController();
    getUserCourse();
  }

  Future<void> fetchCourse() async {
    var response = await CourseRepository.getAllCourse("course/getAll");
    if (response != null) {
      courseList.value = response;
      // print(courseList.toString());
    }
    isLoading.value = false;
  }

  Future<void> createCourse(BuildContext context) async {
    Alert.showLoadingIndicatorDialog(context);

    Course newCourse = Course(
      createdBy: loginedUser,
      name: nameController.text,
      description: descController.text,
    );

    var response = await CourseRepository.createCourse(
        "course/add", courseToJson(newCourse));
    await fetchCourse();
    await getUserCourse();
    Navigator.of(context).pop();
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        duration: Duration(seconds: 2),
        content: Text('Course has been created!'),
      ),
    );
  }

  Future<void> getUserCourse() async {
    var response = await CourseRepository.getUserCourse(
        'course/getUser/${loginedUser.id!}');
    if (response == null) {
      userCourseList.value = <Course>[];
    } else {
      userCourseList.value = response;
    }
  }
}
