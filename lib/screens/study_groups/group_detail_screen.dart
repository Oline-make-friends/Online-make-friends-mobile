import 'package:flutter/material.dart';
import 'package:flutter_making_friends_app_2/models/group_model.dart';
import 'package:flutter_making_friends_app_2/models/user_model.dart';
import 'package:flutter_making_friends_app_2/screens/study_groups/create_group_post_screen.dart';
import 'package:flutter_making_friends_app_2/screens/study_groups/group_post_detail_screen.dart';
import 'package:flutter_making_friends_app_2/widgets/widgets.dart';
import 'package:get/get.dart';

import '../../controllers/controllers.dart';
import '../screens.dart';

class GroupDetailScreen extends StatelessWidget {
  const GroupDetailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final groupController = Get.put(GroupController());
    final loginController = Get.put(LoginController());
    final postController = Get.put(PostController());
    Group viewedGroup = groupController.currentGroup.value;
    List<GroupPost> groupPostList = groupController.currentGroup.value.posts!;

    return Scaffold(
      floatingActionButton: FloatingActionButton(
        backgroundColor: Theme.of(context).primaryColor,
        child: const Icon(Icons.add),
        onPressed: () {
          Get.to(CreateGroupPostScreen());
        },
      ),
      endDrawer: SizedBox(
        width: 250,

        //!Drawer
        child: Drawer(
          child: Padding(
            padding: const EdgeInsets.only(
              top: 30,
              left: 10,
              right: 10,
            ),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Admins',
                        style: Theme.of(context)
                            .textTheme
                            .bodyText1!
                            .copyWith(color: Theme.of(context).primaryColor),
                      ),
                      Builder(
                        builder: (_) {
                          return ListView.builder(
                            shrinkWrap: true,
                            itemCount: groupController.adminList.length,
                            itemBuilder: (context, index) {
                              return Column(
                                children: [
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      CircleAvatar(
                                        radius: 15,
                                        backgroundImage: NetworkImage(
                                            groupController
                                                .adminList[index].avatarUrl!),
                                      ),
                                      const SizedBox(width: 10),
                                      Text(groupController
                                          .adminList[index].fullname!)
                                    ],
                                  ),
                                  const SizedBox(height: 10),
                                ],
                              );
                            },
                          );
                        },
                      ),
                      const SizedBox(height: 10),
                      Divider(thickness: 2),
                      Text(
                        'Members',
                        style: Theme.of(context)
                            .textTheme
                            .bodyText1!
                            .copyWith(color: Theme.of(context).primaryColor),
                      ),
                      Builder(
                        builder: (_) {
                          return ListView.builder(
                            shrinkWrap: true,
                            itemCount: groupController.memberList.length,
                            itemBuilder: (context, index) {
                              return Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Column(
                                    children: [
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.start,
                                            children: [
                                              CircleAvatar(
                                                radius: 15,
                                                backgroundImage: NetworkImage(
                                                    groupController
                                                        .memberList[index]
                                                        .avatarUrl!),
                                              ),
                                              const SizedBox(width: 10),
                                              SizedBox(
                                                width: 140,
                                                child: Text(groupController
                                                    .memberList[index]
                                                    .fullname!),
                                              ),
                                            ],
                                          ),
                                          groupController.adminList.contains(
                                                  loginController
                                                      .loginedUser.value)
                                              ? IconButton(
                                                  onPressed: () {},
                                                  icon: const Icon(
                                                    Icons.remove_circle,
                                                    color: Colors.red,
                                                  ),
                                                  iconSize: 15,
                                                )
                                              : Container(),
                                        ],
                                      ),
                                      const SizedBox(height: 10),
                                    ],
                                  ),
                                ],
                              );
                            },
                          );
                        },
                      ),
                    ],
                  ),

                  //! actions button
                  groupController.adminList
                          .contains(loginController.loginedUser.value)
                      ? TextButton(
                          onPressed: () {},
                          child: Text(
                            'Edit group',
                            style:
                                Theme.of(context).textTheme.bodyText1!.copyWith(
                                      color: Colors.green,
                                      fontWeight: FontWeight.bold,
                                    ),
                          ),
                        )
                      : Container(),
                  TextButton(
                    onPressed: () {
                      showDialog(
                        context: context,
                        builder: (context) {
                          return AlertDialog(
                            title: Text("Do you want to leave?"),
                            actions: [
                              TextButton(
                                onPressed: () {
                                  Get.back();
                                },
                                child: Text('CANCEL'),
                              ),
                              TextButton(
                                onPressed: () async {
                                  await groupController.leaveGroup();
                                  Alert.showLoadingIndicatorDialog(context);
                                  await groupController.fetchGroups();
                                  Get.back();
                                  Get.back();
                                  Get.back();
                                },
                                child: Text('LEAVE'),
                              ),
                            ],
                          );
                        },
                      );
                    },
                    child: Text(
                      'Leave group',
                      style: Theme.of(context).textTheme.bodyText1!.copyWith(
                            color: Colors.red,
                            fontWeight: FontWeight.bold,
                          ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),

        //! End drawer
      ),
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
                  image: NetworkImage(viewedGroup.avatarUrl ??
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
                            groupController.adminList = <UserModel>[];
                            groupController.memberList = <UserModel>[];
                            Get.back();
                          },
                          icon: Icon(
                            Icons.arrow_back,
                            color: Theme.of(context).primaryColor,
                          ),
                        ),
                      ),
                      Builder(builder: (context) {
                        return IconButton(
                          onPressed: () {
                            Scaffold.of(context).openEndDrawer();
                          },
                          icon: Icon(
                            Icons.list,
                            color: Theme.of(context).primaryColor,
                          ),
                        );
                      })
                    ],
                  ),

                  //! group name
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
                            viewedGroup.name ?? "Group name",
                            style: Theme.of(context)
                                .textTheme
                                .headline1!
                                .copyWith(
                                    color: Theme.of(context)
                                        .scaffoldBackgroundColor),
                          ),
                        ),

                        //! group content
                        SizedBox(
                          width: double.infinity,
                          child: Text(
                            viewedGroup.content ?? 'Java',
                            style: Theme.of(context)
                                .textTheme
                                .headline6!
                                .copyWith(
                                    color: Theme.of(context)
                                        .scaffoldBackgroundColor,
                                    fontWeight: FontWeight.normal),
                          ),
                        ),
                        // const SizedBox(height: 10),
                        Row(
                          children: [
                            Text(
                              '${viewedGroup.members!.length} members',
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyText1!
                                  .copyWith(
                                      color: Theme.of(context)
                                          .scaffoldBackgroundColor),
                            ),
                            Builder(builder: (context) {
                              return IconButton(
                                onPressed: () {
                                  Scaffold.of(context).openEndDrawer();
                                },
                                icon: Icon(
                                  Icons.info,
                                  size: 20,
                                  color:
                                      Theme.of(context).scaffoldBackgroundColor,
                                ),
                              );
                            })
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
                itemCount: groupPostList.length,
                shrinkWrap: true,
                itemBuilder: (context, index) {
                  final loginController = Get.put(LoginController());
                  UserModel currentUser = loginController.loginedUser.value;
                  return CustomPost(
                    user: groupPostList[index].createdBy!,
                    currentUser: loginController.loginedUser.value,
                    currentPostId: groupPostList[index].id,
                    likes: groupPostList[index].likes!,
                    content: groupPostList[index].content,
                    image: groupPostList[index].imageUrl,
                    comments: groupPostList[index].comments!,
                    createdAt: groupPostList[index].createdAt,
                    authorId: groupPostList[index].createdBy!.id!,
                    onTap: () {
                      Alert.showLoadingIndicatorDialog(context);
                      if (groupPostList[index]
                          .likes!
                          .contains(currentUser.id)) {
                        postController.isLiked.value = true;
                      } else {
                        postController.isLiked.value = false;
                      }
                      Get.back();
                      Get.to(GroupPostDetailScreen(), arguments: [
                        groupPostList[index],
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
