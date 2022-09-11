// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import 'package:flutter_making_friends_app_2/models/user_match_model.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class ChatScreen extends StatelessWidget {
  const ChatScreen({
    Key? key,
    required this.userMatch,
  }) : super(key: key);

  static const String routeName = '/chat';
  final UserMatch userMatch;

  static Route route({required UserMatch userMatch}) {
    return MaterialPageRoute(
      builder: (context) => ChatScreen(
        userMatch: userMatch,
      ),
      settings: const RouteSettings(name: routeName),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).primaryColor,
        centerTitle: true,
        elevation: 0,
        iconTheme: IconThemeData(color: Theme.of(context).primaryColorLight),
        title: Column(
          children: [
            CircleAvatar(
              radius: 15,
              backgroundImage: NetworkImage(userMatch.matchedUser.imageUrls[0]),
            ),
            Text(
              userMatch.matchedUser.name,
              style: Theme.of(context)
                  .textTheme
                  .headline6!
                  .copyWith(color: Theme.of(context).primaryColorLight),
            ),
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: userMatch.chats != null
            ? ListView.builder(
                shrinkWrap: true,
                itemCount: userMatch.chats![0].messages.length,
                itemBuilder: ((context, index) {
                  return ListTile(
                    title: userMatch.chats![0].messages[index].senderId == 1
                        ? Align(
                            alignment: Alignment.topRight,
                            child: Container(
                              padding: const EdgeInsets.all(8),
                              decoration: const BoxDecoration(
                                  borderRadius: BorderRadius.all(
                                    Radius.circular(8),
                                  ),
                                  color: Colors.white),
                              child: Text(
                                userMatch.chats![0].messages[index].message,
                                style: Theme.of(context)
                                    .textTheme
                                    .bodyText1!
                                    .copyWith(color: Colors.black),
                              ),
                            ),
                          )
                        : Align(
                            alignment: Alignment.topLeft,
                            child: Row(
                              children: [
                                CircleAvatar(
                                  radius: 15,
                                  backgroundImage: NetworkImage(
                                      userMatch.matchedUser.imageUrls[0]),
                                ),
                                const SizedBox(width: 10),
                                Container(
                                  padding: const EdgeInsets.all(8),
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.all(
                                        Radius.circular(8),
                                      ),
                                      color: Theme.of(context).primaryColor),
                                  child: Text(
                                    userMatch.chats![0].messages[index].message,
                                    style: Theme.of(context)
                                        .textTheme
                                        .bodyText1!
                                        .copyWith(color: Colors.white),
                                  ),
                                ),
                              ],
                            ),
                          ),
                  );
                }),
              )
            : const SizedBox(),
      ),
      bottomSheet: Container(
        padding: const EdgeInsets.all(20),
        // width: 100,
        height: 100,
        child: Row(
          children: [
            Expanded(
              child: TextField(
                decoration: InputDecoration(
                  filled: true,
                  fillColor: Colors.white,
                  hintText: 'Type here...',
                  contentPadding:
                      const EdgeInsets.only(left: 20, bottom: 5, top: 5),
                ),
              ),
            ),
            IconButton(
              onPressed: () {},
              icon: FaIcon(
                FontAwesomeIcons.paperPlane,
                color: Theme.of(context).primaryColor,
              ),
            )
          ],
        ),
      ),
    );
  }
}
