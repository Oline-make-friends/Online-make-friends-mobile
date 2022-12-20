import 'package:flutter/material.dart';
import 'package:flutter_making_friends_app_2/controllers/controllers.dart';
import 'package:flutter_making_friends_app_2/controllers/user_controller.dart';
import 'package:flutter_making_friends_app_2/models/user_model.dart';
import 'package:flutter_making_friends_app_2/screens/profile/user_courses.dart';
import 'package:flutter_making_friends_app_2/screens/profile/user_event.dart';
import 'package:get/get.dart';

import '../../widgets/widgets.dart';
import '../screens.dart';

class NewProfileScreen extends StatelessWidget {
  final navigatorKey = GlobalKey<NavigatorState>();

  @override
  Widget build(BuildContext context) {
    // User currentUser = Get.arguments;
    final loginController = Get.put(LoginController());
    final postController = Get.put(PostController());
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        titleSpacing: 50,
        automaticallyImplyLeading: false,
        elevation: 0,
        backgroundColor: Colors.transparent,
        title: Row(
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
        actions: [
          PopupMenuButton(
            icon: Icon(
              Icons.more_horiz_rounded,
              color: Theme.of(context).primaryColor,
            ),
            itemBuilder: (BuildContext context) => const <PopupMenuEntry>[
              PopupMenuItem(
                value: 1,
                child: Text('Logout'),
              ),
              PopupMenuItem(
                value: 2,
                child: Text('Change password'),
              ),
            ],
            onSelected: (item) async {
              if (item == 1) {
                await loginController.logout(context);
              } else if (item == 2) {
                Get.to(ResetPasswordScreen());
              }
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          // shrinkWrap: true,
          children: [
            //!User card
            Obx(
              () {
                return CustomUserCard(
                    currentUser: loginController.loginedUser.value);
              },
            ),
            // const SizedBox(height: 10),
            CustomTabBar(),
          ],
        ),
      ),
    );
  }
}

class CustomTabBar extends StatelessWidget {
  const CustomTabBar({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          TabBar(
            indicatorColor: Theme.of(context).primaryColor,
            labelColor: Theme.of(context).primaryColor,
            unselectedLabelColor: Colors.black54,
            indicatorSize: TabBarIndicatorSize.label,
            tabs: [
              Tab(text: "Posts"),
              Tab(text: "Events"),
              Tab(text: "Courses"),
            ],
          ),
          Container(
            height: 2500,
            child: const TabBarView(
              children: [
                UserPostsScreen(),
                UserEventScreen(),
                UserCourseScreen(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
