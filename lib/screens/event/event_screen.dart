// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_making_friends_app_2/controllers/event_controller.dart';
import 'package:flutter_making_friends_app_2/screens/event/create_event_screen.dart';
import 'package:flutter_making_friends_app_2/screens/event/event_detail_screen.dart';
import 'package:flutter_making_friends_app_2/screens/event/event_search_screen.dart.dart';

import 'package:flutter_making_friends_app_2/widgets/widgets.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class EventScreen extends StatelessWidget {
  const EventScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final eventController = Get.put(EventController());
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Get.to(CreateEventScreen());
        },
        backgroundColor: Theme.of(context).primaryColor,
        child: const Icon(
          Icons.add,
        ),
      ),
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
                        "${DateFormat.yMMMd().format(DateTime.now())}",
                        style: Theme.of(context).textTheme.headline3,
                      ),
                      Text(
                        'Ho Chi Minh city, Vietnam',
                        style: Theme.of(context).textTheme.bodyText1,
                      ),
                    ],
                  ),
                  // Card(
                  //   elevation: 0,
                  //   shape: RoundedRectangleBorder(
                  //       borderRadius: BorderRadius.circular(15)),
                  //   child: Container(
                  //     margin: const EdgeInsets.all(7),
                  //     padding: const EdgeInsets.all(8),
                  //     height: 70,
                  //     width: 70,
                  //     decoration: BoxDecoration(
                  //       borderRadius: BorderRadius.circular(15),
                  //       image: DecorationImage(
                  //         image: NetworkImage(
                  //             'https://i.insider.com/5c954296dc67671dc8346930?width=1136&format=jpeg'),
                  //         fit: BoxFit.cover,
                  //       ),
                  //     ),
                  //   ),
                  // ),
                  TextButton(
                    onPressed: () {
                      eventController.getExpiredEvent();
                    },
                    child: Text(
                      "test",
                      style: Theme.of(context).textTheme.headline6,
                    ),
                  )
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
                  controller: eventController.searchController,
                  textAlign: TextAlign.center,
                  decoration: InputDecoration(
                    contentPadding: const EdgeInsets.only(top: 20),
                    hintText: 'Search event...',
                    border: InputBorder.none,
                    suffixIcon: IconButton(
                      onPressed: () {
                        eventController.searchEvent();
                        Get.to(EventSearchScreen());
                      },
                      icon: Icon(
                        Icons.search,
                        color: Theme.of(context).primaryColor,
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 20),
              Text(
                'Joined Event',
                style: Theme.of(context).textTheme.headline4,
              ),
              const SizedBox(height: 10),

              //! event container
              Obx(
                () {
                  if (eventController.isLoading.value) {
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  } else {
                    return ListView.builder(
                      physics: const NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      itemCount: eventController.joinedEventList.length,
                      itemBuilder: (context, index) {
                        return EventContainer(
                          dateTime:
                              eventController.joinedEventList[index].dateTime ??
                                  "Sun Jan 15",
                          coverImg:
                              'https://images.unsplash.com/photo-1593443821262-5625fcd78f49?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1170&q=80',
                          category:
                              eventController.joinedEventList[index].type!,
                          startDate:
                              eventController.joinedEventList[index].updatedAt,
                          eventName:
                              eventController.joinedEventList[index].title!,
                          ontap: () {
                            Get.to(EventDetailSCreen(),
                                arguments:
                                    eventController.joinedEventList[index]);
                          },
                        );
                      },
                    );
                  }
                },
              ),
              const SizedBox(height: 20),
              //! popular event
              Text(
                'Popular Event',
                style: Theme.of(context).textTheme.headline4,
              ),
              const SizedBox(height: 10),

              //! event container
              Obx(
                () {
                  if (eventController.isLoading.value) {
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  } else {
                    return ListView.builder(
                      physics: const NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      itemCount: eventController.onGoingEvents.length,
                      itemBuilder: (context, index) {
                        return EventContainer(
                          dateTime:
                              eventController.onGoingEvents[index].dateTime ??
                                  "Sun Jan 15",
                          coverImg:
                              'https://images.unsplash.com/photo-1593443821262-5625fcd78f49?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1170&q=80',
                          category: eventController.onGoingEvents[index].type!,
                          startDate:
                              eventController.onGoingEvents[index].updatedAt,
                          eventName:
                              eventController.onGoingEvents[index].title!,
                          ontap: () {
                            Get.to(EventDetailSCreen(),
                                arguments:
                                    eventController.onGoingEvents[index]);
                          },
                        );
                      },
                    );
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
