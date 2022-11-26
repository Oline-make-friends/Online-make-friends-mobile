// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_making_friends_app_2/controllers/course_controller.dart';
import 'package:get/get.dart';

import 'package:flutter_making_friends_app_2/models/models.dart';

class QuizScreen extends StatelessWidget {
  const QuizScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Course currentCourse = Get.arguments;
    List<Quiz> quizs = currentCourse.quizs!;

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.transparent,
        elevation: 0,
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
      body: QuestionBody(
        quizs: quizs,
      ),
    );
  }
}

class QuestionBody extends StatefulWidget {
  const QuestionBody({
    Key? key,
    required this.quizs,
  }) : super(key: key);

  final List<Quiz> quizs;

  @override
  State<QuestionBody> createState() => _QuestionBodyState();
}

class _QuestionBodyState extends State<QuestionBody> {
  int currentQuiz = 0;
  bool hasAnswer = false;
  int isCorrect = 0;
  String userAnswer = "";

  final courseController = Get.put(CourseController());
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Question ${currentQuiz + 1}/${widget.quizs.length}',
            style: Theme.of(context)
                .textTheme
                .headline6!
                .copyWith(color: Colors.teal),
          ),
          const SizedBox(height: 5),
          Text(
            widget.quizs[currentQuiz].question!,
            style: Theme.of(context)
                .textTheme
                .headline6!
                .copyWith(color: Colors.black),
          ),
          const SizedBox(height: 10),
          ListView.builder(
            shrinkWrap: true,
            itemCount: widget.quizs[currentQuiz].options!.length,
            itemBuilder: (context, index) {
              return InkWell(
                onTap: () {
                  setState(() {
                    if (currentQuiz < widget.quizs.length - 1) {
                      userAnswer = widget.quizs[currentQuiz].options![index];
                      if (widget.quizs[currentQuiz].answer!.contains(
                          userAnswer =
                              widget.quizs[currentQuiz].options![index])) {
                        isCorrect++;
                      }
                      currentQuiz++;
                    } else {
                      if (widget.quizs[currentQuiz].answer!.contains(
                          userAnswer =
                              widget.quizs[currentQuiz].options![index])) {
                        isCorrect++;
                      }
                      courseController.score.value = isCorrect;
                      Get.back();
                    }
                  });
                },
                child: Card(
                  child: Container(
                    margin: const EdgeInsets.all(8),
                    child: Text(
                      widget.quizs[currentQuiz].options![index],
                      style: Theme.of(context).textTheme.bodyText1,
                    ),
                  ),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
