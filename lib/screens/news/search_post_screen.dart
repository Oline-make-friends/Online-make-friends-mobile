import 'package:flutter/material.dart';
import 'package:flutter_making_friends_app_2/controllers/controllers.dart';
import 'package:flutter_making_friends_app_2/widgets/widgets.dart';
import 'package:get/get.dart';

import '../../models/models.dart';
import '../screens.dart';

class SearchPostScreen extends StatelessWidget {
  const SearchPostScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final postController = Get.put(PostController());
    final loginController = Get.put(LoginController());
    UserModel currentUser = loginController.loginedUser.value;
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        title: CustomTextFormField(
          labelText: "Search by hashtag",
          controller: postController.searchKey,
          suffixIcon: IconButton(
            onPressed: () {
              postController.searchByHashTag();
            },
            icon: Icon(Icons.search),
          ),
        ),
        leading: IconButton(
          onPressed: () {
            postController.searchKey.clear();
            postController.searchResult.clear();
            Get.back();
          },
          icon: Icon(
            Icons.arrow_back,
            color: Theme.of(context).primaryColor,
          ),
        ),
      ),
      body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
          child: Obx(
            () {
              return ListView.builder(
                itemCount: postController.searchResult.length,
                itemBuilder: (context, index) {
                  return InkWell(
                    onTap: () async {
                      Alert.showLoadingIndicatorDialog(context);
                      if (postController.searchResult[index].likes!
                          .contains(currentUser.id)) {
                        postController.isLiked.value = true;
                      } else {
                        postController.isLiked.value = false;
                      }
                      // await postController.getCommentUser(fetchedPosts[index]);
                      for (int i = 0;
                          i <=
                              postController
                                      .searchResult[index].comments!.length -
                                  1;
                          i++) {
                        await postController.getCommentUser(
                            postController.searchResult[index].comments![i]);
                      }
                      postController.currentPost.value =
                          postController.searchResult[index];
                      Get.back();
                      Get.to(PostDetailScreen(), arguments: [
                        postController.searchResult[index],
                        currentUser,
                      ]);
                    },
                    child: CustomPost(
                      user: postController.searchResult[index].createdBy!,
                      currentPostId: postController.searchResult[index].id,
                      currentUser: currentUser,
                      type: postController.searchResult[index].type ?? "",
                      hashtag: postController.searchResult[index].hashtag,
                      content: postController.searchResult[index].content,
                      image: postController.searchResult[index].imageUrl,
                      likes: postController.searchResult[index].likes!,
                      comments: postController.searchResult[index].comments!,
                      createdAt: postController.searchResult[index].createdAt,
                      authorId:
                          postController.searchResult[index].createdBy!.id,
                    ),
                  );
                },
              );
            },
          )),
    );
  }
}
