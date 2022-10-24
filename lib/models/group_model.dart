// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:equatable/equatable.dart';

import 'models.dart';

List<Group> groupFromJson(String str) =>
    List<Group>.from(json.decode(str).map((x) => Group.fromJson(x)));

String groupToJson(List<Group> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Group extends Equatable {
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
    this.v,
  })  : this.createdAt = createdAt ?? DateTime.now(),
        this.updatedAt = updatedAt ?? DateTime.now();

  final String? avatarUrl;
  final String? id;
  final List<User>? admins;
  final String? name;
  final String? content;
  final bool? isDeleted;
  final List<User>? posts;
  final List<User>? members;
  final List<dynamic>? groupsRequest;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  final int? v;

  factory Group.fromJson(Map<String, dynamic> json) => Group(
        avatarUrl: json["avatar_url"] == null ? null : json["avatar_url"],
        id: json["_id"] == null ? null : json["_id"],
        admins: json["admins"] == null
            ? null
            : List<User>.from(json["admins"].map((x) => User.fromJson(x))),
        name: json["name"] == null ? null : json["name"],
        content: json["content"] == null ? null : json["content"],
        isDeleted: json["is_deleted"] == null ? null : json["is_deleted"],
        posts: json["posts"] == null
            ? null
            : List<User>.from(json["posts"].map((x) => x)),
        members: json["members"] == null
            ? null
            : List<User>.from(json["members"].map((x) => User.fromJson(x))),
        groupsRequest: json["groups_request"] == null
            ? null
            : List<dynamic>.from(json["groups_request"].map((x) => x)),
        createdAt: json["createdAt"] == null
            ? null
            : DateTime.parse(json["createdAt"]),
        updatedAt: json["updatedAt"] == null
            ? null
            : DateTime.parse(json["updatedAt"]),
        v: json["__v"] == null ? null : json["__v"],
      );

  Map<String, dynamic> toJson() => {
        "avatar_url": avatarUrl == null ? null : avatarUrl,
        "_id": id == null ? null : id,
        "admins": admins == null
            ? null
            : List<User>.from(admins!.map((x) => x.toJson())),
        "name": name == null ? null : name,
        "content": content == null ? null : content,
        "is_deleted": isDeleted == null ? null : isDeleted,
        "posts": posts == null ? null : List<User>.from(posts!.map((x) => x)),
        "members": members == null
            ? null
            : List<User>.from(members!.map((x) => x.toJson())),
        "groups_request": groupsRequest == null
            ? null
            : List<dynamic>.from(groupsRequest!.map((x) => x)),
        "createdAt": createdAt == null ? null : createdAt!.toIso8601String(),
        "updatedAt": updatedAt == null ? null : updatedAt!.toIso8601String(),
        "__v": v == null ? null : v,
      };

  @override
  List<Object?> get props {
    return [
      avatarUrl,
      id,
      admins,
      name,
      content,
      isDeleted,
      posts,
      members,
      groupsRequest,
      createdAt,
      updatedAt,
      v,
    ];
  }
}
