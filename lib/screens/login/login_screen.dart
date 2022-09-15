import 'package:flutter/material.dart';
import 'package:flutter_making_friends_app_2/controllers/controllers.dart';
import 'package:flutter_making_friends_app_2/models/account_model.dart';
import 'package:flutter_making_friends_app_2/widgets/widgets.dart';
import 'package:get/get.dart';

class LoginScreen extends StatelessWidget {
  static const String routeName = '/login';

  static Route route() {
    return MaterialPageRoute(
      builder: (context) => LoginScreen(),
      settings: const RouteSettings(),
    );
  }

  var loginController = Get.put(LoginController());

  LoginScreen({Key? key}) : super(key: key);

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
        elevation: 0,
        backgroundColor: Colors.transparent,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(
            Icons.arrow_back_ios_rounded,
            color: Theme.of(context).primaryColor,
          ),
        ),
      ),
      body: Container(
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20),
            topRight: Radius.circular(20),
          ),
        ),
        height: 700,
        child: SingleChildScrollView(
          child: Column(
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
                child: Form(
                  child: Column(
                    children: [
                      //Username field
                      CustomTextFormField(
                        controller: loginController.usernameController,
                        validator: (valid) {
                          if (valid == null || valid.isEmpty) {
                            return 'Username or email required';
                          }
                        },
                        hintTxt: 'Username or email',
                      ),
                      const SizedBox(
                        height: 20,
                      ),

                      //Password Field
                      CustomTextFormField(
                        controller: loginController.passwordController,
                        validator: (valid) {
                          if (valid == null ||
                              valid.isEmpty ||
                              valid.length < 6) {
                            return "Password can't be blank or less than 6 charaters";
                          }
                        },
                        hintTxt: 'Password',
                      ),
                      const SizedBox(height: 10),

                      const SizedBox(height: 20),
                      SizedBox(
                        width: double.infinity,
                        child: IntrinsicWidth(
                          child: CustomButton(
                              onTap: () {
                                loginController.login();

                                // Navigator.pushNamed(context, '/home');
                              },
                              title: 'Login Now',
                              buttonColor: Theme.of(context).primaryColor),
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Center(
                        child: Text(
                          'Or',
                          style: Theme.of(context).textTheme.bodyLarge,
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      SizedBox(
                        width: double.infinity,
                        child: IntrinsicWidth(
                          child: CustomButton(
                              onTap: () {
                                Navigator.of(context).pushNamed('/register');
                              },
                              title: 'Join us now !',
                              buttonColor: Colors.white54,
                              textColor: const Color(0xFF116ddd)),
                        ),
                      ),
                      // hasError ? Text('data') : Text(''),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
