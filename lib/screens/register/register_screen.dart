// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
import 'package:get/get.dart';

import 'package:flutter_making_friends_app_2/controllers/register_controller.dart';

import '../../widgets/widgets.dart';

class RegisterScreen extends StatefulWidget {
  static const String routeName = '/register';

  static Route route() {
    return MaterialPageRoute(
      builder: (context) => const RegisterScreen(),
      settings: const RouteSettings(),
    );
  }

  const RegisterScreen({Key? key}) : super(key: key);

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

var registerController = Get.put(RegisterController());

class _RegisterScreenState extends State<RegisterScreen> {
  String dropValue = 'Male';
  var dobController = TextEditingController();
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
                  child: Form(
                    key: registerController.registerFormKey,
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        //!email textfield
                        CustomTextFormField(
                          hintTxt: 'Email',
                          prefixicon: const Icon(Icons.email),
                          controller: registerController.emailController,
                          onSaved: (value) {
                            registerController.email = value!;
                          },
                          validator: (value) {
                            return registerController.validateUsername(value!);
                          },
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        //!password textfield
                        CustomTextFormField(
                          hintTxt: 'Password',
                          prefixicon: const Icon(Icons.lock),
                          isObscure: true,
                          controller: registerController.passwordController,
                          onSaved: (value) {
                            registerController.password = value!;
                          },
                          validator: (value) {
                            return registerController.validatePassword(value!);
                          },
                        ),
                        const SizedBox(height: 20),
                        //!rePassword textfield
                        CustomTextFormField(
                          hintTxt: 'Retype Password',
                          isObscure: true,
                          controller: registerController.rePasswordController,
                          onSaved: (value) {
                            registerController.rePassword = value!;
                          },
                          validator: (value) {
                            return registerController
                                .validateRePassword(value!);
                          },
                        ),
                        const SizedBox(height: 20),
                        //!Fullname textfield
                        CustomTextFormField(
                          hintTxt: 'Fullname',
                          controller: registerController.fullnameController,
                          onSaved: (value) {
                            registerController.fullname = value!;
                          },
                          validator: (value) {
                            return registerController.validateFullname(value!);
                          },
                        ),
                        // const SizedBox(height: 20),

                        Container(
                          width: double.infinity,
                          child: CustomGenderDropDown(
                            value: registerController.genderValue,
                            onChanged: (value) {
                              setState(() {
                                registerController.genderValue =
                                    value.toString();
                                // print(dropValue);
                              });
                            },
                          ),
                        ),
                        // const SizedBox(height: 20),
                        //!DOB textfield
                        Container(
                          width: double.infinity,
                          child: CustomDoBPicker(
                            controller: registerController.doBController,
                            onConfirm: (date) {
                              print('confirm ${date}');
                              registerController.doBController.text =
                                  '${date.day}-${date.month}-${date.year}';
                            },
                          ),
                        ),
                        const SizedBox(height: 10),
                        Obx(
                          () {
                            return Text(
                              registerController.errorString.value,
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyText1!
                                  .copyWith(color: Colors.red),
                            );
                          },
                        ),
                        const SizedBox(height: 20),
                        SizedBox(
                          width: double.infinity,
                          child: IntrinsicWidth(
                            child: CustomButton(
                                onTap: () {
                                  registerController.register(context);
                                  // ScaffoldMessenger.of(context).showSnackBar(
                                  //   SnackBar(
                                  //     content: const Text('Account created !'),
                                  //   ),
                                  // );
                                  // Navigator.pop(context);
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
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
