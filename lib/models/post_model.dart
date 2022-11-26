// ignore_for_file: public_member_api_docs, sort_constructors_first
// To parse this JSON data, do
//
//     final post = postFromJson(jsonString);

import 'dart:convert';

import 'package:equatable/equatable.dart';
import 'package:flutter_making_friends_app_2/models/models.dart';

import 'package:flutter_making_friends_app_2/models/user_model.dart';

List<Post> postFromJson(String str) =>
    List<Post>.from(json.decode(str).map((x) => Post.fromJson(x)));

String postToJson(Post data) => json.encode(data.toJson());

class Post extends Equatable {
  Post({
    this.id,
    required this.createdBy,
    this.type,
    this.hashtag,
    this.content,
    this.imageUrl,
    this.likes,
    this.comments,
    this.isDeleted = false,
    DateTime? createdAt,
    DateTime? updatedAt,
    this.v = 0,
  })  : this.createdAt = createdAt ?? DateTime.now(),
        this.updatedAt = updatedAt ?? DateTime.now();

  final String? id;
  final UserModel createdBy;
  final String? type;
  final String? hashtag;
  final String? content;
  final String? imageUrl;
  final List<dynamic>? likes;
  final List<Comment>? comments;
  final bool isDeleted;
  final DateTime createdAt;
  final DateTime updatedAt;
  final int v;

  factory Post.fromJson(Map<String, dynamic> json) => Post(
        id: json["_id"],
        createdBy: UserModel.fromJson(json["created_by"]),
        type: json["type"],
        hashtag: json["hashtag"],
        content: json["content"],
        imageUrl: json["imageUrl"],
        likes: List<dynamic>.from(json["likes"].map((x) => x)),
        comments: List<Comment>.from(
            json["comments"].map((x) => Comment.fromJson(x))),
        isDeleted: json["is_deleted"],
        createdAt: DateTime.parse(json["createdAt"]),
        updatedAt: DateTime.parse(json["updatedAt"]),
        v: json["__v"],
      );

  Map<String, dynamic> toJson() => {
        "created_by": createdBy.toJson(),
        "content": content,
        "imageUrl": imageUrl,
      };

  @override
  List<Object?> get props {
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
