// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_making_friends_app_2/screens/meeting/meeting_detail_screen.dart';

import 'package:flutter_making_friends_app_2/widgets/widgets.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class NewMeetingScreen extends StatelessWidget {
  const NewMeetingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              //! Date and current location
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Saturday, 22 Oct',
                        style: Theme.of(context).textTheme.headline3,
                      ),
                      Text(
                        'Ho Chi Minh city, Vietnam',
                        style: Theme.of(context).textTheme.bodyText1,
                      ),
                    ],
                  ),
                  Card(
                    elevation: 0,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15)),
                    child: Container(
                      margin: const EdgeInsets.all(7),
                      padding: const EdgeInsets.all(8),
                      height: 70,
                      width: 70,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        image: DecorationImage(
                          image: NetworkImage(
                              'https://i.insider.com/5c954296dc67671dc8346930?width=1136&format=jpeg'),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 25),
              //! search container
              Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    color: Colors.white),
                height: 50,
                width: double.infinity,
                child: TextField(
                  textAlign: TextAlign.center,
                  decoration: InputDecoration(
                    hintText: 'Search event...',
                    border: InputBorder.none,
                  ),
                ),
              ),
              const SizedBox(height: 20),
              //! popular event
              Text(
                'Popular Event',
                style: Theme.of(context).textTheme.headline4,
              ),
              const SizedBox(height: 10),

              //! event container
              EventContainer(
                coverImg:
                    'https://images.unsplash.com/photo-1470229722913-7c0e2dbbafd3?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8Mnx8Y29uY2VydHxlbnwwfHwwfHw%3D&auto=format&fit=crop&w=500&q=60',
                eventName: "Glowing Art Performance",
                category: 'Dance & Art',
              ),
              const SizedBox(height: 10),
              EventContainer(
                coverImg:
                    'https://images.unsplash.com/photo-1627545987039-1a9ab41214d8?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1170&q=80',
                eventName: "A Far From Home Night",
                category: 'Backpacking',
              ),
              const SizedBox(height: 10),
              EventContainer(
                coverImg:
                    'https://images.unsplash.com/photo-1549692520-acc6669e2f0c?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MzZ8fGNvZGV8ZW58MHx8MHx8&auto=format&fit=crop&w=500&q=60',
                eventName: "Hackathon",
                category: 'Programming',
              ),
              const SizedBox(height: 10),
            ],
          ),
        ),
      ),
    );
  }
}

class EventContainer extends StatelessWidget {
  final String coverImg;
  DateTime startDate = DateTime.now();
  final String category;
  final String eventName;

  EventContainer({
    Key? key,
    required this.coverImg,
    required this.category,
    required this.eventName,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final String monthFormat = DateFormat('MMM').format(startDate);
    print(monthFormat);
    return InkWell(
      onTap: () {
        Get.to(MeetingDetailScreen());
      },
      child: Container(
        height: 300,
        width: double.infinity,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(30),
          image:
              DecorationImage(image: NetworkImage(coverImg), fit: BoxFit.cover),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Align(
                alignment: Alignment.topRight,
                child: Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: Container(
                    height: 60,
                    width: 50,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          '${startDate.day}',
                          style: Theme.of(context).textTheme.headline5,
                        ),
                        Text(
                          monthFormat,
                          style: Theme.of(context).textTheme.bodyText1,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Column(
                children: [
                  Text(
                    eventName,
                    style: Theme.of(context)
                        .textTheme
                        .headline4!
                        .copyWith(color: Colors.white),
                  ),
                  const SizedBox(height: 10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Text(
                        category,
                        style: Theme.of(context)
                            .textTheme
                            .bodyText1!
                            .copyWith(color: Colors.white),
                      ),
                      Text(
                        '${startDate.hour}:${startDate.minute}',
                        style: Theme.of(context)
                            .textTheme
                            .bodyText1!
                            .copyWith(color: Colors.white),
                      ),
                    ],
                  ),
                  const SizedBox(height: 10),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
