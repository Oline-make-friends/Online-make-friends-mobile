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
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Text(
          'Gender: ',
          style: Theme.of(context)
              .textTheme
              .headline6!
              .copyWith(fontWeight: FontWeight.normal),
        ),
        const SizedBox(width: 10),
        DropdownButton<dynamic>(
          borderRadius: BorderRadius.all(Radius.circular(12)),
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
          ],
          onChanged: onChanged,
        ),
      ],
    );
  }
}
