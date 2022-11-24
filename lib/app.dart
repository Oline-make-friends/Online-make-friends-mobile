import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_making_friends_app_2/config/app_router.dart';
import 'package:flutter_making_friends_app_2/config/theme.dart';
import 'package:flutter_making_friends_app_2/models/user_model.dart';
import 'package:flutter_making_friends_app_2/screens/screens.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'controllers/controllers.dart';

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    final loginController = Get.put(LoginController());
    String? loginUser;
    Future<User?> checkLoginUser() async {
      final prefs = await SharedPreferences.getInstance();
      loginUser = prefs.getString('loginUser');
      return loginController.findLoginUserById(userId: loginUser ?? "blank");
    }

    return GetMaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: theme(),
      onGenerateRoute: AppRouter.onGenerateRoute,
      home: FutureBuilder(
        future: checkLoginUser(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return BottomNavScreen();
          } else if (!snapshot.hasData) {
            return SplashScreen();
          } else {
            return Center(
              child: Text('An error has occured!'),
            );
          }
        },
      ),
    );
  }
}
