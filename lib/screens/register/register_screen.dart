import 'package:flutter/material.dart';

import '../../widgets/widgets.dart';

class RegisterScreen extends StatelessWidget {
  static const String routeName = '/register';

  static Route route() {
    return MaterialPageRoute(
      builder: (context) => const RegisterScreen(),
      settings: const RouteSettings(),
    );
  }

  const RegisterScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Register',
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
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      CustomTextFormField(
                        hintTxt: 'Email',
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      CustomTextFormField(hintTxt: 'Password'),
                      const SizedBox(height: 20),
                      CustomTextFormField(hintTxt: 'Retype Password'),
                      const SizedBox(height: 20),
                      CustomTextFormField(hintTxt: 'Fullname'),
                      const SizedBox(height: 20),
                      CustomTextFormField(hintTxt: 'Age'),
                      const SizedBox(height: 20),
                      SizedBox(
                        width: double.infinity,
                        child: IntrinsicWidth(
                          child: CustomButton(
                              onTap: () {
                                ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(
                                    content: const Text('Account created !'),
                                  ),
                                );
                                Navigator.pop(context);
                              },
                              title: 'Register Now',
                              buttonColor: Theme.of(context).primaryColor),
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
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
