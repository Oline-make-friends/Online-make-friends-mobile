// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:flutter/material.dart';
import 'package:flutter_making_friends_app_2/screens/news/course_detail_screen.dart';
import 'package:flutter_making_friends_app_2/screens/news/create_course_screen.dart';
import 'package:get/get.dart';

import 'package:flutter_making_friends_app_2/controllers/course_controller.dart';

import '../../widgets/widgets.dart';

class CourseScreen extends StatelessWidget {
  const CourseScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final courseController = Get.put(CourseController());

    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            //! app bar
            Container(
              height: 80,
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
              color: Theme.of(context).primaryColor,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        // mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          // const SizedBox(height: 15),
                          Text(
                            "Courses",
                            style: Theme.of(context)
                                .textTheme
                                .headline2!
                                .copyWith(color: Colors.white),
                          ),
                          Text(
                            "Learn more from community course",
                            style: Theme.of(context).textTheme.bodyText1,
                          ),
                        ],
                      ),
                      InkWell(
                        onTap: () {
                          Get.to(CreateCourseScreen());
                        },
                        child: Container(
                          height: 40,
                          width: 40,
                          decoration: BoxDecoration(
                            border: Border.all(color: Colors.transparent),
                            borderRadius: BorderRadius.circular(30),
                            color: Colors.white,
                          ),
                          child: Icon(
                            Icons.add,
                            color: Theme.of(context).primaryColor,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            //!

            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
              child: Text(
                'Current courses',
                style: Theme.of(context).textTheme.headline4,
              ),
            ),

            //! Course card
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: Obx(
                () {
                  if (courseController.isLoading.value) {
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  } else {
                    return ListView.builder(
                      shrinkWrap: true,
                      itemCount: courseController.courseList.length,
                      itemBuilder: (context, index) {
                        return CourseCard(
                          course: courseController.courseList[index],
                          onTap: () {
                            courseController.score.value = 0;
                            Get.to(CourseDetailScreen(),
                                arguments: courseController.courseList[index]);
                          },
                        );
                      },
                    );
                  }
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
