import 'package:flutter/material.dart';
import 'package:flutter_making_friends_app_2/widgets/custom_text_form_field.dart';
import 'package:get/get.dart';

class ResetPasswordScreen extends StatelessWidget {
  const ResetPasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: Text(
          'Change password',
          style: Theme.of(context).textTheme.headline4,
        ),
        backgroundColor: Colors.transparent,
        leading: IconButton(
          onPressed: () {
            Get.back();
          },
          icon: Icon(Icons.arrow_back, color: Theme.of(context).primaryColor),
        ),
      ),
      body: Form(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CustomTextFormField(
                labelText: 'Current password',
              ),
              const SizedBox(height: 10),
              CustomTextFormField(
                labelText: 'New password',
              ),
              const SizedBox(height: 10),
              CustomTextFormField(
                labelText: 'Retype password',
              ),
              const SizedBox(height: 10),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Theme.of(context).primaryColor,
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                ),
                onPressed: () {},
                child: const Text('Update password'),
              )
            ],
          ),
        ),
      ),
    );
  }
}
