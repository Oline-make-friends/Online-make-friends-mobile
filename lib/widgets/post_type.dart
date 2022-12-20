// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controllers/controllers.dart';

class PostTypeDropDown extends StatefulWidget {
  final String type;
  const PostTypeDropDown({
    Key? key,
    required this.type,
  }) : super(key: key);

  @override
  State<PostTypeDropDown> createState() => _PostTypeDropDownState();
}

class _PostTypeDropDownState extends State<PostTypeDropDown> {
  @override
  Widget build(BuildContext context) {
    final postController = Get.put(PostController());

    return InputDecorator(
      decoration: InputDecoration(
        border: InputBorder.none,
        labelText: 'Type',
      ),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        decoration: BoxDecoration(
          color: Colors.white54,
          borderRadius: BorderRadius.circular(15),
          border: Border.all(color: Colors.transparent),
        ),
        child: DropdownButton<dynamic>(
          underline: SizedBox.shrink(),
          isExpanded: true,
          value: widget.type,
          items: const <DropdownMenuItem>[
            DropdownMenuItem(
              child: Text(''),
              value: '',
            ),
            DropdownMenuItem(
              child: Text('Knowledge'),
              value: 'Knowledge',
            ),
            DropdownMenuItem(
              child: Text('Question'),
              value: 'Question',
            ),
            // DropdownMenuItem(
            //   child: Text('Prefer not to say'),
            //   value: 'Prefer not to say',
            // ),
          ],
          onChanged: (newValue) {
            log(newValue);
            setState(() {
              postController.postType.value = newValue.toString();
            });
          },
        ),
      ),
    );
  }
}
