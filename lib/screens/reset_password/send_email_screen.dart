import 'package:flutter/material.dart';
import 'package:flutter_making_friends_app_2/controllers/controllers.dart';
import 'package:flutter_making_friends_app_2/widgets/custom_text_form_field.dart';
import 'package:get/get.dart';

class SendEmailScreen extends StatelessWidget {
  const SendEmailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final userController = Get.put(UserController());
    final emailController = TextEditingController();
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Forgot password",
          style: Theme.of(context).textTheme.headline4,
        ),
        elevation: 0,
        backgroundColor: Colors.transparent,
        leading: IconButton(
            onPressed: () {
              Get.back();
            },
            icon: Icon(
              Icons.arrow_back,
              color: Theme.of(context).primaryColor,
            )),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CustomTextFormField(
              labelText: 'Email',
              controller: emailController,
            ),
            const SizedBox(height: 15),
            TextButton(
              onPressed: () {
                if (emailController.text == "") {
                  return;
                }
                userController.sendEmailResetPassword(emailController.text);
              },
              child: Text(
                'Send',
                style: Theme.of(context).textTheme.headline4,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
