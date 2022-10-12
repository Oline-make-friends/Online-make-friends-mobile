import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_making_friends_app_2/models/user_model.dart';
import 'package:get/get.dart';
import 'package:get/state_manager.dart';

import '../repository/repository.dart';
import '../screens/screens.dart';
import '../widgets/alert.dart';

class RegisterController extends GetxController {
  final GlobalKey<FormState> registerFormKey = GlobalKey<FormState>();
  late TextEditingController emailController;
  late TextEditingController passwordController;
  late TextEditingController fullnameController;
  late TextEditingController doBController;
  late TextEditingController rePasswordController;
  late String genderValue;

  var email = '';
  var password = '';
  var rePassword = '';
  var fullname = '';
  var doB = '';
  var errorString = "".obs;

  @override
  void onInit() {
    super.onInit();
    emailController = TextEditingController();
    passwordController = TextEditingController();
    fullnameController = TextEditingController();
    doBController = TextEditingController();
    rePasswordController = TextEditingController();
    genderValue = 'Male';
  }

  @override
  void onClose() {
    emailController.dispose();
    passwordController.dispose();
    fullnameController.dispose();
    doBController.dispose();
    rePasswordController.dispose();
    super.onClose();
  }

  String? validateUsername(String value) {
    if (value.isEmpty || !value.contains('@gmail.com')) {
      return "email is invalid";
    }
    return null;
  }

  String? validatePassword(String value) {
    if (value.isEmpty || value.length < 6) {
      return "Password must have more than 6 characters";
    }
    return null;
  }

  String? validateRePassword(String value) {
    if (value != passwordController.text) {
      return "Password does not match";
    }
    return null;
  }

  String? validateFullname(String value) {
    if (value.isEmpty || value.length < 10) {
      return "fullname must have more than 10 characters";
    }
    return null;
  }

  Future<void> register(BuildContext context) async {
    final isValid = registerFormKey.currentState!.validate();
    if (!isValid) {
      return null;
    }
    registerFormKey.currentState!.save();
    Alert.showLoadingIndicatorDialog(context);
    User registerUser = User(
      username: emailController.text,
      password: passwordController.text,
      fullname: fullnameController.text,
      gender: genderValue,
      dateOfBirth: doBController.text,
    );
    var response = await UserRepository.postLogin(
        registerToJson(registerUser), 'auth/register');
    // print('regsiter controller response: ${response.toString()}');
    var data = json.decode(response);
    if (data.toString().contains("duplicate key")) {
      errorString.value =
          'Your email has been registered, try using another one!';
      Navigator.of(context).pop();
    } else {
      Navigator.of(context).pop();
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text('Account created!')));
      User currentUser = User.fromJson(data);
      // print("current user logined: ${currentUser.toString()}");
      Get.to(const BottomNavScreen(), arguments: currentUser);
    }
  }
}
