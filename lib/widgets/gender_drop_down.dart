import 'package:flutter/material.dart';

class CustomGenderDropDown extends StatelessWidget {
  final dynamic value;
  void Function(dynamic)? onChanged;
  CustomGenderDropDown({
    Key? key,
    required this.value,
    this.onChanged,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      decoration: BoxDecoration(
          color: Colors.white54,
          borderRadius: BorderRadius.circular(15),
          border: Border.all(color: Colors.transparent)),
      child: DropdownButton<dynamic>(
        underline: SizedBox.shrink(),
        isExpanded: true,
        value: value,
        items: const <DropdownMenuItem>[
          DropdownMenuItem(
            child: Text('Male'),
            value: 'Male',
          ),
          DropdownMenuItem(
            child: Text('Female'),
            value: 'Female',
          ),
          DropdownMenuItem(
            child: Text('Prefer not to say'),
            value: 'Prefer not to say',
          ),
        ],
        onChanged: onChanged,
      ),
    );
  }
}
