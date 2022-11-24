// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_linkify/flutter_linkify.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../models/models.dart';

class CustomPost extends StatelessWidget {
  final String? image;
  final User user;
  final String? type;
  final String? hashtag;
  final String? content;
  final List<dynamic> likes;
  final List<dynamic> comments;
  final void Function()? onTap;
  final DateTime createdAt;
  const CustomPost({
    Key? key,
    this.image,
    this.type,
    this.hashtag,
    required this.user,
    this.content,
    required this.likes,
    required this.comments,
    this.onTap,
    required this.createdAt,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    int postDay = (DateTime.now().day - createdAt.day).abs();
    print('days: $postDay');
    return InkWell(
      onTap: onTap,
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
                        //! name
                        Text(
                          user.fullname!,
                          style: Theme.of(context)
                              .textTheme
                              .headline6!
                              .copyWith(color: Colors.black),
                        ),
                        const SizedBox(width: 5),
                        //! create day
                        Text(
                          postDay < 7 && postDay > 1
                              ? '$postDay days ago'
                              : "${createdAt.day}/${createdAt.month} ${createdAt.hour}:${createdAt.minute}",
                          style: Theme.of(context)
                              .textTheme
                              .bodyText2!
                              .copyWith(color: Colors.black),
                        ),
                      ],
                    ),
                    const SizedBox(height: 5),
                    Row(
                      children: [
                        type != null
                            ? Text(
                                '#${type}',
                                style: Theme.of(context)
                                    .textTheme
                                    .bodyText1!
                                    .copyWith(fontWeight: FontWeight.bold),
                              )
                            : Container(),
                        const SizedBox(width: 5),
                        hashtag != null
                            ? Text(
                                '#${hashtag}',
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
                    content != null
                        ? Linkify(
                            text: content!,
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
                    // SizedBox(height: 5),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            CustomPostButton(
                              icon: FaIcon(
                                FontAwesomeIcons.heart,
                                size: 15,
                              ),
                              number: likes.length,
                            ),
                            CustomPostButton(
                              icon: FaIcon(
                                FontAwesomeIcons.comment,
                                size: 12,
                              ),
                              number: comments.length,
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
        Text('$number'),
      ],
    );
  }
}
