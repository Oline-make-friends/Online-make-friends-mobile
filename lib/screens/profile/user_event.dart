import 'package:flutter/material.dart';
import 'package:flutter_making_friends_app_2/controllers/controllers.dart';
import 'package:flutter_making_friends_app_2/models/event_model.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class UserEventScreen extends StatelessWidget {
  const UserEventScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final eventController = Get.put(EventController());
    List<Event> eventCreated = eventController.eventCreated;
    return Scaffold(
      body: eventController.eventCreated.isEmpty
          ? Align(
              alignment: Alignment.topCenter,
              child: Text(
                ".",
                style: Theme.of(context).textTheme.headline5,
              ),
            )
          : ListView.builder(
              physics: const NeverScrollableScrollPhysics(),
              itemCount: eventCreated.length,
              itemBuilder: ((context, index) {
                return Card(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 10, vertical: 10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              eventCreated[index].title!,
                              style: Theme.of(context).textTheme.headline6,
                            ),
                            Text(
                              "${eventCreated[index].updatedAt.day}-${eventCreated[index].updatedAt.month}-${eventCreated[index].updatedAt.year} ${DateFormat.Hm().format(eventCreated[index].updatedAt)}",
                              style: Theme.of(context).textTheme.bodyText1,
                            ),
                          ],
                        ),
                        IconButton(
                          onPressed: () {},
                          icon: Icon(Icons.edit),
                        )
                      ],
                    ),
                  ),
                );
              }),
            ),
    );
  }
}
