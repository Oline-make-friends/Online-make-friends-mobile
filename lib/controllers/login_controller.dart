import 'dart:async';
import 'dart:convert';

import 'package:flutter/widgets.dart';
import 'package:flutter_making_friends_app_2/models/login_model.dart';
import 'package:flutter_making_friends_app_2/models/user_model.dart';
import 'package:flutter_making_friends_app_2/repository/user_repository.dart';
import 'package:flutter_making_friends_app_2/screens/screens.dart';
import 'package:flutter_making_friends_app_2/widgets/alert.dart';
import 'package:get/get.dart';

class LoginController extends GetxController {
  final GlobalKey<FormState> loginFormKey = GlobalKey<FormState>();
  late TextEditingController usernameController;
  late TextEditingController passwordController;
  var isHidden = true.obs;
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
    if (value.isEmpty || !value.contains('@gmail.com')) {
      return "email is invalid";
    }
    return null;
  }

  String? validatePassword(String value) {
    if (value.isEmpty || value.length < 4) {
      return "Password must have more than 6 characters";
    }
    return null;
  }

  Future<String?> login(BuildContext context) async {
    final isValid = loginFormKey.currentState!.validate();
    if (!isValid) {
      return null;
    }
    loginFormKey.currentState!.save();
    Alert.showLoadingIndicatorDialog(context);
    LoginModel loginModl = LoginModel(
        username: usernameController.text, password: passwordController.text);
    var response =
        await UserRepository.postLogin(loginToJson(loginModl), 'auth/login');
    if (response ==
        'TimeoutException after 0:00:30.000000: Future not completed') {
      Navigator.of(context).pop();
      errorString.value = "Server timeout! Please try again!";
      return errorString.value;
    }
    var data = json.decode(response);
    if (data == "Username or password is wrong!") {
      Navigator.of(context).pop();
      errorString.value = "Username or password is incorrect!";
      return errorString.value;
      // } else if (data["is_admin"] == true) {
      //   errorString.value = 'You can not access admin account!';
      //   return errorString.value;
    } else {
      User currentUser = User.fromJson(data);

      // print("current user logined: ${currentUser.toString()}");
      Get.offAll(const BottomNavScreen(), arguments: currentUser);
    }
    return null;
  }
}
