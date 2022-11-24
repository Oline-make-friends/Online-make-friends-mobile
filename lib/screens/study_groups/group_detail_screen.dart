import 'package:flutter/material.dart';
import 'package:flutter_making_friends_app_2/models/group_model.dart';
import 'package:flutter_making_friends_app_2/models/user_model.dart';
import 'package:flutter_making_friends_app_2/screens/study_groups/group_post_detail_screen.dart';
import 'package:flutter_making_friends_app_2/widgets/widgets.dart';
import 'package:get/get.dart';

import '../../controllers/controllers.dart';
import '../screens.dart';

class GroupDetailScreen extends StatelessWidget {
  const GroupDetailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Group currentGroup = Get.arguments;
    List<GroupPost> groupPosts = currentGroup.posts!;
    print(groupPosts.toString());
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            //! cover img
            Container(
              height: MediaQuery.of(context).size.height / 3.1,
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                // border: Border.fromBorderSide(),
                borderRadius: const BorderRadius.only(
                    bottomLeft: Radius.circular(50),
                    bottomRight: Radius.circular(50)),
                image: DecorationImage(
                  image: NetworkImage(currentGroup.avatarUrl ??
                      'https://images.unsplash.com/photo-1605379399642-870262d3d051?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1206&q=80'),
                  fit: BoxFit.cover,
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                // mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Align(
                        alignment: Alignment.topLeft,
                        child: IconButton(
                          onPressed: () {
                            Get.back();
                          },
                          icon: Icon(
                            Icons.arrow_back,
                            color: Colors.white,
                          ),
                        ),
                      ),
                      IconButton(
                        onPressed: () {},
                        icon: Icon(
                          Icons.more_horiz_outlined,
                          color: Colors.white,
                        ),
                      )
                    ],
                  ),
                  const SizedBox(height: 20),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      // mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SizedBox(
                          width: double.infinity,
                          child: Text(
                            currentGroup.name ?? "Group name",
                            style: Theme.of(context)
                                .textTheme
                                .headline1!
                                .copyWith(color: Colors.white),
                          ),
                        ),
                        SizedBox(
                          width: double.infinity,
                          child: Text(
                            currentGroup.content ?? 'Java',
                            style: Theme.of(context)
                                .textTheme
                                .headline6!
                                .copyWith(
                                    color: Colors.white,
                                    fontWeight: FontWeight.normal),
                          ),
                        ),
                        // const SizedBox(height: 10),
                        Row(
                          children: [
                            Text(
                              '${currentGroup.members!.length} members',
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyText1!
                                  .copyWith(color: Colors.white),
                            ),
                            IconButton(
                              onPressed: () {},
                              icon: Icon(
                                Icons.info,
                                size: 20,
                                color: Colors.white,
                              ),
                            )
                          ],
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
            //!

            //! Posts
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Align(
                alignment: Alignment.topLeft,
                child: Text(
                  'Disscussions',
                  style: Theme.of(context).textTheme.headline2,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: ListView.builder(
                physics: const NeverScrollableScrollPhysics(),
                itemCount: groupPosts.length,
                shrinkWrap: true,
                itemBuilder: (context, index) {
                  final loginController = Get.put(LoginController());
                  User currentUser = loginController.loginedUser.value;
                  return CustomPost(
                    user: groupPosts[index].createdBy!,
                    likes: groupPosts[index].likes!,
                    content: groupPosts[index].content,
                    image: groupPosts[index].imageUrl,
                    comments: groupPosts[index].comments!,
                    createdAt: groupPosts[index].createdAt,
                    onTap: () {
                      Get.to(GroupPostDetailScreen(), arguments: [
                        groupPosts[index],
                        currentUser,
                      ]);
                    },
                  );
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
