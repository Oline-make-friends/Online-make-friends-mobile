// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_making_friends_app_2/controllers/login_controller.dart';
import 'package:flutter_making_friends_app_2/controllers/user_controller.dart';
import 'package:flutter_making_friends_app_2/screens/find_friend/search_friend_screen.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';

import '../../models/models.dart';
import '../../widgets/widgets.dart';

class FindFriendScreen extends StatelessWidget {
  static const String routeName = '/findFriend';

  static Route route() {
    return MaterialPageRoute(
      builder: (context) => const FindFriendScreen(),
      settings: const RouteSettings(name: routeName),
    );
  }

  const FindFriendScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final usercontroller = Get.put(UserController());
    final loginController = Get.put(LoginController());
    var currentUser = loginController.loginedUser.value;
    // print(
    //     "Number of friends: ${loginController.loginedUser.value.friends!.length}");
    final users = usercontroller.userList..remove(currentUser);
    return Scaffold(
      appBar: CustomAppBar(
        leading: IconButton(
          onPressed: () {
            Get.to(SearchFriendScreen());
          },
          icon: Icon(
            Icons.search,
            color: Theme.of(context).primaryColor,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Obx(
              (() {
                // print('Argument: ${Get.arguments.toString()}');
                if (usercontroller.isLoading.value) {
                  return SizedBox(
                    height: MediaQuery.of(context).size.height / 1.45,
                    width: MediaQuery.of(context).size.width,
                    child: Center(
                      child: CircularProgressIndicator(),
                    ),
                  );
                } else {
                  // print("current user: ${currentUser.toString()}");
                  // print('new list without current user: ${users.toString()}');
                  return InkWell(
                    onDoubleTap: () {
                      Navigator.pushNamed(context, '/users',
                          arguments: users[0]);
                    },
                    child: Draggable(
                      feedback: UserCard(user: users[0]),
                      child: UserCard(user: users[0]),
                      // childWhenDragging: UserCard(user: users[1]),
                      onDragEnd: (drag) {
                        if (drag.velocity.pixelsPerSecond.dx < 0) {
                          usercontroller.swipeLeft(usercontroller.userList[0]);
                        } else {}
                      },
                    ),
                  );
                }
              }),
            ),
            Padding(
              padding:
                  const EdgeInsets.symmetric(vertical: 8.0, horizontal: 60.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  GestureDetector(
                    onTap: () {
                      usercontroller.swipeLeft(usercontroller.userList[0]);
                    },
                    child: ChoiceButton(
                      color: Theme.of(context).errorColor,
                      icon: Icons.clear_rounded,
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      usercontroller.sendFriendRequest(currentUser.id!,
                          usercontroller.userList[0].id.toString(), context);
                    },
                    child: ChoiceButton(
                        width: 80,
                        height: 80,
                        size: 30,
                        color: Colors.white,
                        hasGradient: true,
                        icon: FontAwesomeIcons.handshakeSimple),
                  ),
                  GestureDetector(
                    onTap: () {
                      usercontroller.followUser(currentUser.id!,
                          usercontroller.userList[0].id.toString(), context);
                    },
                    child: ChoiceButton(
                      color: Theme.of(context).accentColor,
                      icon: Icons.add,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
