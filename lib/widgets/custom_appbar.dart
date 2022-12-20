// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_chat_ui_kit/flutter_chat_ui_kit.dart' as CometUIKIt;
import 'package:flutter_making_friends_app_2/screens/test_screen/test.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';

import '../controllers/controllers.dart';
import '../models/models.dart';
import '../screens/screens.dart';

class CustomAppBar extends StatelessWidget with PreferredSizeWidget {
  final PreferredSizeWidget? bottom;
  final Widget? leading;
  const CustomAppBar({
    Key? key,
    this.bottom,
    this.leading,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final loginController = Get.put(LoginController());
    final notiController = Get.put(NotiController(), permanent: true);
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

    return AppBar(
      titleSpacing: 50,
      centerTitle: true,
      backgroundColor: Colors.transparent,
      elevation: 0,
      automaticallyImplyLeading: false,
      bottom: bottom,
      title: InkWell(
        onTap: () {
          Navigator.pushNamed(context, '/bottomNav');
        },
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          // crossAxisAlignment: CrossAxisAlignment.start,
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
            )
          ],
        ),
      ),
      actions: [
        Obx(
          () {
            int numOfNoti = notiController.notiList.length +
                notiController.friendReqList.length;

            return IconButton(
              onPressed: () {
                Navigator.pushNamed(context, '/noti');
              },
              icon: numOfNoti == 0
                  ? FaIcon(
                      FontAwesomeIcons.solidBell,
                      color: Theme.of(context).primaryColor,
                    )
                  : Stack(
                      children: [
                        Icon(
                          Icons.notifications_active,
                          color: Theme.of(context).primaryColor,
                        ),
                        Positioned(
                          top: 1.0,
                          right: 1.0,
                          child: Center(
                            child: Container(
                              padding: const EdgeInsets.all(2),
                              decoration: BoxDecoration(
                                color: Colors.black,
                                borderRadius: BorderRadius.circular(20),
                              ),
                              child: Text("${numOfNoti}",
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodyText2!
                                      .copyWith(
                                          color:
                                              Theme.of(context).primaryColor)),
                            ),
                          ),
                        )
                      ],
                    ),
            );
          },
        ),
        IconButton(
          onPressed: () {
            // print("f Id:  ${friendsId.toString()}");

            Navigator.pushNamed(context, '/friends');
          },
          icon: FaIcon(
            FontAwesomeIcons.solidMessage,
            color: Theme.of(context).primaryColor,
          ),
        ),
        // IconButton(
        //   onPressed: () {
        //     Get.to(TestScreen());
        //   },
        //   icon: Icon(
        //     Icons.abc,
        //     color: Colors.amber,
        //   ),
        // )
      ],
      leading: leading,
    );
  }

  @override
  Size get preferredSize =>
      bottom != null ? const Size.fromHeight(100) : const Size.fromHeight(50);
}
