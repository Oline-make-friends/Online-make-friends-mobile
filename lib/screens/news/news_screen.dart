// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:flutter/material.dart';
import 'package:flutter_linkify/flutter_linkify.dart';
import 'package:flutter_making_friends_app_2/screens/news/news_detail_screen.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'package:flutter_making_friends_app_2/models/user_model.dart';
import 'package:flutter_making_friends_app_2/widgets/custom_appbar.dart';
import 'package:get/get.dart';

class NewsFeedScreen extends StatelessWidget {
  static const String routeName = '/news';

  static Route route() {
    return MaterialPageRoute(
        builder: (context) => const NewsFeedScreen(),
        settings: const RouteSettings());
  }

  const NewsFeedScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
        child: SingleChildScrollView(
          child: Column(
            children: [
              CustomPost(
                content: 'Eugnene looks like an egg \u{1f95a}',
                user: User.users[0],
              ),
              Divider(
                thickness: 2,
              ),
              CustomPost(
                content:
                    'Your computer is hecked? No worry, called Hecker : \n 01234566789',
                user: User.users[1],
                hasImage: true,
              ),
              Divider(
                thickness: 2,
              ),
              CustomPost(
                content:
                    "I've tried to find downloaders and exploits but it seems like nobody's investigated this area since I couldn't find anything. I'm wondering if it's possible to work around it, since YouTube Vanced itself has succeeded in breaching premiun. Is it really secure or does someone have a solution? Thanks in advance. \nEDIT: NOT PREMIUM VIDEOS. \nSorry for the confusion, I mean the exclusive videos for channel specific subcriptions. The one that gives your comments a flair. ",
                user: User.users[2],
              ),
              Divider(
                thickness: 2,
              ),
              CustomPost(
                content:
                    "Give me your benk account, I'll make the deposit x10. No scemming, no worry!",
                user: User.users[3],
              ),
              Divider(
                thickness: 2,
              ),
              CustomPost(
                content: 'Begulaa, You are going to brazil ',
                user: User.users[4],
                hasImage: true,
              ),
              CustomPost(
                content:
                    'Free Roblox ====> Links: https://www.youtube.com/watch?v=dQw4w9WgXcQ ',
                user: User.users[0],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class CustomPost extends StatelessWidget {
  final bool hasImage;
  final User user;
  final String content;
  const CustomPost({
    Key? key,
    this.hasImage = false,
    required this.user,
    required this.content,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Get.to(NewsDetailScreen());
      },
      child: Column(
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Align(
                alignment: Alignment.topLeft,
                child: CircleAvatar(
                  backgroundImage: NetworkImage(user.avatarUrl[0]),
                ),
              ),
              const SizedBox(width: 5),
              Flexible(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Text(
                          user.fullname,
                          style: Theme.of(context)
                              .textTheme
                              .headline6!
                              .copyWith(color: Colors.black),
                        ),
                        const SizedBox(width: 5),
                        Text(
                          '- 5d',
                          style: Theme.of(context)
                              .textTheme
                              .bodyText2!
                              .copyWith(color: Colors.black),
                        ),
                      ],
                    ),
                    // Text(
                    //   content,
                    //   overflow: TextOverflow.ellipsis,
                    //   style: Theme.of(context)
                    //       .textTheme
                    //       .bodyText1!
                    //       .copyWith(color: Colors.black),
                    //   maxLines: 7,
                    // ),
                    Linkify(
                      text: content,
                      maxLines: 7,
                      style: Theme.of(context)
                          .textTheme
                          .bodyText1!
                          .copyWith(color: Colors.black),
                      onOpen: ((link) => print("Clicked ${link.url}!")),
                    ),
                    const SizedBox(height: 5),
                    hasImage
                        ? Container(
                            height: 100,
                            decoration: BoxDecoration(
                              image: DecorationImage(
                                image: NetworkImage(user.avatarUrl[1]),
                              ),
                            ),
                          )
                        : Container(),
                    SizedBox(height: 5),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: const [
                            CustomPostButton(
                              icon: FaIcon(
                                FontAwesomeIcons.heart,
                                size: 15,
                              ),
                              number: '12',
                            ),
                            CustomPostButton(
                              icon: FaIcon(
                                FontAwesomeIcons.comment,
                                size: 12,
                              ),
                              number: '15',
                            ),
                            CustomPostButton(
                              icon: FaIcon(
                                FontAwesomeIcons.share,
                                size: 12,
                              ),
                              number: '15',
                            ),
                          ],
                        ),
                        // IconButton(
                        //   onPressed: () {},
                        //   icon: FaIcon(
                        //     FontAwesomeIcons.ellipsis,
                        //     size: 12,
                        //   ),
                        // ),
                        PopupMenuButton(
                          icon: const FaIcon(
                            FontAwesomeIcons.ellipsis,
                            size: 12,
                          ),
                          itemBuilder: (context) => [
                            PopupMenuItem(
                              child: Row(
                                children: [
                                  IconButton(
                                    onPressed: () {},
                                    icon: const FaIcon(
                                      FontAwesomeIcons.triangleExclamation,
                                    ),
                                  ),
                                  const Text('Report post')
                                ],
                              ),
                            )
                          ],
                        )
                      ],
                    ),
                  ],
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}

class CustomPostButton extends StatelessWidget {
  final Widget icon;
  final String number;

  const CustomPostButton({
    Key? key,
    required this.icon,
    required this.number,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        IconButton(
          onPressed: () {},
          icon: icon,
        ),
        // const SizedBox(width: ),
        Text(number),
      ],
    );
  }
}
