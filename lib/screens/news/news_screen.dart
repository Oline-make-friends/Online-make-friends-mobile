// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:flutter/material.dart';
import 'package:flutter_linkify/flutter_linkify.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';

import 'package:flutter_making_friends_app_2/models/user_model.dart';
import 'package:flutter_making_friends_app_2/screens/news/news_detail_screen.dart';
import 'package:flutter_making_friends_app_2/widgets/custom_appbar.dart';

import '../../controllers/post_controller.dart';
import '../../widgets/widgets.dart';

class NewsFeedScreen extends StatelessWidget {
  static const String routeName = '/news';

  static Route route() {
    return MaterialPageRoute(
        builder: (context) => const NewsFeedScreen(),
        settings: const RouteSettings());
  }

  const NewsFeedScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final postController = Get.put(PostController());
    return Scaffold(
      appBar: const CustomAppBar(),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
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
            // } else if (postController.postList.isEmpty) {
            //   return const Center(
            //     child: Text("You don't have any post"),
            //   );
          } else {
            return ListView.builder(
              itemCount: postController.postList.length,
              itemBuilder: ((context, index) {
                // print(data.toString());
                return CustomPost(
                  onTap: () {
                    Get.to(NewsDetailScreen(),
                        arguments: postController.postList[index]);
                  },
                  user: postController.postList[index].createdBy,
                  content: postController.postList[index].content,
                  image: postController.postList[index].imageUrl,
                  likes: postController.postList[index].likes,
                  comments: postController.postList[index].comments,
                  createdAt: postController.postList[index].createdAt,
                );
              }),
            );
          }
        }),
      ),
    );
  }
}
