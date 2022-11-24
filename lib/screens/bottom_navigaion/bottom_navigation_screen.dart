import 'package:flutter/material.dart';

import 'package:flutter_making_friends_app_2/screens/screens.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class BottomNavScreen extends StatefulWidget {
  static const String routeName = '/bottomNav';

  static Route route() {
    return MaterialPageRoute(
        builder: (context) => const BottomNavScreen(),
        settings: const RouteSettings());
  }

  const BottomNavScreen({super.key});

  @override
  State<BottomNavScreen> createState() => _BottomNavScreenState();
}

class _BottomNavScreenState extends State<BottomNavScreen> {
  int _selectedIndex = 0;

  static const List<Widget> _widgetOptions = <Widget>[
    // TabBarScreen(),
    NewsFeedScreen(),
    FindFriendScreen(),
    GroupsScreen(),
    // MeetingScreen(),
    EventScreen(),
    // ProfileScreen(),
    NewProfileScreen(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: SizedBox(
        height: 52,
        child: BottomNavigationBar(
          elevation: 0,
          items: <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: 'Home',
              backgroundColor: Theme.of(context).scaffoldBackgroundColor,
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.search),
              label: 'Find Friend',
              backgroundColor: Theme.of(context).scaffoldBackgroundColor,
            ),
            BottomNavigationBarItem(
              icon: FaIcon(FontAwesomeIcons.peopleGroup),
              label: 'Group',
              backgroundColor: Theme.of(context).scaffoldBackgroundColor,
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.meeting_room_outlined),
              label: 'Meeting',
              backgroundColor: Theme.of(context).scaffoldBackgroundColor,
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.person),
              label: 'Profile',
              backgroundColor: Theme.of(context).scaffoldBackgroundColor,
            ),
          ],
          currentIndex: _selectedIndex,
          unselectedItemColor: Colors.grey,
          selectedItemColor: Theme.of(context).primaryColor,
          onTap: _onItemTapped,
        ),
      ),
    );
  }
}
