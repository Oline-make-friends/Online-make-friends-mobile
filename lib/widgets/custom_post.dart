// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_linkify/flutter_linkify.dart';
import 'package:flutter_making_friends_app_2/controllers/noti_contrroller.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

import 'package:flutter_making_friends_app_2/controllers/post_controller.dart';

import '../models/models.dart';

class CustomPost extends StatefulWidget {
  final String? currentPostId;
  final String? image;
  final UserModel user;
  final String? type;
  final String? hashtag;
  final String? content;
  final List<dynamic> likes;
  final List<dynamic> comments;
  final void Function()? onTap;
  final DateTime createdAt;
  final UserModel? currentUser;
  final String? authorId;
  const CustomPost({
    Key? key,
    this.currentPostId,
    this.image,
    required this.user,
    this.type,
    this.hashtag,
    this.content,
    required this.likes,
    required this.comments,
    this.onTap,
    required this.createdAt,
    this.currentUser,
    this.authorId,
  }) : super(key: key);

  @override
  State<CustomPost> createState() => _CustomPostState();
}

class _CustomPostState extends State<CustomPost> {
  @override
  Widget build(BuildContext context) {
    int postDay = (DateTime.now().day - widget.createdAt.day).abs();
    final postController = Get.put(PostController());
    final notiController = Get.put(NotiController());
    // print('days: $postDay');
    return InkWell(
      onTap: widget.onTap,
      child: Column(
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Align(
                alignment: Alignment.topLeft,
                child: CircleAvatar(
                  backgroundImage: NetworkImage(widget.user.avatarUrl!),
                ),
              ),
              const SizedBox(width: 5),
              Flexible(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        //! name
                        Text(
                          widget.user.fullname!,
                          style: Theme.of(context)
                              .textTheme
                              .headline6!
                              .copyWith(color: Colors.black),
                        ),
                        const SizedBox(width: 5),
                        //! create day
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
                                    : "${widget.createdAt.day}/${widget.createdAt.month}/${widget.createdAt.year} ${DateFormat.Hm().format(widget.createdAt)}",
                                style: Theme.of(context)
                                    .textTheme
                                    .bodyText2!
                                    .copyWith(color: Colors.black),
                              ),
                      ],
                    ),
                    const SizedBox(height: 5),
                    //!tags
                    Row(
                      children: [
                        widget.type != null
                            ? Text(
                                '#${widget.type}',
                                style: Theme.of(context)
                                    .textTheme
                                    .bodyText1!
                                    .copyWith(fontWeight: FontWeight.bold),
                              )
                            : Container(),
                        const SizedBox(width: 5),
                        widget.hashtag != null
                            ? Text(
                                '#${widget.hashtag}',
                                style: Theme.of(context)
                                    .textTheme
                                    .bodyText1!
                                    .copyWith(fontWeight: FontWeight.bold),
                              )
                            : Container(),
                      ],
                    ),

                    const SizedBox(height: 5),
                    //!content
                    widget.content != null
                        ? Linkify(
                            text: widget.content!,
                            maxLines: 7,
                            style: Theme.of(context)
                                .textTheme
                                .bodyText1!
                                .copyWith(color: Colors.black),
                            onOpen: ((link) => print("Clicked ${link.url}!")),
                          )
                        : Container(),
                    const SizedBox(height: 5),

                    //!img
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
                    // SizedBox(height: 5),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            CustomPostButton(
                              icon:
                                  widget.likes.contains(widget.currentUser!.id)
                                      ? FaIcon(
                                          FontAwesomeIcons.solidHeart,
                                          size: 15,
                                        )
                                      : FaIcon(
                                          FontAwesomeIcons.heart,
                                          size: 15,
                                        ),
                              number: widget.likes.length,
                              onPressed: () async {
                                await postController.likePost(
                                    widget.currentPostId!,
                                    widget.currentUser!.id!);
                                await notiController.addNoti(
                                    "liked your post",
                                    "${widget.currentUser!.fullname}",
                                    widget.authorId!);
                                await postController.fetchPosts();

                                setState(() {});
                              },
                            ),
                            CustomPostButton(
                              icon: FaIcon(
                                FontAwesomeIcons.comment,
                                size: 12,
                              ),
                              number: widget.comments.length,
                            ),
                            // CustomPostButton(
                            //   icon: FaIcon(
                            //     FontAwesomeIcons.share,
                            //     size: 12,
                            //   ),
                            //   number: 15,
                            // ),
                          ],
                        ),
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
                                  const Text('Delete post')
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
          const Divider(thickness: 2),
          const SizedBox(height: 5),
        ],
      ),
    );
  }
}

class CustomPostButton extends StatelessWidget {
  final Widget icon;
  final int number;
  void Function()? onPressed;

  CustomPostButton({
    Key? key,
    this.onPressed,
    required this.icon,
    required this.number,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        IconButton(
          onPressed: onPressed,
          icon: icon,
        ),
        // const SizedBox(width: ),
        Text('$number'),
      ],
    );
  }
}
