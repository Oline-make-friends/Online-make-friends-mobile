// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_making_friends_app_2/controllers/group_controller.dart';
import 'package:flutter_making_friends_app_2/widgets/custom_appbar.dart';
import 'package:get/get.dart';

import '../../widgets/widgets.dart';

class ClubScreen extends StatelessWidget {
  const ClubScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final groupController = Get.put(GroupController());
    return Scaffold(
      appBar: CustomAppBar(),
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
                    'all clubs',
                    style: Theme.of(context).textTheme.headline2,
                  ),
                  Text(
                    'Find your favorite clubs',
                    style: Theme.of(context)
                        .textTheme
                        .bodyText2!
                        .copyWith(color: Colors.black54),
                  )
                ],
              ),
            ),

            //!pins row
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Row(
                  children: [
                    FilterChip(
                      label: const Text('Programming'),
                      avatar: Icon(Icons.schedule),
                      onSelected: (value) {},
                    ),
                    const SizedBox(width: 10),
                    FilterChip(
                      label: const Text('Activities'),
                      avatar: Icon(Icons.abc),
                      onSelected: (value) {},
                    ),
                    const SizedBox(width: 10),
                    FilterChip(
                      label: const Text('Sport'),
                      avatar: Icon(Icons.abc),
                      onSelected: (value) {},
                    ),
                    const SizedBox(width: 10),
                    FilterChip(
                      label: const Text('Design'),
                      avatar: Icon(Icons.abc),
                      onSelected: (value) {},
                    ),
                    const SizedBox(width: 10),
                    FilterChip(
                      label: const Text('Backpacking'),
                      avatar: Icon(Icons.abc),
                      onSelected: (value) {},
                    ),
                    const SizedBox(width: 10),
                    FilterChip(
                      label: const Text('Gaming'),
                      avatar: Icon(Icons.abc),
                      onSelected: (value) {},
                    ),
                    const SizedBox(width: 10),
                  ],
                ),
              ),
            ),

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
                          hintText: 'Search for club',
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
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Popular Clubs',
                        style: Theme.of(context).textTheme.headline5,
                      ),
                      IconButton(
                        onPressed: () {},
                        icon: Icon(
                          Icons.arrow_right_alt,
                          size: 30,
                        ),
                      ),
                    ],
                  ),

                  //! clubs row
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: [
                        ClubContainer(
                          name: 'Java',
                          category: 'Programming',
                          coverImg:
                              'https://images.unsplash.com/photo-1605379399642-870262d3d051?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1206&q=80',
                        ),
                        const SizedBox(width: 20),
                        ClubContainer(
                          name: 'C#',
                          category: 'Programming',
                          coverImg:
                              'https://images.unsplash.com/photo-1605379399642-870262d3d051?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1206&q=80',
                        ),
                        const SizedBox(width: 20),
                        ClubContainer(
                          name: 'Soccer',
                          category: 'Activities',
                          coverImg:
                              'https://images.unsplash.com/photo-1552674605-db6ffd4facb5?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1170&q=80',
                        ),
                        const SizedBox(width: 20),
                        ClubContainer(
                          name: 'Adobe PS',
                          category: 'Design',
                          coverImg:
                              'https://images.unsplash.com/photo-1475669698648-2f144fcaaeb1?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1170&q=80',
                        ),
                        const SizedBox(width: 20),
                      ],
                    ),
                  ),

                  //!joined
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Your Clubs',
                        style: Theme.of(context).textTheme.headline5,
                      ),
                      IconButton(
                        onPressed: () {
                          print('pressed');
                        },
                        icon: Icon(
                          Icons.arrow_right_alt,
                          size: 30,
                        ),
                      ),
                    ],
                  ),

                  //! clubs row
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: [
                        ClubContainer(
                          name: 'Java',
                          category: 'Programming',
                          coverImg:
                              'https://images.unsplash.com/photo-1605379399642-870262d3d051?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1206&q=80',
                        ),
                        const SizedBox(width: 20),
                        ClubContainer(
                          name: 'Soccer',
                          category: 'Activities',
                          coverImg:
                              'https://images.unsplash.com/photo-1552674605-db6ffd4facb5?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1170&q=80',
                        ),
                        const SizedBox(width: 20),
                        // Obx(
                        //   () {
                        //     return ClubContainer(
                        //         name: groupController.groupList[0].name!,
                        //         coverImg:
                        //             groupController.groupList[0].avatarUrl!,
                        //         category: 'Entertainng');
                        //   },
                        // ),
                      ],
                    ),
                  ),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Test fetch Clubs',
                        style: Theme.of(context).textTheme.headline5,
                      ),
                      IconButton(
                        onPressed: () {
                          print('pressed');
                        },
                        icon: Icon(
                          Icons.arrow_right_alt,
                          size: 30,
                        ),
                      ),
                    ],
                  ),

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
                                    coverImg: groupController
                                        .groupList[index].avatarUrl!,
                                    category: 'Entertaining',
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
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
