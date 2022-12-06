import 'package:flutter/material.dart';
import 'package:flutter_making_friends_app_2/controllers/controllers.dart';
import 'package:flutter_making_friends_app_2/models/account_model.dart';
import 'package:flutter_making_friends_app_2/screens/register/former_register_screen.dart';
import 'package:flutter_making_friends_app_2/screens/reset_password/send_email_screen.dart';
import 'package:flutter_making_friends_app_2/screens/test_screen/test.dart';
import 'package:flutter_making_friends_app_2/widgets/widgets.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
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
    bool isHidden = true;
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
        // actions: [
        //   IconButton(
        //       onPressed: () {
        //         Get.to(TestScreen());
        //       },
        //       icon: Icon(Icons.warning_amber)),
        // ],
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
                  key: loginController.loginFormKey,
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  child: Column(
                    children: [
                      //!Username field
                      CustomTextFormField(
                        prefixicon: const Icon(Icons.email),
                        controller: loginController.usernameController,
                        onSaved: (value) {
                          loginController.username = value!;
                        },
                        validator: (value) {
                          return loginController.validateUsername(value!);
                        },
                        hintTxt: 'Username or email',
                      ),
                      const SizedBox(
                        height: 20,
                      ),

                      //!Password Field
                      Obx(
                        () {
                          return CustomTextFormField(
                            prefixicon: const Icon(Icons.lock),
                            controller: loginController.passwordController,
                            onSaved: (value) {
                              loginController.password = value!;
                            },
                            validator: (value) {
                              return loginController.validatePassword(value!);
                            },
                            hintTxt: 'Password',
                            isObscure: loginController.isHidden.value,
                            suffixIcon: IconButton(
                              onPressed: () {
                                loginController.isHidden.value =
                                    !loginController.isHidden.value;
                              },
                              icon: loginController.isHidden.value
                                  ? FaIcon(FontAwesomeIcons.eye)
                                  : FaIcon(FontAwesomeIcons.eyeSlash),
                            ),
                          );
                        },
                      ),
                      //!
                      const SizedBox(height: 10),
                      Obx(() {
                        return Text(
                          loginController.errorString.value,
                          style: Theme.of(context)
                              .textTheme
                              .bodyText1!
                              .copyWith(color: Colors.red),
                        );
                      }),
                      // GetX<LoginController>(builder: (controller) {
                      //   return Text(controller.errorString.value);
                      // }),
                      const SizedBox(height: 10),
                      SizedBox(
                        width: double.infinity,
                        child: IntrinsicWidth(
                          child: CustomButton(
                              onTap: () {
                                loginController.login(context);
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
                                // Navigator.of(context).pushNamed('/register');
                                showDialog(
                                    context: context,
                                    builder: ((context) {
                                      return SimpleDialog(
                                        title: const Text('Register for: '),
                                        children: [
                                          SimpleDialogOption(
                                            onPressed: () {
                                              Navigator.pop(context);
                                              Navigator.of(context)
                                                  .pushNamed('/register');
                                            },
                                            child: Text('FPT student',
                                                style: Theme.of(context)
                                                    .textTheme
                                                    .bodyText1!),
                                          ),
                                          const SizedBox(
                                            height: 10,
                                          ),
                                          SimpleDialogOption(
                                            onPressed: () {
                                              Navigator.pop(context);
                                              Get.to(FormerRegisterScreen());
                                            },
                                            child: Text('Former student',
                                                style: Theme.of(context)
                                                    .textTheme
                                                    .bodyText1!),
                                          ),
                                        ],
                                      );
                                    }));
                              },
                              title: 'Join us now !',
                              buttonColor: Colors.white54,
                              textColor: Theme.of(context).primaryColor),
                        ),
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
      bottomSheet: Container(
        padding: const EdgeInsets.symmetric(vertical: 15),
        decoration:
            BoxDecoration(color: Theme.of(context).scaffoldBackgroundColor),
        height: 50,
        child: Align(
          alignment: Alignment.bottomCenter,
          child: InkWell(
            onTap: () {
              Get.to(SendEmailScreen());
            },
            child: Text(
              'Forgot password?',
              style: Theme.of(context)
                  .textTheme
                  .bodyText1!
                  .copyWith(color: Colors.black54),
            ),
          ),
        ),
      ),
    );
  }
}
