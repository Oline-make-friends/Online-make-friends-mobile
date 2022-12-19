// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_making_friends_app_2/controllers/group_controller.dart';
import 'package:flutter_making_friends_app_2/models/user_model.dart';
import 'package:flutter_making_friends_app_2/screens/study_groups/group_detail_screen.dart';
import 'package:get/get.dart';

import '../../controllers/controllers.dart';
import '../../widgets/widgets.dart';

class GroupsScreen extends StatelessWidget {
  const GroupsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final groupController = Get.put(GroupController());

    return Scaffold(
      appBar: const CustomAppBar(),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Explore',
                    style: Theme.of(context).textTheme.headline1,
                  ),
                  Text(
                    'all study groups',
                    style: Theme.of(context).textTheme.headline2,
                  ),
                  Text(
                    'Find your favorite groups',
                    style: Theme.of(context)
                        .textTheme
                        .bodyText2!
                        .copyWith(color: Colors.black54),
                  )
                ],
              ),
            ),

            //!pins row
            // SingleChildScrollView(
            //   scrollDirection: Axis.horizontal,
            //   child: Padding(
            //     padding: const EdgeInsets.symmetric(horizontal: 20),
            //     child: Row(
            //       children: [
            //         FilterChip(
            //           label: const Text('Programming'),
            //           avatar: Icon(Icons.schedule),
            //           onSelected: (value) {},
            //         ),
            //         const SizedBox(width: 10),
            //         FilterChip(
            //           label: const Text('Activities'),
            //           avatar: Icon(Icons.abc),
            //           onSelected: (value) {},
            //         ),
            //         const SizedBox(width: 10),
            //         FilterChip(
            //           label: const Text('Sport'),
            //           avatar: Icon(Icons.abc),
            //           onSelected: (value) {},
            //         ),
            //         const SizedBox(width: 10),
            //         FilterChip(
            //           label: const Text('Design'),
            //           avatar: Icon(Icons.abc),
            //           onSelected: (value) {},
            //         ),
            //         const SizedBox(width: 10),
            //         FilterChip(
            //           label: const Text('Backpacking'),
            //           avatar: Icon(Icons.abc),
            //           onSelected: (value) {},
            //         ),
            //         const SizedBox(width: 10),
            //         FilterChip(
            //           label: const Text('Gaming'),
            //           avatar: Icon(Icons.abc),
            //           onSelected: (value) {},
            //         ),
            //         const SizedBox(width: 10),
            //       ],
            //     ),
            //   ),
            // ),

            //!search container
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 20),
              height: 40,
              decoration: BoxDecoration(
                color: Colors.white,
                // border: Border.all(),
                borderRadius: BorderRadius.circular(10),
              ),
              child: Row(
                children: [
                  IconButton(
                    onPressed: () {},
                    icon: Icon(Icons.search),
                  ),
                  Flexible(
                    child: TextField(
                      decoration: InputDecoration(
                          hintText: 'Search for group',
                          border: InputBorder.none),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 10),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  //!popular
                  const SizedBox(height: 10),
                  Text(
                    'Popular Groups',
                    style: Theme.of(context).textTheme.headline5,
                  ),
                  const SizedBox(height: 10),
                  //! clubs row
                  Obx(
                    () {
                      if (groupController.isLoading.value) {
                        return const CircularProgressIndicator();
                      } else {
                        return SizedBox(
                          height: 210,
                          child: ListView.builder(
                            shrinkWrap: true,
                            scrollDirection: Axis.horizontal,
                            itemCount: groupController.groupList.length,
                            itemBuilder: (context, index) {
                              return Row(
                                children: [
                                  ClubContainer(
                                    name:
                                        groupController.groupList[index].name!,
                                    onPressed: () async {
                                      // print(groupController.groupList[index].id!);
                                      await groupController.joinGroup(
                                          groupId: groupController
                                              .groupList[index].id!);
                                      await groupController.fetchGroups();
                                    },
                                    coverImg: groupController
                                        .groupList[index].avatarUrl!,
                                    numberOfMembers: groupController
                                        .groupList[index].members!.length,
                                  ),
                                  const SizedBox(width: 20),
                                ],
                              );
                            },
                          ),
                        );
                      }
                    },
                  ),

                  //!joined
                  const SizedBox(height: 10),
                  Text(
                    'Your Groups',
                    style: Theme.of(context).textTheme.headline5,
                  ),
                  const SizedBox(height: 10),
                  //! clubs row
                  Obx(
                    () {
                      if (groupController.isLoading.value) {
                        return const CircularProgressIndicator();
                      } else {
                        return SizedBox(
                          height: 210,
                          child: ListView.builder(
                            shrinkWrap: true,
                            scrollDirection: Axis.horizontal,
                            itemCount: groupController.joinedGroup.length,
                            itemBuilder: (context, index) {
                              return Row(
                                children: [
                                  ClubContainer(
                                    name: groupController
                                        .joinedGroup[index].name!,
                                    isJoined: true,
                                    onPressed: () async {
                                      Alert.showLoadingIndicatorDialog(context);
                                      for (String admin in groupController
                                          .joinedGroup[index].admins!) {
                                        await groupController.findAdminById(
                                            userId: admin);
                                      }

                                      for (String member in groupController
                                          .joinedGroup[index].members!) {
                                        await groupController.findMemberById(
                                            userId: member);
                                      }

                                      groupController.currentGroup.value =
                                          groupController.joinedGroup[index];
                                      Get.back();
                                      Get.to(GroupDetailScreen(),
                                          arguments: groupController
                                              .joinedGroup[index]);
                                    },
                                    coverImg: groupController
                                        .joinedGroup[index].avatarUrl!,
                                    numberOfMembers: groupController
                                        .joinedGroup[index].members!.length,
                                  ),
                                  const SizedBox(width: 20),
                                ],
                              );
                            },
                          ),
                        );
                      }
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
