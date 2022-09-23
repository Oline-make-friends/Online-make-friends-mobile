import 'package:flutter/material.dart';
import 'package:flutter_making_friends_app_2/models/models.dart';
import 'package:flutter_making_friends_app_2/screens/group_chat/group_chat_screen.dart';
import 'package:flutter_making_friends_app_2/screens/single_chat/single_chat_screen.dart';
import 'package:flutter_making_friends_app_2/widgets/custom_appbar.dart';
import 'package:flutter_making_friends_app_2/widgets/user_image_small.dart';

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
        appBar: CustomAppBar(
          bottom: TabBar(
            indicatorColor: Theme.of(context).primaryColor,
            labelColor: Theme.of(context).primaryColor,
            
            tabs: [
              Tab(
                text: 'Chats',
              ),
              Tab(
                text: 'Groups',
              )
            ],
          ),
        ),
        body: TabBarView(
          children: [
            SingleChatScreen(),
            GroupChatScreen(),
          ],
        ),
      ),
    );
  }
}
