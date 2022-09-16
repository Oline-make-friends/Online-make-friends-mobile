import 'package:flutter/material.dart';

class CustomTextFormField extends StatelessWidget {
  final String hintTxt;
  void Function(String?)? onSaved;
  String? Function(String?)? validator;
  TextEditingController? controller;

  CustomTextFormField({
    Key? key,
    required this.hintTxt,
    this.onSaved,
    this.validator,
    this.controller,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      onSaved: onSaved,
      validator: validator,
      controller: controller,
      decoration: InputDecoration(
        filled: true,
        fillColor: Colors.white54,
        enabledBorder: const OutlineInputBorder(
          borderSide: BorderSide(
            width: 1,
            color: Color(0xFF116ddd),
          ),
          borderRadius: BorderRadius.all(
            Radius.circular(20),
          ),
        ),
        focusedBorder: const OutlineInputBorder(
          borderSide: BorderSide(
            width: 2,
            color: Color(0xFF116ddd),
          ),
          borderRadius: BorderRadius.all(
            Radius.circular(20),
          ),
        ),
        hintText: hintTxt,
      ),
    );
  }
}
