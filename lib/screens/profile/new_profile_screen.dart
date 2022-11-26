import 'package:flutter/material.dart';
import 'package:flutter_making_friends_app_2/controllers/controllers.dart';
import 'package:flutter_making_friends_app_2/controllers/user_controller.dart';
import 'package:flutter_making_friends_app_2/models/user_model.dart';
import 'package:get/get.dart';

import '../../widgets/widgets.dart';
import '../screens.dart';

class NewProfileScreen extends StatelessWidget {
  const NewProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // User currentUser = Get.arguments;
    final loginController = Get.put(LoginController());

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
          IconButton(
            onPressed: () {
              loginController.logout(context);
            },
            icon: Icon(
              Icons.logout,
              color: Theme.of(context).primaryColor,
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            //!User card
            Obx(
              () {
                return CustomUserCard(
                    currentUser: loginController.loginedUser.value);
              },
            ),
            const SizedBox(height: 10),
          ],
        ),
      ),
    );
  }
}

class CustomUserCard extends StatelessWidget {
  const CustomUserCard({
    Key? key,
    required this.currentUser,
  }) : super(key: key);

  final UserModel currentUser;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 0,
      color: Theme.of(context).primaryColor.withAlpha(40),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CircleAvatar(
                  backgroundImage: NetworkImage(currentUser.avatarUrl!),
                  radius: 40,
                ),
                Align(
                  alignment: Alignment.topRight,
                  child: IconButton(
                    onPressed: () {
                      Get.to(UpdateProfileScreen(), arguments: currentUser);
                    },
                    icon: Icon(Icons.edit),
                  ),
                )
              ],
            ),
            const SizedBox(height: 10),
            Text(
              currentUser.fullname!,
              style: Theme.of(context).textTheme.headline5,
            ),
            const SizedBox(height: 5),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Icon(
                  Icons.location_on,
                  size: 15,
                  color: Theme.of(context).primaryColor.withAlpha(70),
                ),
                Text(currentUser.location!),
              ],
            ),
            const SizedBox(height: 5),
            Text(
              currentUser.about!,
              style: Theme.of(context).textTheme.bodyText1,
            ),
            const SizedBox(height: 10),
            Row(
              children: [
                Text(
                  '${currentUser.follows!.length}',
                  style: Theme.of(context).textTheme.bodyText1!.copyWith(
                        fontWeight: FontWeight.bold,
                      ),
                ),
                const SizedBox(width: 5),
                Text(
                  'Following',
                  style: Theme.of(context).textTheme.bodyText1,
                ),
              ],
            ),
            const SizedBox(height: 10),
            Wrap(
              children: currentUser.interests!
                  .map(
                    (interest) => Card(
                      elevation: 0,
                      color: Theme.of(context).primaryColor.withAlpha(40),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Container(
                        padding: const EdgeInsets.all(5),
                        child: Text(
                          interest,
                          style: Theme.of(context).textTheme.bodyText1,
                        ),
                      ),
                    ),
                  )
                  .toList(),
            ),
          ],
        ),
      ),
    );
  }
}
