import 'package:flutter/material.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
import 'package:flutter_making_friends_app_2/controllers/controllers.dart';
import 'package:flutter_making_friends_app_2/widgets/custom_text_form_field.dart';
import 'package:flutter_making_friends_app_2/widgets/widgets.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class CreateEventScreen extends StatelessWidget {
  const CreateEventScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final eventController = Get.put(EventController());
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
              controller: eventController.titleController,
              labelText: 'Title',
            ),
            const SizedBox(height: 10),
            CustomTextFormField(
              controller: eventController.typeController,
              labelText: 'Type',
            ),
            const SizedBox(height: 10),
            CustomTextFormField(
              controller: eventController.descController,
              labelText: 'Description',
            ),
            const SizedBox(height: 10),
            Obx(
              () {
                return SizedBox(
                  width: double.infinity,
                  child: CustomTextFormField(
                    enable: false,
                    controller: TextEditingController(
                      text:
                          "${eventController.startDateController.value.day}-${eventController.startDateController.value.month}-${eventController.startDateController.value.year}",
                    ),
                    labelText: 'Start date',
                    suffixIcon: IconButton(
                        onPressed: () {
                          DatePicker.showDatePicker(
                            context,
                            showTitleActions: true,
                            minTime: DateTime.now(),
                            maxTime: DateTime(2100, 1, 1),
                            currentTime: DateTime.now(),
                            onChanged: (date) {
                              print(
                                  'change ${DateFormat.E().format(date)} ${DateFormat.d().format(date)} ${DateFormat.MMM().format(date)} ');
                            },
                            onConfirm: (date) {
                              eventController.startDateController.value = date;
                              eventController.dateTime =
                                  "${DateFormat.E().format(date)} ${DateFormat.MMM().format(date)} ${DateFormat.d().format(date)}";
                              print(eventController.dateTime);
                            },
                          );
                        },
                        icon: const Icon(Icons.date_range)),
                  ),
                );
              },
            ),
            const SizedBox(height: 20),
            TextButton(
                onPressed: () async {
                  Alert.showLoadingIndicatorDialog(context);
                  await eventController.createEvent();
                  await eventController.fetchEvent();
                  Get.back();
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
