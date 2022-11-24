// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

import '../../controllers/controllers.dart';
import '../../models/models.dart';
import '../../widgets/widgets.dart';
import '../screens.dart';

class EventSearchScreen extends StatelessWidget {
  const EventSearchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final eventController = Get.put(EventController());
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Container(
          decoration: BoxDecoration(
            border: Border.all(color: Colors.grey),
            borderRadius: BorderRadius.circular(20),
          ),
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
                },
                icon: Icon(
                  Icons.search,
                  color: Theme.of(context).primaryColor,
                ),
              ),
            ),
          ),
        ),
        leading: IconButton(
          onPressed: () {
            eventController.searchList.clear();
            Get.back();
          },
          icon: Icon(
            Icons.arrow_back,
            color: Theme.of(context).primaryColor,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
        child: Obx(() {
          return ListView.builder(
            itemCount: eventController.searchList.length,
            itemBuilder: (context, index) {
              return EventSearchContainer(
                searchEvent: eventController.searchList[index],
              );
            },
          );
        }),
      ),
    );
  }
}

class EventSearchContainer extends StatelessWidget {
  final Event searchEvent;
  EventSearchContainer({
    Key? key,
    required this.searchEvent,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Get.to(EventDetailSCreen(), arguments: searchEvent);
      },
      child: Column(
        children: [
          Container(
            padding: const EdgeInsets.only(left: 10),
            decoration: BoxDecoration(
              color: Colors.white,
              border: Border.all(color: Colors.transparent),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  searchEvent.title!,
                  style: Theme.of(context).textTheme.headline6,
                ),
                Row(
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Text(
                          "${searchEvent.updatedAt.hour}:${searchEvent.updatedAt.minute}",
                          maxLines: 1,
                        ),
                        const SizedBox(
                          height: 3,
                        ),
                        Text(
                            "${searchEvent.updatedAt.day}-${DateFormat('MMM').format(searchEvent.updatedAt)}"),
                      ],
                    ),
                    IconButton(
                      onPressed: () {},
                      icon: Icon(
                        Icons.arrow_circle_right_outlined,
                        color: Theme.of(context).primaryColor,
                      ),
                    )
                  ],
                )
              ],
            ),
          ),
          const SizedBox(height: 10),
        ],
      ),
    );
  }
}
