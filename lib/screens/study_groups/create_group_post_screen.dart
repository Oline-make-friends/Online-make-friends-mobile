import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';

import '../../controllers/controllers.dart';
import '../../widgets/widgets.dart';

class CreateGroupPostScreen extends StatelessWidget {
  const CreateGroupPostScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final imageController = Get.put(UpdateProfileController());
    final postController = Get.put(PostController());
    final groupController = Get.put(GroupController());
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
                groupController
                    .uploadPost(groupController.currentGroup.value.id!);
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
                    //! type and tag
                    // PostTypeDropDown(),
                    // const SizedBox(height: 5),

                    // CustomTextFormField(
                    //   labelText: 'Hashtag',
                    //   controller: postController.hashtag,
                    // ),
                    //! textfield
                    TextField(
                      style: Theme.of(context).textTheme.headline5,
                      maxLines: groupController.imgUrl != '' ? 18 : 30,
                      controller: groupController.contentController,
                      decoration: InputDecoration(
                        hintText: 'What are you thinking?',
                        border: InputBorder.none,
                      ),
                    ),

                    //! image
                    groupController.imgUrl != ''
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
                                                    groupController
                                                        .imgUrl.value),
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
                                    groupController.imgUrl.value = '';
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
                      groupController.imgUrl.value = img;
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
