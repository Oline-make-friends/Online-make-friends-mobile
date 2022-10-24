import 'package:flutter/material.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';

import 'widgets.dart';

class CustomDoBPicker extends StatelessWidget {
  final TextEditingController controller;
  dynamic Function(DateTime)? onConfirm;
  CustomDoBPicker({
    Key? key,
    required this.controller,
    this.onConfirm,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 170,
      child: CustomTextFormField(
        hintTxt: 'Date of birth',
        controller: controller,
        suffixIcon: IconButton(
            onPressed: () {
              DatePicker.showDatePicker(
                context,
                showTitleActions: true,
                minTime: DateTime(1940, 1, 1),
                maxTime: DateTime(2015, 12, 31),
                currentTime: DateTime(2000, 1, 1),
                onChanged: (date) {
                  print('change $date');
                },
                onConfirm: onConfirm,
              );
            },
            icon: const Icon(Icons.date_range)),
      ),
    );
  }
}
