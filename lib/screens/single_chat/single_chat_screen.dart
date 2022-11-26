import 'package:flutter/material.dart';
import 'package:flutter_making_friends_app_2/controllers/login_controller.dart';
import 'package:flutter_making_friends_app_2/models/models.dart';
import 'package:flutter_making_friends_app_2/widgets/user_image_small.dart';
import 'package:get/get.dart';

class SingleChatScreen extends StatelessWidget {
  const SingleChatScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final activeMatches = UserMatch.matches
        .where((match) => match.userId == 1 && match.chats!.isNotEmpty)
        .toList();

    final loginController = Get.put(LoginController());
    List<dynamic> friends = loginController.loginedUser.value.friends!;
    // print(Friend.fromJson(friends[1]).toString());
    List<Friend> myFriends = [];

    for (dynamic f in friends) {
      Friend friend = Friend.fromJson(f);
      myFriends.add(friend);
    }

    print(myFriends.toString());

    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Your Friends',
                style: Theme.of(context)
                    .textTheme
                    .headline4!
                    .copyWith(color: Colors.black54),
              ),
              SizedBox(
                height: 100,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  shrinkWrap: true,
                  itemCount: myFriends.length,
                  itemBuilder: (context, index) {
                    return Column(
                      children: [
                        UserImageSmall(
                          height: 70,
                          width: 70,
                          imageUrl: myFriends[index].avatarUrl!,
                        ),
                        Text(
                          myFriends[index].fullname!,
                          style: Theme.of(context)
                              .textTheme
                              .bodyText1!
                              .copyWith(fontWeight: FontWeight.bold),
                        ),
                      ],
                    );
                  },
                ),
              ),
              const SizedBox(height: 10),
              Text(
                'Your Chats',
                style: Theme.of(context)
                    .textTheme
                    .headline4!
                    .copyWith(color: Colors.black54),
              ),
              ListView.builder(
                shrinkWrap: true,
                itemCount: activeMatches.length,
                itemBuilder: ((context, index) {
                  return InkWell(
                    onTap: () {
                      Navigator.pushNamed(context, '/chat',
                          arguments: activeMatches[index]);
                    },
                    child: Row(
                      children: [
                        UserImageSmall(
                          height: 70,
                          width: 70,
                          imageUrl: activeMatches[index].matchedUser.avatarUrl!,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              activeMatches[index].matchedUser.fullname!,
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyText1!
                                  .copyWith(fontWeight: FontWeight.bold),
                            ),
                            const SizedBox(height: 5),
                            Text(
                              activeMatches[index]
                                  .chats![0]
                                  .messages[0]
                                  .message,
                              style: Theme.of(context).textTheme.bodyText2!,
                            ),
                            const SizedBox(height: 5),
                            Text(
                              activeMatches[index]
                                  .chats![0]
                                  .messages[0]
                                  .timeString,
                              style: Theme.of(context).textTheme.bodyText2!,
                            ),
                          ],
                        )
                      ],
                    ),
                  );
                }),
              )
            ],
          ),
        ),
      ),
    );
  }
}
