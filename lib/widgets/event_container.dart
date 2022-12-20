// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class EventContainer extends StatelessWidget {
  final String coverImg;
  final String dateTime;
  DateTime startDate;
  final String category;
  final String eventName;
  void Function()? ontap;

  EventContainer({
    Key? key,
    required this.coverImg,
    required this.dateTime,
    required this.startDate,
    required this.category,
    required this.eventName,
    this.ontap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final String day = dateTime.substring(8, 10);
    final String month = dateTime.substring(4, 7);
    print("$day - $month");
    final String monthFormat = DateFormat('MMM').format(startDate);
    // print(monthFormat);
    return InkWell(
      onTap: ontap,
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 10),
        height: 300,
        width: double.infinity,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(30),
          image:
              DecorationImage(image: NetworkImage(coverImg), fit: BoxFit.cover),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              //! dateTime
              Align(
                alignment: Alignment.topRight,
                child: Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: Container(
                    height: 60,
                    width: 50,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          day,
                          style: Theme.of(context).textTheme.headline5,
                        ),
                        Text(
                          month,
                          style: Theme.of(context).textTheme.bodyText1,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Column(
                children: [
                  Text(
                    eventName,
                    style: Theme.of(context)
                        .textTheme
                        .headline4!
                        .copyWith(color: Colors.white),
                  ),
                  const SizedBox(height: 10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Text(
                        category,
                        style: Theme.of(context)
                            .textTheme
                            .bodyText1!
                            .copyWith(color: Colors.white),
                      ),
                      Text(
                        '${startDate.hour}:${startDate.minute}',
                        style: Theme.of(context)
                            .textTheme
                            .bodyText1!
                            .copyWith(color: Colors.white),
                      ),
                    ],
                  ),
                  const SizedBox(height: 10),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
