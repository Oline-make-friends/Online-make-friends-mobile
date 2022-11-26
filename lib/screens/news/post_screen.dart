import 'package:flutter/material.dart';
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
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Get.to(CreatePostScreen(), arguments: currentUser);
        },
        backgroundColor: Theme.of(context).primaryColor,
        elevation: 5,
        foregroundColor: Theme.of(context).scaffoldBackgroundColor,
        // mini: true,
        child: const FaIcon(FontAwesomeIcons.plus),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
        child: Obx(() {
          if (postController.isLoading.value) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else {
            return RefreshIndicator(
              child: ListView.builder(
                physics: const AlwaysScrollableScrollPhysics(),
                itemCount: postController.postList.length,
                itemBuilder: ((context, index) {
                  // print(data.toString());
                  // print(postController.postList[index].toString());
                  return CustomPost(
                    onTap: () async {
                      if (postController.postList[index].likes!
                          .contains(currentUser.id)) {
                        postController.isLiked.value = true;
                      } else {
                        postController.isLiked.value = false;
                      }
                      await postController
                          .getCommentUser(postController.postList[index]);
                      Get.to(PostDetailScreen(), arguments: [
                        postController.postList[index],
                        currentUser,
                      ]);
                    },
                    user: postController.postList[index].createdBy,
                    currentPost: postController.postList[index],
                    currentUser: currentUser,
                    type: postController.postList[index].type ?? "",
                    hashtag: postController.postList[index].hashtag,
                    content: postController.postList[index].content,
                    image: postController.postList[index].imageUrl,
                    likes: postController.postList[index].likes!,
                    comments: postController.postList[index].comments!,
                    createdAt: postController.postList[index].createdAt,
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
