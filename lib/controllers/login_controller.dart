import 'dart:async';
import 'dart:convert';

import 'package:flutter/widgets.dart';
import 'package:flutter_making_friends_app_2/models/login_model.dart';
import 'package:flutter_making_friends_app_2/models/user_model.dart';
import 'package:flutter_making_friends_app_2/repository/user_repository.dart';
import 'package:flutter_making_friends_app_2/screens/screens.dart';
import 'package:flutter_making_friends_app_2/widgets/alert.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginController extends GetxController {
  final GlobalKey<FormState> loginFormKey = GlobalKey<FormState>();
  late TextEditingController usernameController;
  late TextEditingController passwordController;
  var loginedUser = User().obs;
  var isHidden = true.obs;
  var username = '';
  var password = '';
  var errorString = "".obs;
  var isLoading = true.obs;

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
    final prefs = await SharedPreferences.getInstance();

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
    //! login invalid
    if (data == "Cannot read properties of null (reading 'is_active')") {
      Navigator.of(context).pop();
      errorString.value = "Username or password is incorrect!";
      return errorString.value;
    }
    //! login success
    else {
      loginedUser.value = User.fromJson(data);
      await prefs.setString('loginUser', loginedUser.value.id!);
      Get.offAll(const BottomNavScreen(), arguments: loginedUser);
    }
    return null;
  }

  Future<User?> findLoginUserById({required String userId}) async {
    var response = await UserRepository.getUserById('user/getUser/$userId');
    // print('respone: ${response.toString()}');
    var data = json.decode(response);
    if (data.toString().contains('Cast to ObjectId failed')) {
      // print(isLoading.toString());
      // print('can not find user');
      return null;
    } else {
      // print(isLoading.toString());
      // isLoading.value = false;
      loginedUser.value = User.fromJson(data);
      // print(loginedUser.toString());
      return loginedUser.value;
    }
    // print('data: ${data.toString()}');
  }

  void logout(BuildContext context) async {
    Alert.showLoadingIndicatorDialog(context);
    final prefs = await SharedPreferences.getInstance();
    final status = await prefs.remove('loginUser');
    print(status);
    Navigator.of(context).pop();
    Get.offAll(SplashScreen());
  }
}
