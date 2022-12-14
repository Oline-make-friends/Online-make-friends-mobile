import 'package:flutter/material.dart';
import 'package:flutter_making_friends_app_2/controllers/controllers.dart';
import 'package:flutter_making_friends_app_2/controllers/update_profile_controller.dart';
import 'package:flutter_making_friends_app_2/models/models.dart';
import 'package:flutter_making_friends_app_2/widgets/custom_text_form_field.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';

import '../../widgets/post_type.dart';

class CreatePostScreen extends StatelessWidget {
  const CreatePostScreen({super.key});

  @override
  Widget build(BuildContext context) {
    UserModel currentUser = Get.arguments;
    final imageController = Get.put(UpdateProfileController());
    final postController = Get.put(PostController());
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Text(
          'Create new post',
          style: Theme.of(context).textTheme.headline5,
        ),
        leading: IconButton(
          onPressed: () {
            postController.onClose();
            Get.back();
          },
          icon: Icon(
            Icons.close,
            color: Theme.of(context).primaryColor,
          ),
        ),
        actions: [
          ElevatedButton(
              style: ElevatedButton.styleFrom(
                  elevation: 0,
                  backgroundColor: Theme.of(context).primaryColor),
              onPressed: () {
                postController.createPost(context, createdBy: currentUser);
              },
              child: Text('Post',
                  style: Theme.of(context)
                      .textTheme
                      .headline6!
                      .copyWith(color: Colors.white)))
        ],
      ),
      body: Padding(
          padding: const EdgeInsets.all(15),
          child: Obx(
            () {
              return SingleChildScrollView(
                child: Column(
                  children: [
                    PostTypeDropDown(
                      type: postController.postType.value,
                    ),
                    const SizedBox(height: 5),

                    CustomTextFormField(
                      labelText: 'Hashtag',
                      controller: postController.hashtag,
                    ),
                    //! textfield
                    TextField(
                      style: Theme.of(context).textTheme.headline5,
                      maxLines: postController.imageUrl != '' ? 11 : 30,
                      controller: postController.content,
                      decoration: InputDecoration(
                        hintText: 'What are you thinking?',
                        border: InputBorder.none,
                      ),
                    ),

                    //! image
                    postController.imageUrl != ''
                        ? Stack(
                            children: [
                              Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 18, vertical: 20),
                                child: imageController.isLoading.value == false
                                    ? Card(
                                        child: Positioned(
                                          left: 50,
                                          top: 50,
                                          child: Container(
                                            height: 200,
                                            decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(20),
                                              image: DecorationImage(
                                                image: NetworkImage(
                                                    postController
                                                        .imageUrl.value),
                                                fit: BoxFit.fill,
                                              ),
                                            ),
                                          ),
                                        ),
                                      )
                                    : Card(
                                        child: Container(
                                          height: 200,
                                          decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(20),
                                          ),
                                          child: Center(
                                            child: CircularProgressIndicator(),
                                          ),
                                        ),
                                      ),
                              ),
                              Align(
                                alignment: Alignment.topRight,
                                child: IconButton(
                                  onPressed: () {
                                    postController.imageUrl.value = '';
                                  },
                                  icon: Icon(Icons.close_rounded),
                                ),
                              ),
                            ],
                          )
                        : Container(),
                  ],
                ),
              );
            },
          )),

      //!add image
      bottomSheet: Container(
        decoration: BoxDecoration(
          color: Theme.of(context).scaffoldBackgroundColor,
          border: Border(
            top:
                BorderSide(color: Theme.of(context).primaryColor.withAlpha(50)),
          ),
        ),
        height: 40,
        child: Padding(
          padding: const EdgeInsets.symmetric(),
          child: Row(
            children: [
              IconButton(
                onPressed: () async {
                  await imageController.updateImgUrlByGallery().then((img) {
                    if (img == null) {
                      return;
                    } else {
                      postController.imageUrl.value = img;
                    }
                  });
                },
                icon: FaIcon(
                  FontAwesomeIcons.image,
                  color: Theme.of(context).primaryColor,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
