// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:equatable/equatable.dart';

import 'package:flutter_making_friends_app_2/models/user_model.dart';

List<Notification> notiFromJson(String str) => List<Notification>.from(
    json.decode(str).map((x) => Notification.fromJson(x)));

String notiToJson(List<Notification> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Notification extends Equatable {
  final int id;
  final User user;
  final String content;
  final DateTime createdTime;

  Notification({
    DateTime? createdTime,
    required this.id,
    required this.user,
    required this.content,
  }) : this.createdTime = createdTime ?? DateTime.now();

  @override
  List<Object> get props => [id, user, content, createdTime];

  Notification copyWith({
    int? id,
    User? user,
    String? content,
    DateTime? createdTime,
  }) {
    return Notification(
      id: id ?? this.id,
      user: user ?? this.user,
      content: content ?? this.content,
      createdTime: createdTime ?? this.createdTime,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'user': user.toJson(),
      'content': content,
      'createdTime': createdTime.millisecondsSinceEpoch,
    };
  }

  factory Notification.fromMap(Map<String, dynamic> map) {
    return Notification(
      id: map['id'] as int,
      user: User.fromJson(map['user'] as Map<String, dynamic>),
      content: map['content'] as String,
      createdTime:
          DateTime.fromMillisecondsSinceEpoch(map['createdTime'] as int),
    );
  }

  String toJson() => json.encode(toMap());

  factory Notification.fromJson(String source) =>
      Notification.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  bool get stringify => true;
}
