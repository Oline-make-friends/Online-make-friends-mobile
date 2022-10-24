import 'dart:convert';

import 'package:flutter_making_friends_app_2/models/post_model.dart';
import 'package:flutter_making_friends_app_2/models/user_model.dart';

List<Group> groupFromJson(String str) =>
    List<Group>.from(json.decode(str).map((x) => Group.fromJson(x)));

String groupToJson(List<Group> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Group {
  Group({
    this.avatarUrl,
    this.id,
    this.admins,
    this.name,
    this.content,
    this.isDeleted,
    this.posts,
    this.members,
    this.groupsRequest,
    DateTime? createdAt,
    DateTime? updatedAt,
    this.v = 0,
  })  : this.createdAt = createdAt ?? DateTime.now(),
        this.updatedAt = updatedAt ?? DateTime.now();

  final String? avatarUrl;
  final String? id;
  final List<User>? admins;
  final String? name;
  final String? content;
  final bool? isDeleted;
  final List<Post>? posts;
  final List<User>? members;
  final List<dynamic>? groupsRequest;
  final DateTime createdAt;
  final DateTime updatedAt;
  final int v;

  factory Group.fromJson(Map<String, dynamic> json) => Group(
        avatarUrl: json["avatar_url"],
        id: json["_id"],
        admins: List<User>.from(json["admins"].map((x) => User.fromJson(x))),
        name: json["name"],
        content: json["content"],
        isDeleted: json["is_deleted"],
        posts: List<Post>.from(json["posts"].map((x) => x)),
        members: List<User>.from(json["members"].map((x) => User.fromJson(x))),
        groupsRequest: json["groups_request"] == null
            ? null
            : List<dynamic>.from(json["groups_request"].map((x) => x)),
        createdAt: DateTime.parse(json["createdAt"]),
        updatedAt: DateTime.parse(json["updatedAt"]),
        v: json["__v"],
      );

  Map<String, dynamic> toJson() => {
        "avatar_url": avatarUrl,
        "_id": id,
        "admins": List<User>.from(admins!.map((x) => x.toJson())),
        "name": name,
        "content": content,
        "is_deleted": isDeleted,
        "posts": List<Post>.from(posts!.map((x) => x)),
        "members": List<User>.from(members!.map((x) => x.toJson())),
        "groups_request": groupsRequest == null
            ? null
            : List<dynamic>.from(groupsRequest!.map((x) => x)),
        "createdAt": createdAt.toIso8601String(),
        "updatedAt": updatedAt.toIso8601String(),
        "__v": v,
      };
}
