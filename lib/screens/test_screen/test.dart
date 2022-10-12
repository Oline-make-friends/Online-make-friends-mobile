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
    // final userController = Get.put(UserController());
    // final notiController = Get.put(NotiController());
    final postController = Get.put(PostController());
    User data = Get.arguments;
    final posts = postController.postList
        .where((p) => data.friends!.contains(p) && p.isDeleted == true)
        .toList();

    // final noties = notiController.notiList;
    // .where((post) => post.createdBy.fullname == data.fullname)
    // .toList();
    return Scaffold(
      appBar: AppBar(
        title: const Text('Test screen'),
      ),
      body: Column(
        children: [
          Text(data.toString()),
          // Obx(
          //   () {
          //     if (userController.isLoading.value) {
          //       return Text('Loading...');
          //     } else {
          //       return Text(userController.userList[0].fullname!);
          //     }
          //   },
          // ),
          Obx(
            () {
              if (postController.isLoading.value) {
                return Text('Loading...');
              } else {
                if (posts.length == 0) {
                  return Text('There is no friends posts');
                } else {
                  return Text(posts[0].createdBy.fullname!);
                }
              }
            },
          )
          // Text(postController.postList[0].content),
          // Text(postController.postList[0].imageUrl),
          // Text(postController.postList[0].createdBy.fullname!),
          // Text(postController.postList[0].createdAt.toString()),
          // Text(postController.postList[0].content),
        ],
      ),
    );
  }
}
