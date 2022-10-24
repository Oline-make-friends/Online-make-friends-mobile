// ignore_for_file: public_member_api_docs, sort_constructors_first
// To parse this JSON data, do
//
//     final comment = commentFromJson(jsonString);

import 'dart:convert';

import 'package:equatable/equatable.dart';

Comment commentFromJson(String str) => Comment.fromJson(json.decode(str));

String commentToJson(Comment data) => json.encode(data.toJson());

class Comment extends Equatable {
  Comment({
    this.id,
    this.userId,
    this.content,
    this.isDeleted,
    DateTime? createdAt,
    DateTime? updatedAt,
    this.v = 0,
    this.postId,
  })  : this.createdAt = createdAt ?? DateTime.now(),
        this.updatedAt = updatedAt ?? DateTime.now();

  final String? id;
  final String? userId;
  final String? content;
  final bool? isDeleted;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  final int? v;
  final String? postId;

  factory Comment.fromJson(Map<String, dynamic> json) => Comment(
        id: json["_id"],
        userId: json["user_id"] ?? "",
        content: json["content"],
        isDeleted: json["is_deleted"],
        createdAt: DateTime.parse(json["createdAt"]),
        updatedAt: DateTime.parse(json["updatedAt"]),
        v: json["__v"],
        postId: json["post_id"],
      );

  Map<String, dynamic> toJson() => {
        "_id": id,
        "user_id": userId,
        "content": content,
        "is_deleted": isDeleted,
        "createdAt": createdAt!.toIso8601String(),
        "updatedAt": updatedAt!.toIso8601String(),
        "__v": v,
        "post_id": postId,
      };

  @override
  List<Object?> get props {
    return [
      id,
      userId,
      content,
      isDeleted,
      createdAt,
      updatedAt,
      v,
      postId,
    ];
  }
}
