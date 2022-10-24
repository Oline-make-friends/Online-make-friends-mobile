import 'package:flutter/material.dart';
import 'package:flutter_making_friends_app_2/controllers/controllers.dart';
import 'package:flutter_making_friends_app_2/controllers/group_controller.dart';

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
    final groupController = Get.put(GroupController());
    return Scaffold(
      appBar: AppBar(
        title: const Text('Test screen'),
      ),
      body: Column(
        children: [
          Text('test'),
          Obx(
            () {
              return Text(groupController.groupList[0].name!);
            },
          ),
          ElevatedButton(
              onPressed: () {
                groupController.fetchGroups();
              },
              child: const Text('retry'))
        ],
      ),
    );
  }
}
