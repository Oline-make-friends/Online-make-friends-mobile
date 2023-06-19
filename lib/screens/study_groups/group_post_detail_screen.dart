import 'package:flutter/material.dart';
import 'package:flutter_linkify/flutter_linkify.dart';
import 'package:flutter_making_friends_app_2/controllers/controllers.dart';
import 'package:flutter_making_friends_app_2/models/models.dart';
import 'package:flutter_making_friends_app_2/screens/news/image_view_screen.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
// import 'package:url_launcher/url_launcher.dart';

class GroupPostDetailScreen extends StatelessWidget {
  final PreferredSizeWidget? bottom;

  GroupPostDetailScreen({super.key, this.bottom});

  @override
  Widget build(BuildContext context) {
    GroupPost currentPost = Get.arguments[0];
    var loginController = Get.put(LoginController());
    final postController = Get.put(PostController());
    UserModel currentUser = Get.arguments[1];

    return Scaffold(
      appBar: AppBar(
        title: Text(
          "${currentPost.createdBy!.fullname}'s post",
          style: Theme.of(context).textTheme.headline5,
        ),
        iconTheme: IconThemeData(color: Theme.of(context).primaryColor),
        elevation: 0,
        backgroundColor: Colors.transparent,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  //! creator
                  Row(
                    children: [
                      CircleAvatar(
                        backgroundImage:
                            NetworkImage(currentPost.createdBy!.avatarUrl!),
                      ),
                      const SizedBox(width: 10),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            currentPost.createdBy!.fullname!,
                            style: Theme.of(context)
                                .textTheme
                                .headline6!
                                .copyWith(color: Colors.black),
                          ),
                          Text(
                            "${currentPost.createdAt.day}/${currentPost.createdAt.month}/${currentPost.createdAt.year} ${currentPost.createdAt.hour}h:${currentPost.createdAt.minute}'",
                            style: Theme.of(context).textTheme.bodyText2,
                          ),
                        ],
                      ),
                    ],
                  ),
                  //! content
                  const SizedBox(height: 5),

                  const SizedBox(height: 5),
                  currentPost.content != null
                      ? Text(
                          currentPost.content!,
                          style: Theme.of(context)
                              .textTheme
                              .bodyText1!
                              .copyWith(color: Colors.black, height: 2),
                        )
                      : Container(),
                  const SizedBox(height: 5),
                  currentPost.imageUrl != null
                      ? GestureDetector(
                          onTap: () {
                            Get.to(ImageViewScreen(),
                                arguments: currentPost.imageUrl);
                          },
                          child: Hero(
                            tag: 'image_hero',
                            child: Container(
                              height: 200,
                              decoration: BoxDecoration(
                                border: Border.all(color: Colors.transparent),
                                borderRadius: BorderRadius.circular(20),
                                image: DecorationImage(
                                  fit: BoxFit.cover,
                                  image: NetworkImage(currentPost.imageUrl!),
                                ),
                              ),
                            ),
                          ),
                        )
                      : const SizedBox(),
                  const Divider(thickness: 2),
                  Text(
                    '${currentPost.comments!.length} Comments ${currentPost.likes!.length} Likes',
                    style: Theme.of(context).textTheme.bodyText1,
                  ),
                  const Divider(thickness: 2),
                  //! action buttons
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      IconButton(
                        onPressed: () {},
                        icon: const FaIcon(
                          FontAwesomeIcons.comment,
                        ),
                      ),
                      IconButton(
                        onPressed: () async {
                          await postController.likePost(
                              currentPost.id!, currentUser.id!);
                        },
                        icon: postController.isLiked.value
                            ? FaIcon(
                                FontAwesomeIcons.solidHeart,
                              )
                            : FaIcon(
                                FontAwesomeIcons.heart,
                              ),
                      ),
                    ],
                  ),
                ],
              ),
            ),

            //! Comments
            const Divider(thickness: 3),
            currentPost.comments!.isNotEmpty
                ? ListView.builder(
                    physics: const NeverScrollableScrollPhysics(),
                    scrollDirection: Axis.vertical,
                    shrinkWrap: true,
                    itemCount: currentPost.comments!.length,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10),
                        child: Column(
                          children: [
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Align(
                                  alignment: Alignment.topLeft,
                                  child: CircleAvatar(
                                    backgroundImage: NetworkImage(
                                        UserModel.users[0].avatarUrl!),
                                  ),
                                ),
                                const SizedBox(width: 10),
                                Flexible(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        UserModel.users[0].fullname!,
                                        style: Theme.of(context)
                                            .textTheme
                                            .headline6!
                                            .copyWith(color: Colors.black),
                                      ),
                                      // Text("$postDay"),
                                      const SizedBox(height: 5),
                                      Text(
                                        'Content',
                                        style: Theme.of(context)
                                            .textTheme
                                            .bodyText1!
                                            .copyWith(
                                              color: Colors.black,
                                            ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                            const Divider(thickness: 1.5),
                            const SizedBox(height: 2),
                          ],
                        ),
                      );
                    },
                  )
                : Center(
                    child: Text(
                      '.',
                      style: Theme.of(context).textTheme.headline5,
                    ),
                  ),
          ],
        ),
      ),

      //!comment box
      bottomSheet: Container(
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: Theme.of(context).scaffoldBackgroundColor,
        ),
        // width: 100,
        height: 80,
        child: Row(
          children: [
            CircleAvatar(
              backgroundImage: NetworkImage(currentUser.avatarUrl!),
            ),
            const SizedBox(
              width: 10,
            ),
            Expanded(
              child: const TextField(
                decoration: InputDecoration(
                  filled: true,
                  fillColor: Colors.transparent,
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

  @override
  Size get preferredSize =>
      bottom != null ? const Size.fromHeight(100) : const Size.fromHeight(50);
}
