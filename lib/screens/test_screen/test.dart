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
    String? loginUser;
    Future<User?> checkLoginUser() async {
      final prefs = await SharedPreferences.getInstance();
      loginUser = prefs.getString('loginUser');
      return loginController.findLoginUserById(userId: loginUser ?? "");
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text('Test screen'),
      ),
      body: Column(
        children: [
          Text('user id: ${loginController.loginedUser.value.id!}'),
          FutureBuilder(
            future: checkLoginUser(),
            builder: (context, snapshot) {
              var foundUser;
              if (snapshot.hasData) {
                foundUser = snapshot;
                return Text(snapshot.toString());
              } else if (!snapshot.hasData) {
                return Text('none');
              }
              return Text('error');
            },
          )
        ],
      ),
    );
  }
}
