import 'dart:async';
import 'dart:convert';
import 'dart:developer';

import 'package:cometchat/cometchat_sdk.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_making_friends_app_2/controllers/controllers.dart';
import 'package:flutter_making_friends_app_2/models/login_model.dart';
import 'package:flutter_making_friends_app_2/models/user_model.dart';
import 'package:flutter_making_friends_app_2/repository/user_repository.dart';
import 'package:flutter_making_friends_app_2/screens/screens.dart';
import 'package:flutter_making_friends_app_2/widgets/alert.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:zego_uikit_prebuilt_call/zego_uikit_prebuilt_call.dart';

import '../config/settings.dart';

class LoginController extends GetxController {
  final GlobalKey<FormState> loginFormKey = GlobalKey<FormState>();
  late TextEditingController usernameController;
  late TextEditingController passwordController;
  var googleAcount = Rx<GoogleSignInAccount?>(null);
  var _googleSignIn = GoogleSignIn(
    scopes: <String>[
      'email',
    ],
  );
  var loginedUser = UserModel().obs;
  var isHidden = true.obs;
  var username = '';
  var password = '';
  var errorString = "".obs;
  var isLoading = true.obs;
  final updateController = Get.put(UpdateProfileController());

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
    if (value.isEmpty ||
        !value.contains('@gmail.com') && !value.contains('@fpt.edu.vn')) {
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
    var data = json.decode(response.toString());
    // log(data["is_prove"].toString());
    //! login invalid
    if (data == "Cannot read property 'is_active' of null") {
      Navigator.of(context).pop();
      errorString.value = "Username or password is incorrect!";
      return errorString.value;
    } else if (data == "This account has been baned") {
      Navigator.of(context).pop();
      errorString.value = "This account has been baned";
      return errorString.value;
    }

    //! login success
    else {
      UserModel verifyUser = UserModel.isProveFromModel(data);
      if (verifyUser.isProve == false) {
        Navigator.of(context).pop();
        errorString.value = "Account need verification from admin!";
        return errorString.value;
      } else {
        loginedUser.value = UserModel.fromJson(data);
        await prefs.setString('loginUser', loginedUser.value.id!);
        await loginComet(loginedUser.value);
        errorString.value = "";
        usernameController = TextEditingController();
        passwordController = TextEditingController();
        if (loginedUser.value.about == "") {
          updateController.statusIsBlank.value = true;
          showDialog(
              context: context,
              builder: (context) {
                return AlertDialog(
                  content: Text('Provide more information for the account!'),
                  actions: [
                    TextButton(
                      onPressed: () {
                        Get.offAll(UpdateProfileScreen());
                      },
                      child: const Text('UPDATE NOW'),
                    )
                  ],
                );
              });
        } else {
          Get.offAll(BottomNavScreen(), arguments: loginedUser);
        }
      }
    }
    return null;
  }

  Future<UserModel?> findLoginUserById({required String userId}) async {
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
      loginedUser.value = UserModel.fromJson(data);
      // print(loginedUser.toString());
      return loginedUser.value;
    }
    // print('data: ${data.toString()}');
  }

  Future<void> logout(BuildContext context) async {
    Alert.showLoadingIndicatorDialog(context);
    final prefs = await SharedPreferences.getInstance();
    final status = await prefs.remove('loginUser');
    logoutComet();
    print(status);
    Navigator.of(context).pop();
    Get.offAll(SplashScreen());
  }

  Future<void> loginComet(UserModel loginUser) async {
    final user = await CometChat.getLoggedInUser();
    if (user == null) {
      await CometChat.login(loginUser.id!, authKey, onSuccess: (User user) {
        debugPrint("Login Successful : $user");
      }, onError: (CometChatException ce) {
        debugPrint("Login failed with exception:  ${ce.message}");
      });
    }
  }

  void logoutComet() {
    CometChat.logout(onSuccess: (message) {
      debugPrint("Logout successful with message $message");
    }, onError: (CometChatException ce) {
      debugPrint("Logout failed with exception:  ${ce.message}");
    });
  }

  loginGoogle(BuildContext context) async {
    final prefs = await SharedPreferences.getInstance();

    await _googleSignIn.signOut();
    googleAcount.value = await _googleSignIn.signIn();
    log("google email: ${googleAcount.value?.email}");
    var response = await UserRepository.loginByGmail(
        'auth/loginByGmail/${googleAcount.value?.email}');
    var data = json.decode(response.toString());
    //! login invalid
    if (data == "Cannot read property 'is_active' of null") {
      Navigator.of(context).pop();
      errorString.value = "Account is not registered!";
      return errorString.value;
    } else if (data == "This account has been baned") {
      Navigator.of(context).pop();
      errorString.value = "This account has been baned";
      return errorString.value;
    }

    //! login success
    else {
      UserModel verifyUser = UserModel.isProveFromModel(data);
      if (verifyUser.isProve == false) {
        Navigator.of(context).pop();
        errorString.value = "Account need verification from admin!";
        return errorString.value;
      } else {
        loginedUser.value = UserModel.fromJson(data);
        await prefs.setString('loginUser', loginedUser.value.id!);
        await loginComet(loginedUser.value);
        errorString.value = "";
        usernameController = TextEditingController();
        passwordController = TextEditingController();
        if (loginedUser.value.about == "") {
          updateController.statusIsBlank.value = true;
          showDialog(
              context: context,
              builder: (context) {
                return AlertDialog(
                  content: Text('Provide more information for the account!'),
                  actions: [
                    TextButton(
                      onPressed: () {
                        Get.offAll(UpdateProfileScreen());
                      },
                      child: const Text('UPDATE NOW'),
                    )
                  ],
                );
              });
        } else {
          Get.offAll(BottomNavScreen(), arguments: loginedUser);
        }
      }
    }
    return null;
  }
}
