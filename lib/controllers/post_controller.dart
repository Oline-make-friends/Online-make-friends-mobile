import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_making_friends_app_2/models/comment_model.dart';
import 'package:flutter_making_friends_app_2/models/post_model.dart';
import 'package:flutter_making_friends_app_2/models/user_model.dart';
import 'package:flutter_making_friends_app_2/repository/post_repository.dart';
import 'package:flutter_making_friends_app_2/repository/repository.dart';
import 'package:flutter_making_friends_app_2/widgets/alert.dart';
import 'package:get/state_manager.dart';

class PostController extends GetxController {
  var isLoading = true.obs;
  var postList = <Post>[].obs;
  var commentUsers = <User>[].obs;
  var userPostList = <Post>[].obs;
  var imageUrl = ''.obs;
  TextEditingController? content;

  @override
  void onInit() {
    super.onInit();
    content = TextEditingController();
    fetchPosts();
  }

  @override
  void onClose() {
    content = TextEditingController();
    imageUrl.value = '';
  }

  Future<void> fetchPosts() async {
    var posts = await PostRepository.getAllPost("post/getAll");
    if (posts != null) {
      postList.value = posts.reversed.toList();
      // print(postList.toString());
    }
    isLoading.value = false;
    update();
  }

  Future<void> createPost(BuildContext context,
      {required User createdBy}) async {
    Alert.showLoadingIndicatorDialog(context);
    Post post = Post(
      createdBy: createdBy,
      imageUrl: imageUrl.value,
      content: content!.text,
    );
    var response =
        await PostRepository.createPost('post/add', postToJson(post));
    Navigator.of(context).pop();
    ScaffoldMessenger.of(context)
        .showSnackBar(SnackBar(content: Text('Post created!')));
    Navigator.of(context).pop();
  }

  Future<void> getUserPost({required String userId}) async {
    var posts = await PostRepository.getPostByUserId('post/get/$userId');
    if (posts != null) {
      userPostList.value = posts.reversed.toList();
      // print(userPostList.toString());
    }
    isLoading.value = false;
    update();
  }

  Future<void> getCommentUser(Post post) async {
    commentUsers.clear();
    for (Comment com in post.comments!) {
      var response =
          await UserRepository.getUserById('user/getUser/${com.userId}');
      // print('respone: ${response.toString()}');
      var data = json.decode(response);
      if (data.toString().contains('Cast to ObjectId failed')) {
        // print(isLoading.toString());
        // print('can not find user');
        return;
      } else {
        // print(isLoading.toString());
        // isLoading.value = false;
        User user = User.fromJson(data);
        commentUsers.add(user);
        print("Comment User list: ${commentUsers.toString()}");
      }
    }
  }
}
