import 'package:flutter/material.dart';
import 'package:flutter_making_friends_app_2/widgets/custom_text_form_field.dart';
import 'package:get/get.dart';

class SendEmailScreen extends StatelessWidget {
  const SendEmailScreen({super.key});

  @override
  Widget build(BuildContext context) {
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
            ),
            const SizedBox(height: 15),
            TextButton(
              onPressed: () {},
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
