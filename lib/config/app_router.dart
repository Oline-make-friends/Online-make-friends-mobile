import 'package:flutter/material.dart';
import 'package:flutter_making_friends_app_2/models/user_match_model.dart';
import 'package:flutter_making_friends_app_2/screens/chat/chat_screen.dart';
import 'package:flutter_making_friends_app_2/screens/screens.dart';

import '../models/user_model.dart';

class AppRouter {
  static Route onGenerateRoute(RouteSettings settings) {
    print('current page: ${settings.name}');

    switch (settings.name) {
      case HomeScreen.routeName:
        return HomeScreen.route();
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
      case MatchesScreen.routeName:
        return MatchesScreen.route();
      case NotificationScreen.routeName:
        return NotificationScreen.route();
      case ProfileScreen.routeName:
        return ProfileScreen.route();
      case NewsFeedScreen.routeName:
        return NewsFeedScreen.route();
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
