import 'package:flutter/material.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';

import '../../controllers/controllers.dart';
import '../../models/models.dart';
import '../../widgets/widgets.dart';
import '../screens.dart';

class PostScreen extends StatefulWidget {
  const PostScreen({super.key});

  @override
  State<PostScreen> createState() => _PostScreenState();
}

class _PostScreenState extends State<PostScreen> {
  @override
  Widget build(BuildContext context) {
    final postController = Get.put(PostController());
    final loginController = Get.put(LoginController());
    UserModel currentUser = loginController.loginedUser.value;
    return Scaffold(
      floatingActionButton: SpeedDial(
        backgroundColor: Theme.of(context).primaryColor,
        elevation: 5,
        icon: Icons.add,
        animatedIcon: AnimatedIcons.menu_close,
        spacing: 10,
        children: [
          SpeedDialChild(
              child: Icon(
                Icons.meeting_room_outlined,
                color: Theme.of(context).primaryColor,
              ),
              label: 'New Meeting room',
              onTap: () {
                Get.to(MeetingScreen());
              }),
          SpeedDialChild(
            child: Icon(
              Icons.groups_outlined,
              color: Theme.of(context).primaryColor,
            ),
            label: 'Join meeting room',
            onTap: () {
              Get.to(JoinMeetingScreen());
            },
          ),
          SpeedDialChild(
            child: FaIcon(
              FontAwesomeIcons.featherPointed,
              color: Theme.of(context).primaryColor,
            ),
            label: 'Create new post',
            onTap: () {
              postController.content = TextEditingController();
              postController.hashtag = TextEditingController();
              postController.imageUrl.value = "";
              Get.to(CreatePostScreen(), arguments: currentUser);
            },
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
        child: Obx(() {
          List<Post> fetchedPosts = postController.postList.reversed.toList();
          // print(fetchedPosts.toString());
          if (postController.isLoading.value) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else {
            return RefreshIndicator(
              child: ListView.builder(
                physics: const AlwaysScrollableScrollPhysics(),
                itemCount: fetchedPosts.length,
                itemBuilder: ((context, index) {
                  // print(data.toString());
                  // print(postController.postList[index].toString());
                  return CustomPost(
                    onTap: () async {
                      if (fetchedPosts[index].likes!.contains(currentUser.id)) {
                        postController.isLiked.value = true;
                      } else {
                        postController.isLiked.value = false;
                      }
                      // await postController.getCommentUser(fetchedPosts[index]);
                      for (int i = 0;
                          i <= fetchedPosts[index].comments!.length - 1;
                          i++) {
                        await postController
                            .getCommentUser(fetchedPosts[index].comments![i]);
                      }
                      postController.currentPost.value = fetchedPosts[index];
                      Get.to(PostDetailScreen(), arguments: [
                        fetchedPosts[index],
                        currentUser,
                      ]);
                    },
                    user: fetchedPosts[index].createdBy!,
                    currentPostId: fetchedPosts[index].id,
                    currentUser: currentUser,
                    type: fetchedPosts[index].type ?? "",
                    hashtag: fetchedPosts[index].hashtag,
                    content: fetchedPosts[index].content,
                    image: fetchedPosts[index].imageUrl,
                    likes: fetchedPosts[index].likes!,
                    comments: fetchedPosts[index].comments!,
                    createdAt: fetchedPosts[index].createdAt,
                  );
                }),
              ),
              onRefresh: () {
                return Future.delayed(const Duration(seconds: 1), () {
                  setState(() {
                    postController.fetchPosts();
                  });
                });
              },
            );
          }
        }),
      ),
    );
  }
}
