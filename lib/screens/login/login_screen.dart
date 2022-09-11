import 'package:flutter/material.dart';
import 'package:flutter_making_friends_app_2/widgets/widgets.dart';

class LoginScreen extends StatelessWidget {
  static const String routeName = '/login';

  static Route route() {
    return MaterialPageRoute(
      builder: (context) => const LoginScreen(),
      settings: const RouteSettings(),
    );
  }

  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Login',
          style: Theme.of(context)
              .textTheme
              .headline1!
              .copyWith(fontWeight: FontWeight.w400),
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(
            Icons.close,
            color: Theme.of(context).primaryColor,
          ),
        ),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: 200,
            width: 400,
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/friends2.png'),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              children: [
                TextFormField(),
                TextFormField(),
                const SizedBox(height: 20),
                SizedBox(
                  width: double.infinity,
                  child: IntrinsicWidth(
                    child: CustomButton(
                        onTap: () async {
                          await Future.delayed(const Duration(seconds: 3));
                          Center(
                            child: CircularProgressIndicator(),
                          );
                          Navigator.pushNamed(context, '/home');
                        },
                        title: 'Login Now',
                        buttonColor: Theme.of(context).primaryColor),
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
