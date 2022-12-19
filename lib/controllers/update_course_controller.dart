import 'package:flutter/widgets.dart';
import 'package:flutter_making_friends_app_2/models/quiz_model.dart';
import 'package:get/state_manager.dart';

class UpdateCourseController extends GetxController {
  late TextEditingController nameController;
  late TextEditingController descController;
  late TextEditingController questionController;
  late TextEditingController answerController;
  var quizzes = <Quiz>[].obs;
}
