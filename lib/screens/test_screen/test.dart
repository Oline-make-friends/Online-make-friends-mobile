import 'package:flutter/material.dart';
import 'package:flutter_making_friends_app_2/controllers/controllers.dart';
import 'package:flutter_making_friends_app_2/controllers/group_controller.dart';

import 'package:flutter_making_friends_app_2/models/models.dart';
import 'package:flutter_making_friends_app_2/screens/news/news_screen.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../widgets/widgets.dart';

class TestScreen extends StatefulWidget {
  static const String routeName = '/test';

  static Route route() {
    return MaterialPageRoute(builder: (context) => const TestScreen());
  }

  const TestScreen({super.key});

  @override
  State<TestScreen> createState() => _TestScreenState();
}

class _TestScreenState extends State<TestScreen> {
  @override
  Widget build(BuildContext context) {
    final loginController = Get.put(LoginController());
    final postController = Get.put(PostController());
    final userController = Get.put(UserController());
    String? loginUser;
    Future<UserModel?> checkLoginUser() async {
      final prefs = await SharedPreferences.getInstance();
      loginUser = prefs.getString('loginUser');
      return loginController.findLoginUserById(userId: loginUser ?? "");
    }

    Post testPost = postController.postList[4];

    return Scaffold(
      appBar: AppBar(
        title: const Text('Test screen'),
      ),
      body: Column(
        children: [
          Text(testPost.comments.toString()),
          ElevatedButton(
            onPressed: () async {
              postController.getCommentUser(testPost.comments![0]);
            },
            child: Text('Test get post by id'),
          )
        ],
      ),
    );
  }
}
