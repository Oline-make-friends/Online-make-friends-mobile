import 'package:flutter/material.dart';

class CustomTextFormField extends StatelessWidget {
  final String hintTxt;

  const CustomTextFormField({
    Key? key,
    required this.hintTxt,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
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
        // border: OutlineInputBorder(
        //   borderRadius:
        //       const BorderRadius.all(
        //     Radius.circular(20),
        //   ),
        //   borderSide: BorderSide(
        //     color: Theme.of(context)
        //         .backgroundColor,
        //   ),
        // ),
      ),
    );
  }
}
