import 'package:flutter/material.dart';
import 'package:flutter_making_friends_app_2/controllers/post_controller.dart';
import 'package:flutter_making_friends_app_2/controllers/update_post_controller.dart';
import 'package:flutter_making_friends_app_2/controllers/update_profile_controller.dart';
import 'package:flutter_making_friends_app_2/models/models.dart';
import 'package:flutter_making_friends_app_2/widgets/alert.dart';
import 'package:flutter_making_friends_app_2/widgets/custom_text_form_field.dart';
import 'package:flutter_making_friends_app_2/widgets/post_type.dart';
import 'package:get/get.dart';

class PostEditScreen extends StatelessWidget {
  const PostEditScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final updatePostController = Get.put(UpdatePostController());
    Post currentPost = Get.arguments;
    final updateImageController = Get.put(UpdateProfileController());
    final postController = Get.put(PostController());
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        leading: IconButton(
          onPressed: () {
            Get.back();
          },
          icon: Icon(
            Icons.arrow_back,
            color: Theme.of(context).primaryColor,
          ),
        ),
        actions: [
          IconButton(
            onPressed: () async {
              Alert.showLoadingIndicatorDialog(context);
              await updatePostController.updatePost(currentPost.id!);
              await postController.getUserPost(
                  userId: currentPost.createdBy!.id!);
              Get.back();
              Get.back();
            },
            icon: Icon(
              Icons.check,
              color: Theme.of(context).primaryColor,
            ),
          )
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
        child: SingleChildScrollView(
          child: Obx(
            () {
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  PostTypeDropDown(
                      type: updatePostController.typeController.value == ""
                          ? currentPost.type!
                          : updatePostController.typeController.value),
                  CustomTextFormField(
                    controller: updatePostController.hashtagController =
                        TextEditingController(text: currentPost.hashtag),
                    labelText: "Hashtag",
                  ),
                  const SizedBox(height: 10),
                  TextField(
                    style: Theme.of(context).textTheme.headline5,
                    maxLines: 10,
                    controller: updatePostController.contentController =
                        TextEditingController(text: currentPost.content),
                    decoration: InputDecoration(
                      labelText: 'Content',
                      border: InputBorder.none,
                      filled: true,
                      fillColor: Colors.white54,
                      enabledBorder: const OutlineInputBorder(
                        borderSide: BorderSide(
                          width: 1,
                          color: Colors.transparent,
                        ),
                        borderRadius: BorderRadius.all(
                          Radius.circular(15),
                        ),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          width: 2,
                          color: Theme.of(context).primaryColor.withAlpha(90),
                        ),
                        borderRadius: const BorderRadius.all(
                          Radius.circular(15),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 10),
                  Text("Image: "),
                  Center(
                    child: Container(
                      height: 200,
                      width: 300,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        image: DecorationImage(
                          image: updatePostController.imgUrl == ""
                              ? NetworkImage(currentPost.imageUrl!)
                              : NetworkImage(updatePostController.imgUrl.value),
                        ),
                      ),
                    ),
                  ),
                  Center(
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        elevation: 0,
                        backgroundColor: Theme.of(context).primaryColor,
                      ),
                      onPressed: () async {
                        await updateImageController
                            .updateImgUrlByGallery()
                            .then((img) {
                          if (img == null) {
                            updatePostController.imgUrl.value =
                                currentPost.imageUrl!;
                          } else {
                            updatePostController.imgUrl.value = img;
                          }
                        });
                      },
                      child: const Text('choose image'),
                    ),
                  )
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}
