import 'package:flutter/material.dart';
import 'package:flutter_datetime_picker_plus/flutter_datetime_picker_plus.dart';

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
        enable: false,
        labelText: 'Date of birth',
        controller: controller,
        suffixIcon: IconButton(
            onPressed: () {
              DatePicker.showDatePicker(
                context,
                showTitleActions: true,
                minTime: DateTime(1940, 1, 1),
                maxTime: DateTime.now(),
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
