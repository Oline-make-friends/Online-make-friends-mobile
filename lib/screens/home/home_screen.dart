// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_making_friends_app_2/controllers/user_controller.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';

import '../../models/models.dart';
import '../../widgets/widgets.dart';

class HomeScreen extends StatelessWidget {
  static const String routeName = '/home';

  static Route route() {
    return MaterialPageRoute(
      builder: (context) => const HomeScreen(),
      settings: const RouteSettings(name: routeName),
    );
  }

  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final usercontroller = Get.put(UserController());
    User currentUser = Get.arguments;
    print(currentUser.friends.toString());
    final users = usercontroller.userList..remove(currentUser);
    return Scaffold(
      appBar: CustomAppBar(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            // Obx(
            //   (() {
            //     if (usercontroller.isLoading.value) {
            //       return const Center(
            //         child: CircularProgressIndicator(),
            //       );
            //     } else {
            //       return UserCard(user: usercontroller.userList[0]);
            //     }
            //   }),
            // ),
            Obx((() {
              // print('Argument: ${Get.arguments.toString()}');

              if (usercontroller.isLoading.value) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              } else {
                // print("current user: ${currentUser.toString()}");
                // print('new list without current user: ${users.toString()}');
                return InkWell(
                  onDoubleTap: () {
                    Navigator.pushNamed(context, '/users', arguments: users[0]);
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
            })),
            Padding(
              padding:
                  const EdgeInsets.symmetric(vertical: 8.0, horizontal: 60.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  ChoiceButton(
                    color: Theme.of(context).errorColor,
                    icon: Icons.clear_rounded,
                  ),
                  GestureDetector(
                    onTap: () {
                      usercontroller.addFriend(context, currentUser.id!,
                          usercontroller.userList[0].id.toString());
                    },
                    child: ChoiceButton(
                        width: 80,
                        height: 80,
                        size: 30,
                        color: Colors.white,
                        hasGradient: true,
                        icon: FontAwesomeIcons.handshakeSimple),
                  ),
                  ChoiceButton(
                    color: Theme.of(context).accentColor,
                    icon: Icons.watch_later,
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
