// ignore_for_file: public_member_api_docs, sort_constructors_first
// To parse this JSON data, do
//
//     final post = postFromJson(jsonString);

import 'dart:convert';

import 'package:equatable/equatable.dart';

import 'package:flutter_making_friends_app_2/models/user_model.dart';

List<Post> postFromJson(String str) =>
    List<Post>.from(json.decode(str).map((x) => Post.fromJson(x)));

String postToJson(List<Post> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Post extends Equatable {
  
  Post({
    required this.id,
    required this.createdBy,
    required this.content,
    required this.imageUrl,
    required this.likes,
    required this.comments,
    this.isDeleted = false,
    DateTime? createdAt,
    DateTime? updatedAt,
    this.v = 0,
  })  : this.createdAt = createdAt ?? DateTime.now(),
        this.updatedAt = updatedAt ?? DateTime.now();

  final String id;
  final User createdBy;
  final String content;
  final String imageUrl;
  final List<dynamic> likes;
  final List<dynamic> comments;
  final bool isDeleted;
  final DateTime createdAt;
  final DateTime updatedAt;
  final int v;

  factory Post.fromJson(Map<String, dynamic> json) => Post(
        id: json["_id"],
        createdBy: User.fromJson(json["created_by"]),
        content: json["content"],
        imageUrl: json["imageUrl"],
        likes: List<dynamic>.from(json["likes"].map((x) => x)),
        comments: List<dynamic>.from(json["comments"].map((x) => x)),
        isDeleted: json["is_deleted"],
        createdAt: DateTime.parse(json["createdAt"]),
        updatedAt: DateTime.parse(json["updatedAt"]),
        v: json["__v"],
      );

  Map<String, dynamic> toJson() => {
        "_id": id,
        "created_by": createdBy.toJson(),
        "content": content,
        "imageUrl": imageUrl,
        "likes": List<dynamic>.from(likes.map((x) => x)),
        "comments": List<dynamic>.from(comments.map((x) => x)),
        "is_deleted": isDeleted,
        "createdAt": createdAt.toIso8601String(),
        "updatedAt": updatedAt.toIso8601String(),
        "__v": v,
      };

  @override
  List<Object> get props {
    return [
      id,
      createdBy,
      content,
      imageUrl,
      likes,
      comments,
      isDeleted,
      createdAt,
      updatedAt,
      v,
    ];
  }

  @override
  bool get stringify => true;
}
