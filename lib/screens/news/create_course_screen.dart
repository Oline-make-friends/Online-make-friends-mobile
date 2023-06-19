import 'package:flutter/material.dart';
import 'package:flutter_making_friends_app_2/controllers/controllers.dart';
import 'package:flutter_making_friends_app_2/widgets/custom_text_form_field.dart';
import 'package:flutter_making_friends_app_2/widgets/widgets.dart';
import 'package:get/get.dart';

class CreateCourseScreen extends StatelessWidget {
  const CreateCourseScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final courseController = Get.put(CourseController());
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'New course',
          style: Theme.of(context).textTheme.headline4,
        ),
        elevation: 0,
        backgroundColor: Colors.transparent,
        leading: IconButton(
          onPressed: () {
            courseController.nameController = TextEditingController();
            courseController.descController = TextEditingController();
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
              controller: courseController.nameController,
              labelText: 'name',
            ),
            const SizedBox(height: 10),
            CustomTextFormField(
              controller: courseController.descController,
              labelText: 'description',
            ),
            const SizedBox(height: 10),
            const SizedBox(height: 20),
            TextButton(
                onPressed: () async {
                  await courseController.createCourse(context);
                  courseController.nameController = TextEditingController();
                  courseController.descController = TextEditingController();
                  Get.back();
                },
                child: Text('Create',
                    style: Theme.of(context).textTheme.headline5))
          ],
        ),
      ),
    );
  }
}
