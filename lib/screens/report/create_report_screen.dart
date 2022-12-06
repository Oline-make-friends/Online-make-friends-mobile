import 'package:flutter/material.dart';
import 'package:flutter_making_friends_app_2/widgets/custom_text_form_field.dart';
import 'package:get/get.dart';

class CreateReportScreen extends StatelessWidget {
  const CreateReportScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'New report',
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
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Column(
          children: [
            CustomTextFormField(
              labelText: 'Report content',
            ),
            const SizedBox(height: 20),
            TextButton(
              onPressed: () {},
              child: Text(
                'Send',
                style: Theme.of(context).textTheme.headline6,
              ),
            )
          ],
        ),
      ),
    );
  }
}
