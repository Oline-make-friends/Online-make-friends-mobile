import 'package:flutter/material.dart';
import 'package:flutter_making_friends_app_2/screens/meeting/call_screen.dart';
import 'package:get/get.dart';

class MeetingScreen extends StatelessWidget {
  const MeetingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final meetingCodeController = TextEditingController();
    return Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          Get.to(CallScreen(
            callId: meetingCodeController.text,
          ));
        },
        elevation: 0,
        backgroundColor: Theme.of(context).primaryColor,
        label: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30),
          child: Text(
            "Create",
            style: Theme.of(context)
                .textTheme
                .headline6!
                .copyWith(color: Colors.white),
          ),
        ),
      ),
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        leading: IconButton(
            onPressed: () {
              Get.back();
            },
            icon: Icon(
              Icons.arrow_back_rounded,
              color: Theme.of(context).primaryColor,
            )),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Expanded(
              child: Text(
                'Create\nNew Meeting',
                style: Theme.of(context)
                    .textTheme
                    .headline1!
                    .copyWith(fontSize: 40, color: Colors.black54),
              ),
            ),
            Expanded(
              child: TextField(
                controller: meetingCodeController,
                decoration: InputDecoration(
                  focusColor: Theme.of(context).primaryColor,
                  labelText: 'Meeting code',
                  labelStyle: Theme.of(context).textTheme.bodyText1,
                  border: InputBorder.none,
                  enabledBorder: OutlineInputBorder(
                    borderSide:
                        BorderSide(color: Theme.of(context).primaryColor),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide:
                        BorderSide(color: Theme.of(context).primaryColor),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
