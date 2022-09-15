import 'dart:convert';

import 'package:flutter/widgets.dart';
import 'package:flutter_making_friends_app_2/models/login_model.dart';
import 'package:flutter_making_friends_app_2/repository/user_repository.dart';
import 'package:flutter_making_friends_app_2/screens/home/home_screen.dart';
import 'package:get/get.dart';
import 'package:get/state_manager.dart';

class LoginController extends GetxController {
  TextEditingController usernameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  void login() async {
    LoginModel loginModl = LoginModel(
        username: usernameController.text, password: passwordController.text);
    var response =
        await UserRepository.post(loginToJson(loginModl), 'auth/login');
    // print(response);
    var data = json.decode(response);
    print(data);
    if (data == "Username or password is wrong!") {
      print("Error");
      return;
    }
    if (data["is_admin"] == true) {
      print('You can access admin account!');
      return;
    } else {
      Get.to(HomeScreen());
    }
  }
}
