// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import 'package:flutter_making_friends_app_2/models/user_model.dart';
import 'package:flutter_making_friends_app_2/widgets/widgets.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class UsersScreen extends StatelessWidget {
  final User user;
  static const String routeName = '/users';

  static Route route({required User user}) {
    return MaterialPageRoute(
      builder: (context) => UsersScreen(user: user),
      settings: RouteSettings(name: routeName),
    );
  }

  const UsersScreen({
    Key? key,
    required this.user,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        iconTheme: IconThemeData(color: Theme.of(context).primaryColor),
      ),
      extendBodyBehindAppBar: true,
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: MediaQuery.of(context).size.height / 2,
              child: Stack(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(bottom: 40),
                    child: Hero(
                      tag: 'user_image',
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: const BorderRadius.only(
                              bottomLeft: Radius.circular(20),
                              bottomRight: Radius.circular(20)),
                          image: DecorationImage(
                            image: user.avatarUrl != null
                                ? NetworkImage(user.avatarUrl!)
                                : NetworkImage(
                                    "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTMx1itTXTXLB8p4ALTTL8mUPa9TFN_m9h5VQ&usqp=CAU"),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    ),
                  ),
                  Align(
                    alignment: Alignment.bottomCenter,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 60),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          ChoiceButton(
                            color: Theme.of(context).errorColor,
                            icon: Icons.clear_rounded,
                          ),
                          ChoiceButton(
                            height: 80,
                            width: 80,
                            size: 30,
                            color: Colors.white,
                            hasGradient: true,
                            icon: FontAwesomeIcons.handshakeSimple,
                          ),
                          ChoiceButton(
                            color: Theme.of(context).accentColor,
                            icon: Icons.watch_later,
                          )
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    '${user.fullname}, ${user.location}',
                    style: Theme.of(context).textTheme.headline1,
                  ),
                  Text(
                    user.major ?? "",
                    style: Theme.of(context)
                        .textTheme
                        .headline2!
                        .copyWith(fontWeight: FontWeight.normal),
                  ),
                  const SizedBox(height: 15),
                  Text(
                    'About',
                    style: Theme.of(context).textTheme.headline2!,
                  ),
                  Text(
                    user.about ?? "",
                    style: Theme.of(context).textTheme.headline6!.copyWith(
                        height: 2,
                        color: Colors.black,
                        fontWeight: FontWeight.normal),
                  ),
                  const SizedBox(height: 15),
                  Text(
                    'Interests',
                    style: Theme.of(context).textTheme.headline2,
                  ),
                  // Text(
                  //   user.interests ?? "",
                  //   style: Theme.of(context).textTheme.headline6!.copyWith(
                  //       height: 2,
                  //       color: Colors.black,
                  //       fontWeight: FontWeight.normal),
                  // ),
                  Wrap(
                    children: user.interests!
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
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
