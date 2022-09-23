// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_making_friends_app_2/models/user_model.dart';
import 'package:flutter_making_friends_app_2/widgets/custom_text_form_field.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class ChatGroupDetailScreen extends StatelessWidget {
  const ChatGroupDetailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).primaryColor,
        title: Column(
          children: const [
            CircleAvatar(
              backgroundImage: NetworkImage(
                  "https://ava-grp-talk.zadn.vn/7/f/f/7/2/360/8f42455606adeecea88399d4a2573c65.jpg"),
              radius: 15,
            ),
            SizedBox(height: 5),
            Text('Group 1'),
          ],
        ),
        centerTitle: true,
        elevation: 0,
        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.more_horiz),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.only(
            bottom: MediaQuery.of(context).size.height / 7,
          ),
          child: Column(
            children: [
              CustomGroupMessage(
                avatarImg: User.users[0].avatarUrl[0],
                sentByMe: false,
                content: "Có ai ôn OSG chưa?",
              ),
              CustomGroupMessage(
                avatarImg: User.users[3].avatarUrl[0],
                sentByMe: false,
                content: "Chưa",
              ),
              CustomGroupMessage(
                avatarImg: User.users[1].avatarUrl[0],
                sentByMe: false,
                content: "All in quizlet thôi",
              ),
              CustomGroupMessage(
                sentByMe: true,
                content:
                    "OSG ko có source trên quizlet đâu, lên trang thi chứng chỉ của nó mà ôn, 1000 câu.",
              ),
            ],
          ),
        ),
      ),
      bottomSheet: Container(
        padding: const EdgeInsets.all(20),
        // width: 100,
        height: 100,
        child: Row(
          children: [
            Expanded(
              child: CustomTextFormField(
                hintTxt: 'Type here...',
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

class CustomGroupMessage extends StatelessWidget {
  const CustomGroupMessage({
    Key? key,
    required this.sentByMe,
    required this.content,
    this.avatarImg = '',
  }) : super(key: key);

  final bool sentByMe;
  final String content;
  final String avatarImg;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: sentByMe
          ? Align(
              alignment: Alignment.topRight,
              child: Container(
                padding: const EdgeInsets.all(8),
                decoration: const BoxDecoration(
                    borderRadius: BorderRadius.all(
                      Radius.circular(8),
                    ),
                    color: Colors.white),
                child: SizedBox(
                  width: content.length < 20
                      ? null
                      : MediaQuery.of(context).size.width / 2.5,
                  child: Text(
                    content,
                    style: Theme.of(context)
                        .textTheme
                        .bodyText1!
                        .copyWith(color: Colors.black),
                  ),
                ),
              ),
            )
          : Align(
              alignment: Alignment.topLeft,
              child: Row(
                children: [
                  CircleAvatar(
                      radius: 15, backgroundImage: NetworkImage(avatarImg)),
                  const SizedBox(width: 10),
                  Container(
                    padding: const EdgeInsets.all(8),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(
                          Radius.circular(8),
                        ),
                        color: Theme.of(context).primaryColor),
                    child: SizedBox(
                      width: content.length < 20
                          ? null
                          : MediaQuery.of(context).size.width / 2.5,
                      child: Text(
                        content,
                        style: Theme.of(context)
                            .textTheme
                            .bodyText1!
                            .copyWith(color: Colors.white),
                      ),
                    ),
                  ),
                ],
              ),
            ),
    );
  }
}
