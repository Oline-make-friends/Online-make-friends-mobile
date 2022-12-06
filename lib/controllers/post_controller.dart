import 'dart:convert';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_making_friends_app_2/models/comment_model.dart';
import 'package:flutter_making_friends_app_2/models/post_model.dart';
import 'package:flutter_making_friends_app_2/models/user_model.dart';
import 'package:flutter_making_friends_app_2/repository/post_repository.dart';
import 'package:flutter_making_friends_app_2/repository/repository.dart';
import 'package:flutter_making_friends_app_2/widgets/alert.dart';
import 'package:get/get.dart';
import 'package:get/state_manager.dart';

import 'controllers.dart';

class PostController extends GetxController {
  var postType = "Knowledge".obs;
  var isLoading = true.obs;
  var isPosting = false.obs;
  var postList = <Post>[].obs;
  var currentPost = Post().obs;
  var isLiked = false.obs;
  var userPostList = <Post>[].obs;
  var imageUrl = ''.obs;
  final loginController = Get.put(LoginController());
  late UserModel currentUser;
  Comment? comment;
  TextEditingController? content;
  TextEditingController? hashtag;

  @override
  void onInit() {
    super.onInit();
    content = TextEditingController();
    hashtag = TextEditingController();
    currentUser = loginController.loginedUser.value;
    fetchPosts();
    getUserPost(userId: currentUser.id!);
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
      {required UserModel createdBy}) async {
    Alert.showLoadingIndicatorDialog(context);
    print("Where is my tag: ${hashtag?.text}");
    Post post = Post(
      createdBy: createdBy,
      imageUrl: imageUrl.value,
      content: content?.text,
      type: postType.value,
      hashtag: hashtag?.text,
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
      List<Post> postsFetched = posts;
      userPostList.value = postsFetched.reversed.toList();
      // print(userPostList.toString());
    }
    isLoading.value = false;
    update();
  }

  Future<void> getCommentUser(Comment comment) async {
    var response =
        await UserRepository.getUserById('user/getUser/${comment.userId}');
    UserModel commentUser = UserModel.fromJson(jsonDecode(response));
    comment.commentUser = commentUser;
  }

  Future<void> likePost(String postId, String userId) async {
    var response = await PostRepository.likePost('post/like', postId, userId);
    log(response);
    isLiked.value = !isLiked.value;
  }

  Future<void> commentPost(String userId, String content, String postId) async {
    var commentResponse =
        await CommentRepository.addComment('comment/add', content, userId);
    if (commentResponse != null) {
      Comment comment = commentResponse;
      print(comment.toString());
      var commentPost =
          await PostRepository.commentPost("post/comment", comment.id!, postId);
      if (commentPost != null) {
        print(commentPost);
      }
    }
  }

  Future<void> getPostById(String postId, Post post) async {
    var response = await PostRepository.getPostById("post/getPost/$postId");
    if (response != null) {
      var data = Post.fromJson(jsonDecode(response));
      post = data;
    }
  }
}
