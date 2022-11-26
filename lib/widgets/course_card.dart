import 'dart:math';

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../models/models.dart';

class CourseCard extends StatelessWidget {
  CourseCard({
    Key? key,
    required this.course,
    this.onTap,
  }) : super(key: key);

  final Course course;
  void Function()? onTap;

  Random rand = Random();
  List<IconData> iconList = [
    FontAwesomeIcons.w,
    FontAwesomeIcons.graduationCap,
    FontAwesomeIcons.paperclip,
    FontAwesomeIcons.music,
    FontAwesomeIcons.candyCane,
    FontAwesomeIcons.android,
    FontAwesomeIcons.adn,
    FontAwesomeIcons.gamepad,
  ];

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Card(
        elevation: 0,
        color: Colors.white,
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Container(
                    height: 60,
                    width: 60,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      color: Color((rand.nextDouble() * 0xFFFFFF).toInt())
                          .withOpacity(0.1),
                    ),
                    child: Icon(
                      iconList[rand.nextInt(iconList.length)],
                      color: Color((rand.nextDouble() * 0xFFFFFF).toInt())
                          .withOpacity(0.5),
                    ),
                  ),
                  const SizedBox(width: 10),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        course.name!,
                        style: Theme.of(context)
                            .textTheme
                            .headline5!
                            .copyWith(color: Colors.black),
                      ),
                      Row(
                        children: [
                          Text(
                            "${course.quizs!.length}",
                            style: Theme.of(context)
                                .textTheme
                                .bodyText1!
                                .copyWith(color: Colors.black),
                          ),
                          const SizedBox(width: 5),
                          Text(
                            'Quizzes',
                            style: Theme.of(context)
                                .textTheme
                                .bodyText1!
                                .copyWith(color: Colors.black),
                          ),
                        ],
                      ),
                    ],
                  )
                ],
              ),
              Icon(
                Icons.arrow_circle_right_rounded,
                color: Theme.of(context).primaryColor,
              )
            ],
          ),
        ),
      ),
    );
  }
}
