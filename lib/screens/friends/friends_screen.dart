import 'package:flutter/material.dart';
import 'package:flutter_making_friends_app_2/models/models.dart';
import 'package:flutter_making_friends_app_2/screens/group_chat/group_chat_screen.dart';
import 'package:flutter_making_friends_app_2/screens/meeting/join_meeting_screen.dart';
import 'package:flutter_making_friends_app_2/screens/meeting/meeting_screen.dart';
import 'package:flutter_making_friends_app_2/screens/screens.dart';
import 'package:flutter_making_friends_app_2/screens/single_chat/single_chat_screen.dart';
import 'package:flutter_making_friends_app_2/widgets/custom_appbar.dart';
import 'package:flutter_making_friends_app_2/widgets/user_image_small.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:flutter_chat_ui_kit/flutter_chat_ui_kit.dart' as CometUIKIt;

import '../../controllers/controllers.dart';

class FriendsScreen extends StatelessWidget {
  static const routeName = '/friends';

  static Route route() {
    return MaterialPageRoute(
      builder: (context) => const FriendsScreen(),
      settings: const RouteSettings(name: routeName),
    );
  }

  const FriendsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        floatingActionButton: SpeedDial(
          backgroundColor: Theme.of(context).primaryColor,
          elevation: 0,
          animatedIcon: AnimatedIcons.menu_close,
          children: [
            SpeedDialChild(
                child: Icon(
                  Icons.meeting_room_outlined,
                  color: Theme.of(context).primaryColor,
                ),
                label: 'New Meeting room',
                onTap: () {
                  Get.to(MeetingScreen());
                }),
            SpeedDialChild(
              child: Icon(
                Icons.groups_outlined,
                color: Theme.of(context).primaryColor,
              ),
              label: 'Join meeting room',
              onTap: () {
                Get.to(JoinMeetingScreen());
              },
            ),
            SpeedDialChild(
              child: FaIcon(
                FontAwesomeIcons.addressBook,
                color: Theme.of(context).primaryColor,
              ),
              label: 'Your friends',
              onTap: () {
                Get.to(FriendsListScreen());
              },
            ),
          ],
        ),
        appBar: AppBar(
          // titleSpacing: 70,
          centerTitle: true,
          backgroundColor: Colors.transparent,
          elevation: 0,
          automaticallyImplyLeading: false,
          // leading: IconButton(
          //   onPressed: () {
          //     Get.back();
          //   },
          //   icon: Icon(
          //     Icons.arrow_back,
          //     color: Theme.of(context).primaryColor,
          //   ),
          // ),
          title: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('F',
                  style: Theme.of(context)
                      .textTheme
                      .headline4!
                      .copyWith(fontWeight: FontWeight.bold)),
              // const SizedBox(width: 5),
              Text(
                'Study',
                style: Theme.of(context)
                    .textTheme
                    .headline4!
                    .copyWith(color: Colors.black54),
              ),
              const SizedBox(width: 5),
              Text(
                'Chat',
                style: Theme.of(context)
                    .textTheme
                    .headline4!
                    .copyWith(color: Colors.black54),
              ),
            ],
          ),
          bottom: TabBar(
            indicatorColor: Theme.of(context).primaryColor,
            labelColor: Theme.of(context).primaryColor,
            unselectedLabelColor: Colors.black54,
            indicatorSize: TabBarIndicatorSize.label,
            tabs: [
              Tab(
                text: 'Chats',
              ),
              Tab(
                text: 'Groups',
              ),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            // CometUIKIt.CometChatUsersWithMessages(
            //   theme: CometUIKIt.CometChatTheme(
            //       palette: CometUIKIt.Palette(
            //         mode: CometUIKIt.PaletteThemeModes.dark,
            //         primary: CometUIKIt.PaletteModel(
            //             dark: Theme.of(context).primaryColor,
            //             light: Theme.of(context).primaryColor),
            //         secondary900: CometUIKIt.PaletteModel(
            //             dark: Colors.white,
            //             light: Theme.of(context).primaryColor),
            //         accent: CometUIKIt.PaletteModel(
            //             dark: Colors.black54,
            //             light: Theme.of(context).primaryColor),
            //         backGroundColor: CometUIKIt.PaletteModel(
            //             dark: Theme.of(context).scaffoldBackgroundColor,
            //             light: Theme.of(context).primaryColor),
            //         primary200: CometUIKIt.PaletteModel(
            //             dark: Colors.black54,
            //             light: Theme.of(context).primaryColor),
            //         secondary: CometUIKIt.PaletteModel(
            //             dark: Theme.of(context).primaryColor,
            //             light: Theme.of(context).primaryColor),
            //       ),
            //       typography: CometUIKIt.Typography.fromDefault()),
            //   usersConfiguration: CometUIKIt.UsersConfiguration(
            //     title: 'Friends',
            //     showBackButton: false,
            //     userListConfiguration:
            //         CometUIKIt.UserListConfiguration(uids: friendsId),
            //   ),
            // ),
            CometUIKIt.CometChatConversationsWithMessages(
              conversationConfigurations: CometUIKIt.ConversationConfigurations(
                  title: 'Chats',
                  showBackButton: false,
                  conversationListConfiguration:
                      CometUIKIt.ConversationListConfigurations()),
              theme: CometUIKIt.CometChatTheme(
                  palette: CometUIKIt.Palette(
                    mode: CometUIKIt.PaletteThemeModes.dark,
                    primary: CometUIKIt.PaletteModel(
                        dark: Theme.of(context).primaryColor,
                        light: Theme.of(context).primaryColor),
                    secondary900: CometUIKIt.PaletteModel(
                        dark: Colors.white,
                        light: Theme.of(context).primaryColor),
                    accent: CometUIKIt.PaletteModel(
                        dark: Colors.black54,
                        light: Theme.of(context).primaryColor),
                    backGroundColor: CometUIKIt.PaletteModel(
                        dark: Theme.of(context).scaffoldBackgroundColor,
                        light: Theme.of(context).primaryColor),
                    primary200: CometUIKIt.PaletteModel(
                        dark: Colors.black54,
                        light: Theme.of(context).primaryColor),
                    secondary: CometUIKIt.PaletteModel(
                        dark: Theme.of(context).primaryColor,
                        light: Theme.of(context).primaryColor),
                  ),
                  typography: CometUIKIt.Typography.fromDefault()),
            ),
            CometUIKIt.CometChatGroupWithMessages(
              groupsConfiguration: CometUIKIt.GroupsConfiguration(
                title: 'Groups',
                showBackButton: false,
              ),
              theme: CometUIKIt.CometChatTheme(
                  palette: CometUIKIt.Palette(
                    mode: CometUIKIt.PaletteThemeModes.dark,
                    primary: CometUIKIt.PaletteModel(
                        dark: Theme.of(context).primaryColor,
                        light: Theme.of(context).primaryColor),
                    secondary900: CometUIKIt.PaletteModel(
                        dark: Colors.white,
                        light: Theme.of(context).primaryColor),
                    accent: CometUIKIt.PaletteModel(
                        dark: Colors.black54,
                        light: Theme.of(context).primaryColor),
                    backGroundColor: CometUIKIt.PaletteModel(
                        dark: Theme.of(context).scaffoldBackgroundColor,
                        light: Theme.of(context).primaryColor),
                    primary200: CometUIKIt.PaletteModel(
                        dark: Colors.black54,
                        light: Theme.of(context).primaryColor),
                    secondary: CometUIKIt.PaletteModel(
                        dark: Theme.of(context).primaryColor,
                        light: Theme.of(context).primaryColor),
                  ),
                  typography: CometUIKIt.Typography.fromDefault()),
            ),
          ],
        ),
      ),
    );
  }
}
