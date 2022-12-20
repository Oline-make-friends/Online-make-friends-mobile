// ignore_for_file: public_member_api_docs, sort_constructors_first
// To parse this JSON data, do
//
//     final notification = notificationFromJson(jsonString);

import 'dart:convert';

import 'package:equatable/equatable.dart';

List<Notification> notificationFromJson(String str) => List<Notification>.from(
    json.decode(str).map((x) => Notification.fromJson(x)));

String notificationToJson(Notification data) => json.encode(data.toJson());

class Notification extends Equatable {
  Notification({
    this.id,
    this.userId,
    this.title,
    this.content,
    DateTime? createdAt,
    DateTime? updatedAt,
    this.v,
  })  : this.createdAt = createdAt ?? DateTime.now(),
        this.updatedAt = updatedAt ?? DateTime.now();

  final String? id;
  final String? userId;
  final String? title;
  final String? content;
  final DateTime createdAt;
  final DateTime updatedAt;
  final int? v;

  factory Notification.fromJson(Map<String, dynamic> json) => Notification(
        id: json["_id"],
        userId: json["user_id"],
        title: json["title"],
        content: json["content"],
      );

  Map<String, dynamic> toJson() => {
        "user_id": userId,
        "title": title,
        "content": content,
      };

  @override
  List<Object?> get props {
    return [
      id,
      userId,
      title,
      content,
      createdAt,
      updatedAt,
      v,
    ];
  }

  @override
  bool get stringify => true;
}
