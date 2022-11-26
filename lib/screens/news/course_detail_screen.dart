import 'package:flutter/material.dart';
import 'package:flutter_making_friends_app_2/controllers/course_controller.dart';
import 'package:flutter_making_friends_app_2/models/models.dart';
import 'package:flutter_making_friends_app_2/screens/news/quiz_screen.dart';
import 'package:get/get.dart';

class CourseDetailScreen extends StatelessWidget {
  const CourseDetailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Course currentCourse = Get.arguments;
    List<Quiz> quizs = currentCourse.quizs!;
    final courseController = Get.put(CourseController());

    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        centerTitle: true,
        title: Text(
          currentCourse.name!,
          style: Theme.of(context).textTheme.headline4,
        ),
        leading: IconButton(
          onPressed: () {
            Get.back();
          },
          icon: Icon(
            Icons.arrow_back_rounded,
            color: Theme.of(context).primaryColor,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      CircleAvatar(
                        backgroundImage:
                            NetworkImage(currentCourse.createdBy!.avatarUrl!),
                      ),
                      const SizedBox(width: 5),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Created by',
                            style: Theme.of(context).textTheme.bodyText2,
                          ),
                          Text(
                            currentCourse.createdBy!.fullname!,
                            style: Theme.of(context)
                                .textTheme
                                .bodyText2!
                                .copyWith(fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                    ],
                  ),
                  quizs.isNotEmpty
                      ? Row(
                          children: [
                            Obx(
                              () {
                                return Text(
                                    "Your score: ${courseController.score} / ${quizs.length}");
                              },
                            ),
                            const SizedBox(width: 5),
                            ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                elevation: 0,
                                backgroundColor: Theme.of(context).primaryColor,
                              ),
                              onPressed: () {
                                courseController.score.value = 0;
                                Get.to(QuizScreen(), arguments: currentCourse);
                              },
                              child: Text('Learn'),
                            ),
                          ],
                        )
                      : Container(),
                ],
              ),
              const SizedBox(height: 10),
              Text(
                currentCourse.description!,
                style: Theme.of(context).textTheme.bodyText1!,
              ),
              const SizedBox(height: 10),

              //! questions
              quizs.isNotEmpty
                  ? ListView.builder(
                      physics: const NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      itemCount: quizs.length,
                      itemBuilder: (context, index) {
                        return Card(
                          child: Container(
                            padding: const EdgeInsets.all(10),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Expanded(
                                  flex: 1,
                                  child: Container(
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                    child: Text(quizs[index].question!),
                                  ),
                                ),
                                const SizedBox(width: 10),
                                Expanded(
                                  flex: 2,
                                  child: Container(
                                    height: 100,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                    child: Text(quizs[index].answer!),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                    )
                  : const Center(
                      child: Text("There's no quiz in this course"),
                    ),
            ],
          ),
        ),
      ),
    );
  }
}
