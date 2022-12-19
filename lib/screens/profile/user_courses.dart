import 'package:flutter/material.dart';
import 'package:flutter_making_friends_app_2/controllers/controllers.dart';
import 'package:flutter_making_friends_app_2/screens/profile/edit/course_edit_screen.dart';
import 'package:get/get.dart';

class UserCourseScreen extends StatelessWidget {
  const UserCourseScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final courseController = Get.put(CourseController());
    return Scaffold(
      body: courseController.userCourseList.isNotEmpty
          ? Padding(
              padding: const EdgeInsets.symmetric(horizontal: 5),
              child: ListView.builder(
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemCount: courseController.userCourseList.length,
                itemBuilder: (context, index) {
                  return Card(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 10, vertical: 10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(courseController.userCourseList[index].name!),
                          IconButton(
                            onPressed: () {
                              Get.to(CourseEditScreen(),
                                  arguments:
                                      courseController.userCourseList[index]);
                            },
                            icon: Icon(
                              Icons.edit,
                              color: Theme.of(context).primaryColor,
                            ),
                          )
                        ],
                      ),
                    ),
                  );
                },
              ),
            )
          : Align(
              alignment: Alignment.topCenter,
              child: Text(
                ".",
                style: Theme.of(context).textTheme.headline5,
              ),
            ),
    );
  }
}
