import 'package:flutter/material.dart';
import 'package:flutter_making_friends_app_2/models/user_match_model.dart';
import 'package:flutter_making_friends_app_2/screens/screens.dart';

import '../models/user_model.dart';

class AppRouter {
  static Route onGenerateRoute(RouteSettings settings) {
    print('current page: ${settings.name}');

    switch (settings.name) {
      case FindFriendScreen.routeName:
        return FindFriendScreen.route();
      case SplashScreen.routeName:
        return SplashScreen.route();
      case LoginScreen.routeName:
        return LoginScreen.route();
      case RegisterScreen.routeName:
        return RegisterScreen.route();
      case ChatScreen.routeName:
        return ChatScreen.route(userMatch: settings.arguments as UserMatch);
      case UsersScreen.routeName:
        return UsersScreen.route(user: settings.arguments as User);
      case FriendsScreen.routeName:
        return FriendsScreen.route();
      case NotificationScreen.routeName:
        return NotificationScreen.route();
      case NewsFeedScreen.routeName:
        return NewsFeedScreen.route();
      case BottomNavScreen.routeName:
        return BottomNavScreen.route();
      case TestScreen.routeName:
        return TestScreen.route();
      case UserPostsScreen.routeName:
        return UserPostsScreen.route();
      default:
        return _errorRoute();
    }
  }

  static Route _errorRoute() {
    return MaterialPageRoute(
      builder: (_) => Scaffold(
        appBar: AppBar(
          title: const Text('Error'),
        ),
      ),
      settings: const RouteSettings(name: '/error'),
    );
  }
}
