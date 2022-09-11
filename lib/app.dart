import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_making_friends_app_2/blocs/swipe/swipe_bloc.dart';
import 'package:flutter_making_friends_app_2/config/app_router.dart';
import 'package:flutter_making_friends_app_2/config/theme.dart';
import 'package:flutter_making_friends_app_2/models/user_model.dart';

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (_) => SwipeBloc()..add(LoadUser(users: User.users)),
        )
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        debugShowCheckedModeBanner: false,
        theme: theme(),
        onGenerateRoute: AppRouter.onGenerateRoute,
        initialRoute: '/profile',
      ),
    );
  }
}
