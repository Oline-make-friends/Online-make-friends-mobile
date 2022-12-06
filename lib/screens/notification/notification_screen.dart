// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:flutter_making_friends_app_2/controllers/controllers.dart';
import 'package:flutter_making_friends_app_2/models/friendRequest_model.dart';
import 'package:flutter_making_friends_app_2/models/models.dart';

class NotificationScreen extends StatelessWidget {
  const NotificationScreen({Key? key}) : super(key: key);

  static const String routeName = '/noti';

  static Route route() {
    return MaterialPageRoute(
      builder: (context) => const NotificationScreen(),
      settings: const RouteSettings(),
    );
  }

  @override
  Widget build(BuildContext context) {
    final notiController = Get.put(NotiController());
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Notifications',
          style: Theme.of(context).textTheme.headline5,
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
        iconTheme: IconThemeData(color: Theme.of(context).primaryColor),
      ),
      body: Container(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            notiController.friendReqList.length != 0
                ? Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Friend requests',
                        style: Theme.of(context)
                            .textTheme
                            .bodyText1!
                            .copyWith(fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(height: 10),
                      Obx(
                        () {
                          return ListView.builder(
                            shrinkWrap: true,
                            itemCount: notiController.friendReqList.length,
                            itemBuilder: (context, index) {
                              print(notiController.friendReqList[index].id);
                              return CustomFriendRequestRow(
                                  friendRequest:
                                      notiController.friendReqList[index]);
                            },
                          );
                        },
                      ),
                      const Divider(thickness: 2),
                      Text(
                        'Notifications',
                        style: Theme.of(context)
                            .textTheme
                            .bodyText1!
                            .copyWith(fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(height: 10),
                      Obx(
                        () {
                          return ListView.builder(
                            shrinkWrap: true,
                            itemCount: notiController.friendReqList.length,
                            itemBuilder: (context, index) {
                              print(notiController.friendReqList[index].id);
                              return Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Row(
                                    children: [
                                      CircleAvatar(
                                        radius: 20,
                                        foregroundImage: NetworkImage(
                                            "https://cdn.pixabay.com/photo/2015/10/05/22/37/blank-profile-picture-973460__340.png"),
                                        // backgroundImage: NetworkImage(
                                        //     friendRequest.senderId!.avatarUrl!),
                                      ),
                                      const SizedBox(width: 10),
                                      Text(
                                          'Phong Ko Long Bong has liked your post!'),
                                    ],
                                  ),
                                  IconButton(
                                    onPressed: () {},
                                    icon: Icon(
                                      Icons.remove_circle_outline_sharp,
                                      color: Colors.red,
                                    ),
                                  )
                                ],
                              );
                            },
                          );
                        },
                      ),
                    ],
                  )
                : Container(),
            // const Divider(thickness: 2),

            // Row(
            //   children: [
            //     CircleAvatar(
            //       radius: 20,
            //       backgroundImage: NetworkImage(UserModel.users[3].avatarUrl!),
            //     ),
            //     const SizedBox(width: 10),
            // Column(
            //   crossAxisAlignment: CrossAxisAlignment.start,
            //   children: [
            //     Text(
            //       'A person wants to be your friend!',
            //       style: Theme.of(context)
            //           .textTheme
            //           .bodyText1!
            //           .copyWith(fontWeight: FontWeight.bold),
            //     ),
            //     Text(
            //       '3h ago',
            //       style: Theme.of(context)
            //           .textTheme
            //           .bodyText2!
            //           .copyWith(color: Colors.black54),
            //     ),
            //     Row(
            //       children: [
            //         ElevatedButton(
            //           onPressed: () {},
            //           child: Text('Accept'),
            //           style: ElevatedButton.styleFrom(
            //             elevation: 0,
            //             minimumSize: Size(60, 25),
            //           ),
            //         ),
            //         const SizedBox(width: 10),
            //         ElevatedButton(
            //           onPressed: () {},
            //           child: Text(
            //             'Decline',
            //             style: Theme.of(context).textTheme.bodyText1,
            //           ),
            //           style: ElevatedButton.styleFrom(
            //             primary: Colors.white,
            //             elevation: 0,
            //             minimumSize: Size(60, 25),
            //           ),
            //         ),
            //       ],
            //     )
            //   ],
            // ),
            //   ],
            // ),
          ],
        ),
      ),
    );
  }
}

class CustomFriendRequestRow extends StatelessWidget {
  const CustomFriendRequestRow({
    Key? key,
    required this.friendRequest,
  }) : super(key: key);

  final FriendRequest friendRequest;

  @override
  Widget build(BuildContext context) {
    final userController = Get.put(UserController());
    final notiController = Get.put(NotiController());

    return Row(
      children: [
        CircleAvatar(
          radius: 20,
          foregroundImage: NetworkImage(
              "https://cdn.pixabay.com/photo/2015/10/05/22/37/blank-profile-picture-973460__340.png"),
          // backgroundImage: NetworkImage(
          //     friendRequest.senderId!.avatarUrl!),
        ),
        const SizedBox(width: 10),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              width: 300,
              child: Text(
                '${friendRequest.senderId!.fullname} has sent you a friend request',
                style: Theme.of(context)
                    .textTheme
                    .bodyText1!
                    .copyWith(fontWeight: FontWeight.bold),
              ),
            ),
            Text(
              '${(DateTime.now().hour - friendRequest.createdAt.hour).abs()}h ago',
              style: Theme.of(context)
                  .textTheme
                  .bodyText2!
                  .copyWith(color: Colors.black54),
            ),
            Row(
              children: [
                ElevatedButton(
                  onPressed: () async {
                    await userController.addFriend(context,
                        friendRequest.receiverId!, friendRequest.receiverId!);
                    notiController.friendReqList.remove(friendRequest);
                    await userController.deleteFriendRequest(friendRequest.id!);
                  },
                  child: Text('Accept'),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Theme.of(context).primaryColor,
                    elevation: 0,
                    minimumSize: Size(60, 25),
                  ),
                ),
                const SizedBox(width: 10),
                ElevatedButton(
                  onPressed: () async {
                    notiController.friendReqList.remove(friendRequest);
                    await userController.deleteFriendRequest(friendRequest.id!);
                    notiController.update();
                    // await notiController.getUserNoti();
                  },
                  child: Text(
                    'Decline',
                    style: Theme.of(context).textTheme.bodyText1,
                  ),
                  style: ElevatedButton.styleFrom(
                    primary: Colors.white,
                    elevation: 0,
                    minimumSize: Size(60, 25),
                  ),
                ),
              ],
            ),
          ],
        ),
      ],
    );
  }
}
