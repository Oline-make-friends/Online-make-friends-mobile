// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_making_friends_app_2/screens/report/create_report_screen.dart';
import 'package:get/get.dart';

import 'package:flutter_making_friends_app_2/controllers/report_controller.dart';
import 'package:intl/intl.dart';

class ReportScreen extends StatelessWidget {
  const ReportScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final reportController = Get.put(ReportController());
    return Scaffold(
        appBar: AppBar(
          title: Text(
            'Report',
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
          actions: [
            IconButton(
              onPressed: () {
                Get.to(CreateReportScreen());
              },
              icon: Icon(Icons.add, color: Theme.of(context).primaryColor),
            )
          ],
        ),
        body: Obx(
          () {
            if (reportController.isLoading.value) {
              return Center(
                child: CircularProgressIndicator(),
              );
            } else {
              return Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Text(
                          'ID',
                          style: Theme.of(context)
                              .textTheme
                              .bodyText1!
                              .copyWith(fontWeight: FontWeight.bold),
                        ),
                        Text(
                          'Content',
                          style: Theme.of(context)
                              .textTheme
                              .bodyText1!
                              .copyWith(fontWeight: FontWeight.bold),
                        ),
                        Text(
                          'Status',
                          style: Theme.of(context)
                              .textTheme
                              .bodyText1!
                              .copyWith(fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                    const SizedBox(height: 10),
                    ListView.builder(
                      shrinkWrap: true,
                      itemCount: reportController.listReport.length,
                      itemBuilder: (context, index) {
                        return ReportRow(
                          createdAt:
                              reportController.listReport[index].createdAt,
                          content: reportController.listReport[index].content!,
                          status: reportController.listReport[index].status!,
                        );
                      },
                    ),
                  ],
                ),
              );
            }
          },
        ));
  }
}

class ReportRow extends StatelessWidget {
  final DateTime createdAt;
  final String content;
  final bool status;
  const ReportRow({
    Key? key,
    required this.createdAt,
    required this.content,
    required this.status,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          // crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
                "${createdAt.day}/${DateFormat.m().format(createdAt)}/${createdAt.year}"),
            const SizedBox(width: 30),
            SizedBox(
              width: 160,
              child: Text(
                content,
                style: Theme.of(context).textTheme.bodyText1,
              ),
            ),
            // const SizedBox(
            //   width: 30,
            // ),
            Container(
              height: 20,
              width: 20,
              decoration: BoxDecoration(
                color: status == true ? Colors.green : Colors.yellow,
                borderRadius: BorderRadius.circular(30),
              ),
            ),
            const SizedBox(
              width: 70,
            ),
          ],
        ),
        const SizedBox(height: 5),
        const Divider(thickness: 2),
        const SizedBox(height: 5),
      ],
    );
  }
}
