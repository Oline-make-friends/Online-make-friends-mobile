// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_linkify/flutter_linkify.dart';
import 'package:flutter_making_friends_app_2/controllers/controllers.dart';
import 'package:flutter_making_friends_app_2/controllers/update_post_controller.dart';
import 'package:flutter_making_friends_app_2/models/post_model.dart';
import 'package:flutter_making_friends_app_2/screens/profile/edit/post_edit_screen.dart';
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
        child: Obx(
          () {
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
                    onPressed: () {},
                  );
                }),
              );
            }
          },
        ),
      ),
    );
  }
}

class CustomUserPost extends StatefulWidget {
  final String? image;
  final Post post;
  final String content;
  void Function()? onPressed;
  CustomUserPost({
    Key? key,
    this.onPressed,
    this.image,
    required this.post,
    required this.content,
  }) : super(key: key);

  @override
  State<CustomUserPost> createState() => _CustomUserPostState();
}

class _CustomUserPostState extends State<CustomUserPost> {
  @override
  Widget build(BuildContext context) {
    int postDay = (DateTime.now().day - widget.post.createdAt.day).abs();
    final postController = Get.put(PostController());
    return InkWell(
      onTap: () {
        // Get.to(NewsDetailScreen());
      },
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Align(
                alignment: Alignment.topLeft,
                child: CircleAvatar(
                  backgroundImage:
                      NetworkImage(widget.post.createdBy!.avatarUrl!),
                ),
              ),
              const SizedBox(width: 5),
              Flexible(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            Text(
                              widget.post.createdBy!.fullname!,
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
                                        : "${widget.post.createdAt.day}/${widget.post.createdAt.month}/${widget.post.createdAt.year} ${DateFormat.Hm().format(widget.post.createdAt)}",
                                    style: Theme.of(context)
                                        .textTheme
                                        .bodyText2!
                                        .copyWith(color: Colors.black),
                                  ),
                          ],
                        ),
                        // IconButton(
                        //   onPressed: onPressed,
                        //   icon: Icon(Icons.more_vert_outlined, size: 15),
                        // )
                      ],
                    ),
                    Row(
                      children: [
                        widget.post.type != null
                            ? Text(
                                '#${widget.post.type}',
                                style: Theme.of(context)
                                    .textTheme
                                    .bodyText1!
                                    .copyWith(fontWeight: FontWeight.bold),
                              )
                            : Container(),
                        const SizedBox(width: 5),
                        widget.post.hashtag != null
                            ? Text(
                                '#${widget.post.hashtag}',
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
                      text: widget.content,
                      maxLines: 7,
                      style: Theme.of(context)
                          .textTheme
                          .bodyText1!
                          .copyWith(color: Colors.black),
                      onOpen: ((link) => print("Clicked ${link.url}!")),
                    ),
                    const SizedBox(height: 5),
                    widget.image != null
                        ? Container(
                            height: 180,
                            width: double.infinity,
                            decoration: BoxDecoration(
                              border: Border.all(color: Colors.transparent),
                              borderRadius: BorderRadius.circular(20),
                              image: DecorationImage(
                                fit: BoxFit.cover,
                                alignment: Alignment.center,
                                image: NetworkImage(widget.image!),
                              ),
                            ),
                          )
                        : Container(),
                  ],
                ),
              ),
            ],
          ),
          // IconButton(
          //   onPressed: () {
          //     var state = _menuKey.currentState;
          //     state?.showButtonMenu();
          //   },
          //   icon: Icon(
          //     Icons.more_horiz_rounded,
          //     size: 25,
          //   ),
          // ),
          PopupMenuButton(
            itemBuilder: (BuildContext context) => const <PopupMenuEntry>[
              PopupMenuItem(
                value: 1,
                child: Text('Delete'),
              ),
              PopupMenuItem(
                value: 2,
                child: Text('Edit'),
              ),
            ],
            onSelected: (item) async {
              if (item == 1) {
                log('Delete selected');
                postController.deletePost(widget.post.id!, context);
                setState(() {});
              } else if (item == 2) {
                log('Edit selected');
                Get.to(PostEditScreen(), arguments: widget.post);
              }
            },
          ),
          const Divider(thickness: 2),
          const SizedBox(height: 10),
        ],
      ),
    );
  }
}
