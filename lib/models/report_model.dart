// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:equatable/equatable.dart';

import 'package:flutter_making_friends_app_2/models/models.dart';

List<Report> reportFromJson(String str) =>
    List<Report>.from(json.decode(str).map((x) => Report.fromJson(x)));

String reportToJson(List<Report> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Report extends Equatable {
  Report({
    this.id,
    this.sentBy,
    this.content,
    this.isDeleted,
    this.status,
    DateTime? createdAt,
    DateTime? updatedAt,
    this.v,
  })  : this.createdAt = createdAt ?? DateTime.now(),
        this.updatedAt = updatedAt ?? DateTime.now();

  final String? id;
  final UserModel? sentBy;
  final String? content;
  final bool? isDeleted;
  final bool? status;
  final DateTime createdAt;
  final DateTime updatedAt;
  final int? v;

  factory Report.fromJson(Map<String, dynamic> json) => Report(
        id: json["_id"] == null ? null : json["_id"],
        sentBy: json["sent_by"] == null
            ? null
            : UserModel.fromJson(json["sent_by"]),
        content: json["content"] == null ? null : json["content"],
        isDeleted: json["is_deleted"] == null ? null : json["is_deleted"],
        status: json["status"] == null ? null : json["status"],
        createdAt: json["createdAt"] == null
            ? null
            : DateTime.parse(json["createdAt"]),
        updatedAt: json["updatedAt"] == null
            ? null
            : DateTime.parse(json["updatedAt"]),
        v: json["__v"] == null ? null : json["__v"],
      );

  Map<String, dynamic> toJson() => {
        "sent_by": sentBy == null ? null : sentBy!.toJson(),
        "content": content == null ? null : content,
      };

  @override
  List<Object?> get props {
    return [
      id,
      sentBy,
      content,
      isDeleted,
      status,
      createdAt,
      updatedAt,
      v,
    ];
  }

  @override
  bool get stringify => true;
}
