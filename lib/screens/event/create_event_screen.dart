import 'package:flutter/material.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
import 'package:flutter_making_friends_app_2/widgets/custom_text_form_field.dart';
import 'package:flutter_making_friends_app_2/widgets/widgets.dart';
import 'package:get/get.dart';

class CreateEventScreen extends StatelessWidget {
  const CreateEventScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final dobController = TextEditingController();
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'New event',
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
              labelText: 'title',
            ),
            const SizedBox(height: 10),
            CustomTextFormField(
              labelText: 'type',
            ),
            const SizedBox(height: 10),
            CustomTextFormField(
              labelText: 'description',
            ),
            const SizedBox(height: 10),
            Container(
              width: double.infinity,
              child: CustomTextFormField(
                enable: false,
                labelText: 'Start date',
                controller: dobController,
                suffixIcon: IconButton(
                    onPressed: () {
                      DatePicker.showDatePicker(
                        context,
                        showTitleActions: true,
                        minTime: DateTime(1940, 1, 1),
                        maxTime: DateTime(2100, 1, 1),
                        currentTime: DateTime.now(),
                        onChanged: (date) {
                          print('change $date');
                        },
                        onConfirm: (date) {},
                      );
                    },
                    icon: const Icon(Icons.date_range)),
              ),
            ),
            const SizedBox(height: 20),
            TextButton(
                onPressed: () {},
                child: Text('Create',
                    style: Theme.of(context).textTheme.headline5))
          ],
        ),
      ),
    );
  }
}
