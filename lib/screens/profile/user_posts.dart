// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:flutter/material.dart';
import 'package:flutter_linkify/flutter_linkify.dart';
import 'package:flutter_making_friends_app_2/controllers/controllers.dart';
import 'package:flutter_making_friends_app_2/models/post_model.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'package:flutter_making_friends_app_2/models/user_model.dart';
import 'package:flutter_making_friends_app_2/widgets/custom_appbar.dart';
import 'package:get/get.dart';

class UserPostsScreen extends StatelessWidget {
  static const String routeName = '/userPosts';

  static Route route() {
    return MaterialPageRoute(
        builder: (context) => const UserPostsScreen(),
        settings: const RouteSettings());
  }

  const UserPostsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    User data = Get.arguments;
    final postController = Get.put(PostController());
    final posts = postController.postList
        .where((post) => post.createdBy.fullname == data.fullname)
        .toList();
    return Scaffold(
      appBar: const CustomAppBar(),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
        child: Obx(() {
          if (postController.isLoading.value) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (postController.postList.isEmpty) {
            return const Center(
              child: Text("You don't have any post"),
            );
          } else {
            return ListView.builder(
              itemCount: postController.postList.length,
              itemBuilder: ((context, index) {
                // print(data.toString());
                return CustomUserPost(
                  user: postController.postList[index].createdBy,
                  content: postController.postList[index].content!,
                  image: postController.postList[index].imageUrl,
                );
              }),
            );
          }
        }),
      ),
    );
  }
}

class CustomUserPost extends StatelessWidget {
  final String? image;
  final User user;
  final String content;
  const CustomUserPost({
    Key? key,
    this.image,
    required this.user,
    required this.content,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        // Get.to(NewsDetailScreen());
      },
      child: Column(
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Align(
                alignment: Alignment.topLeft,
                child: CircleAvatar(
                  backgroundImage: NetworkImage(user.avatarUrl!),
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
                          user.fullname!,
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
                    image != null
                        ? Container(
                            height: 100,
                            decoration: BoxDecoration(
                              image: DecorationImage(
                                image: NetworkImage(image!),
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
                            CustomUserPostButton(
                              icon: FaIcon(
                                FontAwesomeIcons.heart,
                                size: 15,
                              ),
                              number: '12',
                            ),
                            CustomUserPostButton(
                              icon: FaIcon(
                                FontAwesomeIcons.comment,
                                size: 12,
                              ),
                              number: '15',
                            ),
                            CustomUserPostButton(
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

class CustomUserPostButton extends StatelessWidget {
  final Widget icon;
  final String number;

  const CustomUserPostButton({
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
