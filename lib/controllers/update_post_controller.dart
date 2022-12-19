import 'dart:developer';

import 'package:flutter/widgets.dart';
import 'package:flutter_making_friends_app_2/controllers/controllers.dart';
import 'package:flutter_making_friends_app_2/models/models.dart';
import 'package:flutter_making_friends_app_2/repository/repository.dart';
import 'package:flutter_making_friends_app_2/widgets/alert.dart';
import 'package:get/get.dart';
import 'package:get/state_manager.dart';
import 'package:http/http.dart';

class UpdatePostController extends GetxController {
  late TextEditingController contentController;
  var imgUrl = "".obs;
  late TextEditingController hashtagController;
  var typeController = "".obs;

  Future<void> updatePost(String id) async {
    Post updatePost = Post(
      content: contentController.text,
      imageUrl: imgUrl.value,
      type: typeController.value,
      hashtag: hashtagController.text,
    );
    var response =
        await PostRepository.updatePost("post/update", id, updatePost);
    log(response.toString());
  }
}
