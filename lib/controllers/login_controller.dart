import 'dart:convert';

import 'package:flutter/widgets.dart';
import 'package:flutter_making_friends_app_2/models/login_model.dart';
import 'package:flutter_making_friends_app_2/repository/user_repository.dart';
import 'package:flutter_making_friends_app_2/screens/home/home_screen.dart';
import 'package:get/get.dart';
import 'package:get/state_manager.dart';

class LoginController extends GetxController {
  final GlobalKey<FormState> loginFormKey = GlobalKey<FormState>();
  late TextEditingController usernameController;
  late TextEditingController passwordController;
  var username = '';
  var password = '';
  var errorString = "".obs;

  @override
  void onInit() {
    super.onInit();
    usernameController = TextEditingController();
    passwordController = TextEditingController();
    errorString.obs;
  }

  @override
  void onClose() {
    usernameController.dispose();
    passwordController.dispose();
    super.onClose();
  }

  String? validateUsername(String value) {
    if (value.isEmpty || value.length <= 2) {
      return "Username can't be blank or less than 2 characters";
    }
    return null;
  }

  String? validatePassword(String value) {
    if (value.isEmpty || value.length < 4) {
      return "Password must have more than 4 characters";
    }
    return null;
  }

  Future<String?> login() async {
    final isValid = loginFormKey.currentState!.validate();
    if (!isValid) {
      return null;
    }
    loginFormKey.currentState!.save();
    LoginModel loginModl = LoginModel(
        username: usernameController.text, password: passwordController.text);
    var response =
        await UserRepository.post(loginToJson(loginModl), 'auth/login');
    var data = json.decode(response);
    if (data == "Username or password is wrong!") {
      errorString.value = "Username or password is incorrect!";
      return errorString.value;
    } else if (data["is_admin"] == true) {
      errorString.value = 'You can not access admin account!';
      return errorString.value;
    } else {
      Get.to(const HomeScreen());
    }
    return null;
  }
}
