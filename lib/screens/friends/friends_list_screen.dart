import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../controllers/controllers.dart';
import '../../models/models.dart';
import 'package:flutter_chat_ui_kit/flutter_chat_ui_kit.dart' as CometUIKIt;

class FriendsListScreen extends StatelessWidget {
  const FriendsListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final loginController = Get.put(LoginController());
    List<dynamic> friends = loginController.loginedUser.value.friends!;
    // print(Friend.fromJson(friends[1]).toString());
    List<Friend> myFriends = [];

    for (dynamic f in friends) {
      Friend friend = Friend.fromJson(f);
      myFriends.add(friend);
    }

    List<String> friendsId = [];
    for (Friend f in myFriends) {
      friendsId.add(f.id!);
    }
    return Scaffold(
      body: CometUIKIt.CometChatUsersWithMessages(
        theme: CometUIKIt.CometChatTheme(
            palette: CometUIKIt.Palette(
              mode: CometUIKIt.PaletteThemeModes.dark,
              primary: CometUIKIt.PaletteModel(
                  dark: Theme.of(context).primaryColor,
                  light: Theme.of(context).primaryColor),
              secondary900: CometUIKIt.PaletteModel(
                  dark: Colors.white, light: Theme.of(context).primaryColor),
              accent: CometUIKIt.PaletteModel(
                  dark: Colors.black54, light: Theme.of(context).primaryColor),
              backGroundColor: CometUIKIt.PaletteModel(
                  dark: Theme.of(context).scaffoldBackgroundColor,
                  light: Theme.of(context).primaryColor),
              primary200: CometUIKIt.PaletteModel(
                  dark: Colors.black54, light: Theme.of(context).primaryColor),
              secondary: CometUIKIt.PaletteModel(
                  dark: Theme.of(context).primaryColor,
                  light: Theme.of(context).primaryColor),
            ),
            typography: CometUIKIt.Typography.fromDefault()),
        usersConfiguration: CometUIKIt.UsersConfiguration(
          title: 'Friends',
          // showBackButton: false,
          userListConfiguration:
              CometUIKIt.UserListConfiguration(uids: friendsId),
        ),
      ),
    );
  }
}
