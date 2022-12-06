// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:flutter/material.dart';
import 'package:flutter_linkify/flutter_linkify.dart';
import 'package:flutter_making_friends_app_2/controllers/controllers.dart';
import 'package:flutter_making_friends_app_2/models/post_model.dart';
import 'package:flutter_making_friends_app_2/widgets/widgets.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'package:flutter_making_friends_app_2/models/user_model.dart';
import 'package:flutter_making_friends_app_2/widgets/custom_appbar.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

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
    final postController = Get.put(PostController());

    return Scaffold(
      // appBar: const CustomAppBar(),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
        child: Obx(() {
          if (postController.isLoading.value) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (postController.userPostList.isEmpty) {
            return const Center(
              child: Text("You don't have any post"),
            );
          } else {
            return ListView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: postController.userPostList.length,
              itemBuilder: ((context, index) {
                // print(data.toString());
                return CustomUserPost(
                  post: postController.userPostList[index],
                  content: postController.userPostList[index].content!,
                  image: postController.userPostList[index].imageUrl,
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
  final Post post;
  final String content;
  const CustomUserPost({
    Key? key,
    this.image,
    required this.post,
    required this.content,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    int postDay = (DateTime.now().day - post.createdAt.day).abs();

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
                  backgroundImage: NetworkImage(post.createdBy!.avatarUrl!),
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
                          post.createdBy!.fullname!,
                          style: Theme.of(context)
                              .textTheme
                              .headline6!
                              .copyWith(color: Colors.black),
                        ),
                        const SizedBox(width: 5),
                        postDay == 0
                            ? Text(
                                "today",
                                style: Theme.of(context)
                                    .textTheme
                                    .bodyText2!
                                    .copyWith(color: Colors.black),
                              )
                            : Text(
                                postDay < 7 && postDay > 0
                                    ? '$postDay days ago'
                                    : "${post.createdAt.day}/${post.createdAt.month}/${post.createdAt.year} ${DateFormat.Hm().format(post.createdAt)}",
                                style: Theme.of(context)
                                    .textTheme
                                    .bodyText2!
                                    .copyWith(color: Colors.black),
                              ),
                      ],
                    ),
                    Row(
                      children: [
                        post.type != null
                            ? Text(
                                '#${post.type}',
                                style: Theme.of(context)
                                    .textTheme
                                    .bodyText1!
                                    .copyWith(fontWeight: FontWeight.bold),
                              )
                            : Container(),
                        const SizedBox(width: 5),
                        post.hashtag != null
                            ? Text(
                                '#${post.hashtag}',
                                style: Theme.of(context)
                                    .textTheme
                                    .bodyText1!
                                    .copyWith(fontWeight: FontWeight.bold),
                              )
                            : Container(),
                      ],
                    ),
                    const SizedBox(height: 5),
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
                            height: 180,
                            width: double.infinity,
                            decoration: BoxDecoration(
                              border: Border.all(color: Colors.transparent),
                              borderRadius: BorderRadius.circular(20),
                              image: DecorationImage(
                                fit: BoxFit.cover,
                                alignment: Alignment.center,
                                image: NetworkImage(image!),
                              ),
                            ),
                          )
                        : Container(),
                    SizedBox(height: 10),
                    const Divider(thickness: 2),
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
