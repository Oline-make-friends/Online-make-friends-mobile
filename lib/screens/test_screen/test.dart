import 'package:flutter/material.dart';
import 'package:flutter_making_friends_app_2/controllers/controllers.dart';

import 'package:flutter_making_friends_app_2/models/models.dart';

import 'package:get/get.dart';

class TestScreen extends StatelessWidget {
  static const String routeName = '/test';

  static Route route() {
    return MaterialPageRoute(builder: (context) => const TestScreen());
  }

  const TestScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final userController = Get.put(UserController());
    final postController = Get.put(PostController());
    final notiController = Get.put(NotiController());
    User data = Get.arguments;
    // final posts = postController.postList;
    final noties = notiController.notiList;
    // .where((post) => post.createdBy.fullname == data.fullname)
    // .toList();
    return Scaffold(
      appBar: AppBar(
        title: const Text('Test screen'),
      ),
      body: Column(
        children: [],
      ),
    );
  }
}
