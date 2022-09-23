// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';

import 'package:flutter_making_friends_app_2/screens/map/map_screen.dart';
import 'package:flutter_making_friends_app_2/widgets/custom_appbar.dart';

class MeetingScreen extends StatelessWidget {
  static const String routeName = '/meeting';

  static Route route() {
    return MaterialPageRoute(
        builder: (context) => const MeetingScreen(),
        settings: const RouteSettings());
  }

  const MeetingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        elevation: 1,
        child: FaIcon(
          FontAwesomeIcons.plus,
          color: Theme.of(context).scaffoldBackgroundColor,
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: const [
            CustomMeetingCard(
              meetingLocation: 'Tao Đàn Park',
              helder: 'An Nguyen',
            ),
            CustomMeetingCard(
              meetingLocation: 'Tao Đàn Park',
              helder: 'An Nguyen',
            ),
            CustomMeetingCard(
              meetingLocation: 'Tao Đàn Park',
              helder: 'An Nguyen',
            ),
            CustomMeetingCard(
              meetingLocation: 'Tao Đàn Park',
              helder: 'An Nguyen',
            ),
            CustomMeetingCard(
              meetingLocation: 'Tao Đàn Park',
              helder: 'An Nguyen',
            ),
            CustomMeetingCard(
              meetingLocation: 'Tao Đàn Park',
              helder: 'An Nguyen',
            ),
            CustomMeetingCard(
              meetingLocation: 'Tao Đàn Park',
              helder: 'An Nguyen',
            ),
            CustomMeetingCard(
              meetingLocation: 'Tao Đàn Park',
              helder: 'An Nguyen',
            ),
          ],
        ),
      ),
    );
  }
}

class CustomMeetingCard extends StatelessWidget {
  final String meetingLocation;
  final String helder;
  const CustomMeetingCard({
    Key? key,
    required this.meetingLocation,
    required this.helder,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        children: [
          ListTile(
            leading: Icon(
              Icons.location_history,
            ),
            title: Row(
              children: [
                Text(meetingLocation),
                IconButton(
                  iconSize: 18,
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (_) => MapScreen()));
                  },
                  icon: FaIcon(FontAwesomeIcons.mapLocationDot),
                  color: Colors.blue,
                )
              ],
            ),
            subtitle: Text('held by ${helder}'),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Participants: 8',
                  style: Theme.of(context).textTheme.bodyText1,
                ),
                TextButton(
                  onPressed: () {},
                  child: const Text('JOIN NOW!'),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
