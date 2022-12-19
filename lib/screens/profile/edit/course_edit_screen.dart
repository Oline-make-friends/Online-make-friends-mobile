// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:expandable/expandable.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:flutter_making_friends_app_2/controllers/update_course_controller.dart';
import 'package:flutter_making_friends_app_2/models/course_model.dart';
import 'package:flutter_making_friends_app_2/models/models.dart';
import 'package:flutter_making_friends_app_2/widgets/custom_text_form_field.dart';

class CourseEditScreen extends StatelessWidget {
  const CourseEditScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Course currentCourse = Get.arguments;
    final updateCourseController = Get.put(UpdateCourseController());
    updateCourseController.quizzes.value = currentCourse.quizs!;
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            onPressed: () {
              Get.back();
            },
            icon: Icon(
              Icons.arrow_back,
              color: Theme.of(context).primaryColor,
            )),
        title: Text(
          currentCourse.name!,
          style: Theme.of(context).textTheme.headline5,
        ),
        elevation: 0,
        backgroundColor: Colors.transparent,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
        child: SingleChildScrollView(
          child: Column(
            children: [
              CustomTextFormField(
                controller: updateCourseController.nameController =
                    TextEditingController(text: currentCourse.name),
                labelText: "Name",
              ),
              const SizedBox(height: 10),
              CustomTextFormField(
                controller: updateCourseController.descController =
                    TextEditingController(text: currentCourse.description),
                labelText: "Description",
              ),
              const SizedBox(height: 10),
              Row(
                children: [
                  Text(
                    "Quizzes",
                    style: Theme.of(context).textTheme.headline6,
                  ),
                  IconButton(
                    onPressed: () {
                      showDialog(
                        context: context,
                        builder: (context) {
                          return Dialog(
                              child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: SizedBox(
                              height: 420,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'Add new quiz',
                                    style: Theme.of(context)
                                        .textTheme
                                        .bodyText1!
                                        .copyWith(
                                          color: Theme.of(context).primaryColor,
                                        ),
                                  ),
                                  CustomTextFormField(
                                    labelText: "Question",
                                  ),
                                  const SizedBox(height: 10),
                                  CustomTextFormField(
                                    labelText: "Option 1",
                                  ),
                                  CustomTextFormField(
                                    labelText: "Option 2",
                                  ),
                                  CustomTextFormField(
                                    labelText: "Option 3",
                                  ),
                                  CustomTextFormField(
                                    labelText: "Option 4",
                                  ),
                                  const SizedBox(height: 10),
                                  CustomTextFormField(
                                    labelText: "Answer",
                                  ),
                                  Align(
                                    alignment: Alignment.bottomRight,
                                    child: TextButton(
                                      onPressed: () {},
                                      child: Text(
                                        'Add',
                                        style: Theme.of(context)
                                            .textTheme
                                            .headline6,
                                      ),
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ));
                        },
                      );
                      // Quiz newQuiz = Quiz();
                      // updateCourseController.quizzes.add(newQuiz);
                    },
                    icon: Icon(Icons.add_circle_outline_sharp),
                  )
                ],
              ),
              Obx(
                () {
                  return ListView.builder(
                    physics: const NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemCount: updateCourseController.quizzes.length,
                    itemBuilder: (context, index) {
                      return CustomExpandableQuiz(
                        questionController:
                            TextEditingController(text: "Question"),
                        answerController: TextEditingController(text: "Answer"),
                        quizzes: updateCourseController.quizzes,
                        quiz: updateCourseController.quizzes[index],
                      );
                    },
                  );
                },
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  TextButton(
                    onPressed: () {},
                    child: Text(
                      'Delete',
                      style: Theme.of(context)
                          .textTheme
                          .headline6!
                          .copyWith(fontSize: 15),
                    ),
                  ),
                  const SizedBox(width: 50),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      elevation: 0,
                      backgroundColor: Theme.of(context).primaryColor,
                    ),
                    onPressed: () {},
                    child: const Text('Update'),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}

class CustomExpandableQuiz extends StatelessWidget {
  TextEditingController questionController;
  TextEditingController? option1Controller;
  TextEditingController? option2Controller;
  TextEditingController? option3Controller;
  TextEditingController? option4Controller;
  TextEditingController answerController;
  List<Quiz> quizzes;
  Quiz quiz;

  CustomExpandableQuiz({
    Key? key,
    required this.questionController,
    this.option1Controller,
    this.option2Controller,
    this.option3Controller,
    this.option4Controller,
    required this.answerController,
    required this.quizzes,
    required this.quiz,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 0,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 5),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            ExpandablePanel(
              header: CustomTextFormField(
                controller: questionController,
              ),
              collapsed: Container(),
              expanded: Column(
                children: [
                  // CustomTextFormField(
                  //   labelText: "Question",
                  // ),
                  const SizedBox(height: 10),
                  CustomTextFormField(
                    controller: option1Controller,
                    labelText: "Option 1",
                  ),
                  CustomTextFormField(
                    controller: option2Controller,
                    labelText: "Option 2",
                  ),
                  CustomTextFormField(
                    controller: option3Controller,
                    labelText: "Option 3",
                  ),
                  CustomTextFormField(
                    controller: option4Controller,
                    labelText: "Option 4",
                  ),
                  const SizedBox(height: 10),
                  CustomTextFormField(
                    controller: answerController,
                    labelText: "Answer",
                  ),
                ],
              ),
            ),
            const SizedBox(height: 10),
            IconButton(
              onPressed: () {
                quizzes.remove(quiz);
              },
              icon: Icon(
                Icons.remove_circle_outline,
                color: Colors.red,
              ),
            )
          ],
        ),
      ),
    );
  }
}
