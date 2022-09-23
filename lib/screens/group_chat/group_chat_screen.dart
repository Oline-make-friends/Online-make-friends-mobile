// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import 'package:flutter_making_friends_app_2/models/user_model.dart';
import 'package:flutter_making_friends_app_2/screens/group_chat/chat_group_detail_screen.dart';
import 'package:flutter_making_friends_app_2/widgets/user_image_small.dart';

class GroupChatScreen extends StatelessWidget {
  const GroupChatScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              CustomGroupChat(
                groupImg:
                    "https://ava-grp-talk.zadn.vn/7/f/f/7/2/360/8f42455606adeecea88399d4a2573c65.jpg",
              ),
              const SizedBox(height: 5),
              CustomGroupChat(),
              const SizedBox(height: 5),
            ],
          ),
        ),
      ),
    );
  }
}

class CustomGroupChat extends StatelessWidget {
  final String groupImg;
  const CustomGroupChat({
    Key? key,
    this.groupImg =
        "https://cdn.raceroster.com/assets/images/team-placeholder.png",
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (_) => ChatGroupDetailScreen()),
        );
      },
      child: Row(
        children: [
          UserImageSmall(
            imageUrl: groupImg,
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Group 1',
                  style: Theme.of(context)
                      .textTheme
                      .bodyText1!
                      .copyWith(fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 5),
                Text(
                  'You: OSG ko có source trên quizlet đâu, lên trang thi chứng chỉ của nó mà ôn, 1000 câu.',
                  style: Theme.of(context).textTheme.bodyText2,
                  overflow: TextOverflow.ellipsis,
                  maxLines: 1,
                ),
                const SizedBox(height: 5),
                Text('19/9 - 5:10PM')
              ],
            ),
          )
        ],
      ),
    );
  }
}
