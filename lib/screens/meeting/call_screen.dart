// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:zego_uikit_prebuilt_call/zego_uikit_prebuilt_call.dart';

import 'package:flutter_making_friends_app_2/config/settings.dart';
import 'package:flutter_making_friends_app_2/controllers/controllers.dart';
import 'package:flutter_making_friends_app_2/models/user_model.dart';

class CallScreen extends StatelessWidget {
  final String callId;
  const CallScreen({
    Key? key,
    required this.callId,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final loginController = Get.put(LoginController());
    UserModel currentUser = loginController.loginedUser.value;

    return SafeArea(
      child: ZegoUIKitPrebuiltCall(
        appID: zegoAppID,
        appSign: zegoAppSign,
        callID: callId,
        userID: currentUser.id!,
        userName: currentUser.fullname!,
        config: ZegoUIKitPrebuiltCallConfig.groupVideoCall(),
      ),
    );
  }
}
