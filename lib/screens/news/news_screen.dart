// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:flutter/material.dart';

import 'package:flutter_making_friends_app_2/screens/news/course_screen.dart';
import 'package:flutter_making_friends_app_2/screens/news/post_screen.dart';
import 'package:flutter_making_friends_app_2/screens/report/report_screen.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';

import 'package:flutter_making_friends_app_2/widgets/custom_appbar.dart';
import '../../widgets/widgets.dart';

class NewsFeedScreen extends StatefulWidget {
  static const String routeName = '/news';

  static Route route() {
    return MaterialPageRoute(
        builder: (context) => const NewsFeedScreen(),
        settings: const RouteSettings());
  }

  const NewsFeedScreen({super.key});

  @override
  State<NewsFeedScreen> createState() => _NewsFeedScreenState();
}

class _NewsFeedScreenState extends State<NewsFeedScreen> {
  int currentPage = 1;
  @override
  Widget build(BuildContext context) {
    GlobalKey<ScaffoldState>? _key = GlobalKey();

    return Scaffold(
      key: _key,
      appBar: CustomAppBar(
        leading: IconButton(
          onPressed: () {
            _key.currentState!.openDrawer();
          },
          icon: Icon(
            Icons.menu_rounded,
            color: Theme.of(context).primaryColor,
          ),
        ),
      ),
      body: _buidWidget(),
      drawer: Container(
        // height: 500,
        width: 150,
        child: Drawer(
          backgroundColor: Theme.of(context).scaffoldBackgroundColor,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              ListView(
                shrinkWrap: true,
                // Important: Remove any padding from the ListView.
                padding: const EdgeInsets.symmetric(vertical: 30),
                children: [
                  // const DrawerHeader(
                  //   child: Text('Drawer Header'),
                  // ),
                  ListTile(
                    title: Text(
                      'Posts',
                      style: Theme.of(context).textTheme.bodyText1,
                    ),
                    leading: Icon(
                      Icons.newspaper,
                      color: Theme.of(context).primaryColor,
                    ),
                    onTap: () {
                      Navigator.pop(context);
                      setState(() {
                        currentPage = 1;
                      });
                      print(currentPage);
                      // Navigator.pop(context);
                    },
                  ),
                  ListTile(
                    title: Text(
                      'Courses',
                      style: Theme.of(context).textTheme.bodyText1,
                    ),
                    leading: FaIcon(
                      FontAwesomeIcons.graduationCap,
                      color: Theme.of(context).primaryColor,
                    ),
                    onTap: () {
                      Navigator.pop(context);
                      setState(() {
                        currentPage = 2;
                      });
                      print(currentPage);
                      // Navigator.pop(context);
                    },
                  ),
                ],
              ),
              ListTile(
                title: Text(
                  'Report',
                  style: Theme.of(context).textTheme.bodyText1,
                ),
                leading: FaIcon(
                  FontAwesomeIcons.bug,
                  color: Theme.of(context).primaryColor,
                ),
                onTap: () {
                  Navigator.pop(context);
                  Get.to(ReportScreen());
                  // Navigator.pop(context);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buidWidget() {
    if (currentPage == 1) {
      return PostScreen();
    } else if (currentPage == 2) {
      return CourseScreen();
    } else {
      return const Center(
        child: Text("Error route!"),
      );
    }
  }
}
