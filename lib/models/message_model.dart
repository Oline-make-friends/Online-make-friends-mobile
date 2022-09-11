// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:equatable/equatable.dart';
import 'package:intl/intl.dart';

class Message extends Equatable {
  final int id;
  final int senderId;
  final int receiverId;
  final String message;
  final DateTime dateTime;
  final String timeString;

  const Message({
    required this.id,
    required this.senderId,
    required this.receiverId,
    required this.message,
    required this.dateTime,
    required this.timeString,
  });

  @override
  List<Object> get props {
    return [
      id,
      senderId,
      receiverId,
      message,
      dateTime,
      timeString,
    ];
  }

  static List<Message> messages = [
    Message(
      id: 1,
      senderId: 1,
      receiverId: 2,
      message: "How's your day ?",
      dateTime: DateTime.now(),
      timeString: DateFormat('jm').format(DateTime.now()),
    ),
    Message(
      id: 2,
      senderId: 2,
      receiverId: 1,
      message: "It's good",
      dateTime: DateTime.now(),
      timeString: DateFormat('jm').format(DateTime.now()),
    ),
    Message(
      id: 3,
      senderId: 1,
      receiverId: 3,
      message: "How's your day ?",
      dateTime: DateTime.now(),
      timeString: DateFormat('jm').format(DateTime.now()),
    ),
    Message(
      id: 4,
      senderId: 3,
      receiverId: 1,
      message: "It's good",
      dateTime: DateTime.now(),
      timeString: DateFormat('jm').format(DateTime.now()),
    ),
    Message(
      id: 5,
      senderId: 1,
      receiverId: 4,
      message: "How's your day ?",
      dateTime: DateTime.now(),
      timeString: DateFormat('jm').format(DateTime.now()),
    ),
    Message(
      id: 6,
      senderId: 4,
      receiverId: 1,
      message: "It's good",
      dateTime: DateTime.now(),
      timeString: DateFormat('jm').format(DateTime.now()),
    ),
    Message(
      id: 7,
      senderId: 1,
      receiverId: 5,
      message: "How's your day ?",
      dateTime: DateTime.now(),
      timeString: DateFormat('jm').format(DateTime.now()),
    ),
    Message(
      id: 8,
      senderId: 5,
      receiverId: 1,
      message: "It's good",
      dateTime: DateTime.now(),
      timeString: DateFormat('jm').format(DateTime.now()),
    ),
    Message(
      id: 9,
      senderId: 1,
      receiverId: 2,
      message: "Have any free time ?",
      dateTime: DateTime.now(),
      timeString: DateFormat('jm').format(DateTime.now()),
    ),
  ];
}
