import 'dart:convert';

import 'package:cometchat/cometchat_sdk.dart';
import 'package:cometchat/models/user.dart' as CometUser;
import 'package:flutter/material.dart';
import 'package:flutter_making_friends_app_2/controllers/login_controller.dart';
import 'package:flutter_making_friends_app_2/models/user_model.dart';
import 'package:get/get.dart';

import '../config/settings.dart';
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
  final loginController = Get.put(LoginController());
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
      return;
    }
    registerFormKey.currentState!.save();
    Alert.showLoadingIndicatorDialog(context);
    UserModel registerUser = UserModel(
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
      UserModel currentUser = UserModel.fromJson(data);
      // loginController.loginedUser.value = currentUser;
      await registerComet(currentUser);
      // Get.to(const BottomNavScreen());
      Get.back();
    }
  }

  Future<void> registerComet(UserModel user) async {
    CometChat.createUser(
      CometUser.User(
        name: user.fullname!,
        uid: user.id!,
        avatar: user.avatarUrl,
      ),
      authKey,
      onSuccess: (message) {
        debugPrint('Register successfully: $message');
      },
      onError: (CometChatException ce) {
        debugPrint('Create user failed: ${ce.message}');
      },
    );
  }
}
