// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:equatable/equatable.dart';

import 'package:flutter_making_friends_app_2/models/user_model.dart';

List<Event> eventFromJson(String str) =>
    List<Event>.from(json.decode(str).map((x) => Event.fromJson(x)));

List<Event> eventCreatedFromJson(String str) =>
    List<Event>.from(json.decode(str).map((x) => Event.getCreatedfromJson(x)));

String eventToJson(Event event) => json.encode(event.toJson());

class Event extends Equatable {
  Event({
    this.id,
    this.createdBy,
    this.title,
    this.description,
    this.type,
    this.dateTime,
    this.userJoined,
    DateTime? createdAt,
    DateTime? updatedAt,
    this.v,
  })  : this.createdAt = createdAt ?? DateTime.now(),
        this.updatedAt = updatedAt ?? DateTime.now();

  final String? id;
  final UserModel? createdBy;
  final String? title;
  final String? description;
  final String? type;
  final String? dateTime;
  final List<UserModel>? userJoined;
  final DateTime createdAt;
  final DateTime updatedAt;
  final int? v;

  factory Event.fromJson(Map<String, dynamic> json) => Event(
        id: json["_id"] == null ? null : json["_id"],
        createdBy: json["created_by"] == null
            ? null
            : UserModel.fromJson(json["created_by"]),
        title: json["title"] == null ? null : json["title"],
        description: json["description"] == null ? null : json["description"],
        type: json["type"] == null ? null : json["type"],
        dateTime: json["date_time"] == null ? null : json["date_time"],
        userJoined: json["user_joined"] == null
            ? null
            : List<UserModel>.from(
                json["user_joined"].map((x) => UserModel.fromJson(x))),
        createdAt: json["createdAt"] == null
            ? null
            : DateTime.parse(json["createdAt"]),
        updatedAt: json["updatedAt"] == null
            ? null
            : DateTime.parse(json["updatedAt"]),
        v: json["__v"] == null ? null : json["__v"],
      );

  factory Event.getCreatedfromJson(Map<String, dynamic> json) => Event(
        id: json["_id"] == null ? null : json["_id"],
        title: json["title"] == null ? null : json["title"],
        description: json["description"] == null ? null : json["description"],
        type: json["type"] == null ? null : json["type"],
        dateTime: json["date_time"] == null ? null : json["date_time"],
        createdAt: json["createdAt"] == null
            ? null
            : DateTime.parse(json["createdAt"]),
        updatedAt: json["updatedAt"] == null
            ? null
            : DateTime.parse(json["updatedAt"]),
      );

  Map<String, dynamic> toJson() => {
        "created_by": createdBy == null ? null : createdBy!.toJson(),
        "title": title == null ? null : title,
        "description": description == null ? null : description,
        "type": type == null ? null : type,
        "date_time": dateTime == null ? null : dateTime,
      };

  @override
  List<Object?> get props {
    return [
      id,
      createdBy,
      title,
      description,
      type,
      dateTime,
      userJoined,
      createdAt,
      updatedAt,
      v,
    ];
  }
}
