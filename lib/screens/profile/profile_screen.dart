// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_making_friends_app_2/controllers/controllers.dart';

import 'package:flutter_making_friends_app_2/models/models.dart';
import 'package:flutter_making_friends_app_2/screens/profile/update_profile_screen.dart';
import 'package:flutter_making_friends_app_2/screens/screens.dart';
import 'package:flutter_making_friends_app_2/widgets/widgets.dart';
import 'package:get/get.dart';

class ProfileScreen extends StatelessWidget {
  static const String routeName = '/profile';

  static Route route() {
    return MaterialPageRoute(
      builder: (context) => const ProfileScreen(),
      settings: const RouteSettings(),
    );
  }

  const ProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // var data = Get.arguments;
    final User currentUser = Get.arguments;
    final loginController = Get.put(LoginController());
    return Scaffold(
      appBar: const CustomAppBar(),
      body: Column(
        children: [
          Stack(
            children: [
              const SizedBox(height: 10),
              Container(
                height: MediaQuery.of(context).size.height / 4,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  image: DecorationImage(
                    image: currentUser.avatarUrl.isNull
                        ? NetworkImage(
                            "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTMx1itTXTXLB8p4ALTTL8mUPa9TFN_m9h5VQ&usqp=CAU")
                        : NetworkImage(currentUser.avatarUrl!),
                    fit: BoxFit.cover,
                  ),
                  boxShadow: const [
                    BoxShadow(
                      color: Colors.grey,
                      offset: Offset(3, 3),
                      blurRadius: 3,
                      spreadRadius: 3,
                    )
                  ],
                ),
              ),
              Container(
                height: MediaQuery.of(context).size.height / 4,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  gradient: LinearGradient(
                    colors: [
                      Theme.of(context).primaryColor.withOpacity(0.1),
                      Theme.of(context).primaryColor.withOpacity(0.9),
                    ],
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                  ),
                ),
                child: Align(
                  alignment: Alignment.bottomCenter,
                  child: Padding(
                    padding: const EdgeInsets.only(bottom: 40),
                    child: Text(
                      currentUser.fullname!,
                      style: Theme.of(context)
                          .textTheme
                          .headline1!
                          .copyWith(color: Colors.white),
                    ),
                  ),
                ),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TitleWithIcon(
                  title: 'Biography',
                  icon: Icons.edit,
                ),
                Text(
                  currentUser.about!,
                  style: Theme.of(context)
                      .textTheme
                      .bodyText1!
                      .copyWith(height: 1.5),
                ),
                // TitleWithIcon(
                //   title: 'Pictures',
                //   icon: Icons.edit,
                // ),
                // SizedBox(
                //   height: 125,
                //   child: ListView.builder(
                //     shrinkWrap: true,
                //     scrollDirection: Axis.horizontal,
                //     itemCount: currentUser.avatarUrl.length,
                //     padding: const EdgeInsets.only(right: 5),
                //     itemBuilder: ((context, index) {
                //       return Padding(
                //         padding: const EdgeInsets.only(right: 5),
                //         child: Container(
                //           height: 125,
                //           width: 100,
                //           decoration: BoxDecoration(
                //             borderRadius: BorderRadius.circular(5),
                //             border: Border.all(color: Colors.black),
                //             image: DecorationImage(
                //               fit: BoxFit.cover,
                //               image: currentUser.avatarUrl.isNotEmpty
                //                   ? NetworkImage(currentUser.avatarUrl[index])
                //                   : NetworkImage(
                //                       "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTMx1itTXTXLB8p4ALTTL8mUPa9TFN_m9h5VQ&usqp=CAU"),
                //             ),
                //           ),
                //         ),
                //       );
                //     }),
                //   ),
                // ),
                TitleWithIcon(
                  title: 'Interest',
                  icon: Icons.edit,
                ),
                // Text(
                //   currentUser.interests ?? "",
                //   style: Theme.of(context)
                //       .textTheme
                //       .bodyText1!
                //       .copyWith(height: 1.5),
                // ),
                Wrap(
                  children: currentUser.interests!
                      .map(
                        (interest) => Container(
                          padding: const EdgeInsets.all(5),
                          margin: const EdgeInsets.only(right: 5, top: 5),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5),
                            gradient: LinearGradient(
                              colors: [
                                Theme.of(context).primaryColor,
                                Theme.of(context).accentColor,
                              ],
                            ),
                          ),
                          child: Text(
                            interest,
                            style: Theme.of(context)
                                .textTheme
                                .headline6!
                                .copyWith(color: Colors.white),
                          ),
                        ),
                      )
                      .toList(),
                ),
                // Text(currentUser.toString()),

                Row(
                  children: [
                    ElevatedButton(
                      onPressed: () {
                        Get.to(UserPostsScreen(), arguments: currentUser);
                      },
                      child: Text('Your posts'),
                    ),
                    ElevatedButton(
                      onPressed: () {
                        Get.to(SplashScreen());
                      },
                      child: Text('Log out'),
                    ),
                    ElevatedButton(
                      onPressed: () {
                        Get.to(UpdateProfileScreen(), arguments: currentUser);
                      },
                      child: Text('Update profile'),
                    ),
                  ],
                ),
                // Row(
                //   children: [
                //     CustomTextContainer(text: 'GAME'),
                //     CustomTextContainer(text: 'TECHNOLOGY'),
                //     CustomTextContainer(text: 'MUSIC'),
                //   ],
                // )
              ],
            ),
          )
        ],
      ),
    );
  }
}

class TitleWithIcon extends StatelessWidget {
  final String title;
  final IconData icon;
  const TitleWithIcon({
    Key? key,
    required this.title,
    required this.icon,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(title, style: Theme.of(context).textTheme.headline3),
        IconButton(
          onPressed: () {},
          icon: Icon(icon),
        )
      ],
    );
  }
}
