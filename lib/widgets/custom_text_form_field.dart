// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

class CustomTextFormField extends StatelessWidget {
  String? hintTxt;
  String? labelText;
  void Function(String?)? onSaved;
  String? Function(String?)? validator;
  TextEditingController? controller;
  Widget? suffixIcon;
  Widget? prefixicon;

  bool isObscure;

  CustomTextFormField({
    Key? key,
    this.hintTxt,
    this.labelText,
    this.onSaved,
    this.validator,
    this.controller,
    this.suffixIcon,
    this.prefixicon,
    this.isObscure = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      obscureText: isObscure,
      onSaved: onSaved,
      validator: validator,
      controller: controller,
      decoration: InputDecoration(
        prefixIcon: prefixicon,
        filled: true,
        fillColor: Colors.white54,
        enabledBorder: const OutlineInputBorder(
          borderSide: BorderSide(
            width: 1,
            color: Colors.transparent,
          ),
          borderRadius: BorderRadius.all(
            Radius.circular(15),
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(
            width: 2,
            color: Theme.of(context).primaryColor.withAlpha(90),
          ),
          borderRadius: const BorderRadius.all(
            Radius.circular(15),
          ),
        ),
        errorBorder: const OutlineInputBorder(
          borderSide: BorderSide(
            width: 2,
            color: Color.fromARGB(255, 221, 24, 17),
          ),
          borderRadius: BorderRadius.all(
            Radius.circular(15),
          ),
        ),
        focusedErrorBorder: const OutlineInputBorder(
          borderSide: BorderSide(
            width: 2,
            color: Color.fromARGB(255, 221, 24, 17),
          ),
          borderRadius: BorderRadius.all(
            Radius.circular(15),
          ),
        ),
        suffixIcon: suffixIcon,
        hintText: hintTxt,
        labelText: labelText,
      ),
    );
  }
}
