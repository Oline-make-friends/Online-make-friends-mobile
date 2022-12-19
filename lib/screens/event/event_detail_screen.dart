import 'package:flutter/material.dart';
import 'package:flutter_making_friends_app_2/controllers/controllers.dart';
import 'package:flutter_making_friends_app_2/models/models.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class EventDetailSCreen extends StatelessWidget {
  const EventDetailSCreen({super.key});

  @override
  Widget build(BuildContext context) {
    Event currentEvent = Get.arguments;
    final loginController = Get.put(LoginController());
    final eventController = Get.put(EventController());
    // print(currentEvent.toString());
    bool? isJoined;
    for (UserModel u in currentEvent.userJoined!) {
      if (loginController.loginedUser.value.id == u.id) {
        isJoined = true;
      } else {
        isJoined = false;
      }
    }
    print(isJoined);
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: [
          const Positioned.fill(
            child: Image(
              image: NetworkImage(
                  'https://images.unsplash.com/photo-1593443821262-5625fcd78f49?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1170&q=80'),
              fit: BoxFit.cover,
            ),
          ),
          SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 20),
                IconButton(
                  onPressed: () {
                    Get.back();
                  },
                  icon: Icon(
                    Icons.arrow_back,
                    color: Colors.white,
                  ),
                ),
                const SizedBox(height: 100),
                Padding(
                  padding: const EdgeInsets.all(20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        currentEvent.title!,
                        style: Theme.of(context)
                            .textTheme
                            .headline1!
                            .copyWith(fontSize: 40, color: Colors.white),
                      ),
                      const SizedBox(height: 20),
                      Text(
                        currentEvent.description!,
                        style: Theme.of(context)
                            .textTheme
                            .bodyText1!
                            .copyWith(color: Colors.white, fontSize: 20),
                      ),
                      const SizedBox(height: 20),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            currentEvent.type!,
                            style: Theme.of(context)
                                .textTheme
                                .bodyText1!
                                .copyWith(color: Colors.white, fontSize: 20),
                          ),
                          Row(
                            children: [
                              Text(
                                "${currentEvent.updatedAt.day} ${DateFormat.MMM().format(currentEvent.updatedAt)}",
                                style: Theme.of(context)
                                    .textTheme
                                    .bodyText1!
                                    .copyWith(
                                        color: Colors.white, fontSize: 20),
                              ),
                              const SizedBox(width: 5),
                              Text(
                                DateFormat.Hm().format(currentEvent.updatedAt),
                                style: Theme.of(context)
                                    .textTheme
                                    .bodyText1!
                                    .copyWith(
                                        color: Colors.white, fontSize: 20),
                              ),
                            ],
                          ),
                        ],
                      ),
                      const SizedBox(height: 20),
                      Card(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(5.0),
                          child: Column(
                            children: [
                              Container(
                                height: 200,
                                decoration: BoxDecoration(
                                  image: DecorationImage(
                                      image: NetworkImage(
                                          "https://hcmuni.fpt.edu.vn/Data/Sites/1/media/2020-kim-vi/seo/campus/1-truong-dai-hoc-fpt-tphcm/truong-dai-hoc-fpt-tp-hcm-(1).jpg"),
                                      fit: BoxFit.cover),
                                ),
                              ),
                              const SizedBox(height: 10),
                              Text(
                                'FPT University, Ho Chi Minh city',
                                style: Theme.of(context)
                                    .textTheme
                                    .bodyText1!
                                    .copyWith(fontWeight: FontWeight.bold),
                              )
                            ],
                          ),
                        ),
                      ),
                      const SizedBox(height: 20),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          FaIcon(
                            FontAwesomeIcons.faceLaugh,
                            color: Colors.white,
                          ),
                          const SizedBox(width: 5),
                          Text(
                            '${currentEvent.userJoined!.length} participants',
                            style: Theme.of(context)
                                .textTheme
                                .headline6!
                                .copyWith(color: Colors.white),
                          ),
                        ],
                      ),
                      const SizedBox(height: 20),
                      isJoined ?? false
                          //! leave event
                          ? InkWell(
                              onTap: () async {
                                print('tap to leave');
                                await eventController.leaveEvent(
                                    eventId: currentEvent.id!);
                                Navigator.of(context).pop();
                                await eventController.fetchEvent();
                                // Get.back();
                              },
                              child: Container(
                                height: 70,
                                decoration: BoxDecoration(
                                  color: Theme.of(context).primaryColor,
                                  borderRadius: BorderRadius.circular(15),
                                ),
                                child: Center(
                                  child: Text(
                                    'You have joined this event',
                                    style: Theme.of(context)
                                        .textTheme
                                        .headline4!
                                        .copyWith(color: Colors.white),
                                  ),
                                ),
                              ),
                            )
                          //!Join event
                          : InkWell(
                              onTap: () async {
                                print('tap to join');
                                await eventController.joinEvent(
                                    eventId: currentEvent.id!);
                                Navigator.of(context).pop();
                                await eventController.fetchEvent();
                              },
                              child: Container(
                                height: 70,
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(15),
                                ),
                                child: Center(
                                  child: Text(
                                    'Join now',
                                    style:
                                        Theme.of(context).textTheme.headline4,
                                  ),
                                ),
                              ),
                            ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
