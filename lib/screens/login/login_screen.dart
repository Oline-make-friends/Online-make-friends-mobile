import 'package:flutter/material.dart';
import 'package:flutter_making_friends_app_2/models/account_model.dart';
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
    final _formKey = GlobalKey<FormState>();
    final TextEditingController _usernameController = TextEditingController();
    final TextEditingController _passwordController = TextEditingController();
    bool hasError = false;

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
                  key: _formKey,
                  child: Column(
                    children: [
                      //Username field
                      CustomTextFormField(
                        controller: _usernameController,
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
                        controller: _passwordController,
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
                                final isValid =
                                    _formKey.currentState!.validate();
                                final accounts = Account.accounts;
                                if (isValid) {
                                  for (Account acc in accounts) {
                                    if (acc.username ==
                                            _usernameController.text &&
                                        acc.password ==
                                            _passwordController.text) {
                                      print('login success');
                                      Navigator.pushNamed(context, '/home');
                                    }
                                    if (acc.username !=
                                            _usernameController.text ||
                                        acc.password !=
                                            _passwordController.text) {
                                      print('Login failed');
                                      hasError = true;
                                    }
                                  }
                                }
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
                      hasError ? Text('data') : Text(''),
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
