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
  final List<String>? admins;
  final String? name;
  final String? content;
  final bool? isDeleted;
  final List<GroupPost>? posts;
  final List<String>? members;
  final List<dynamic>? groupsRequest;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  final int? v;

  factory Group.fromJson(Map<String, dynamic> json) => Group(
        avatarUrl: json["avatar_url"] == null ? null : json["avatar_url"],
        id: json["_id"] == null ? null : json["_id"],
        admins: List<String>.from(json["admins"].map((x) => x)),
        name: json["name"] == null ? null : json["name"],
        content: json["content"] == null ? null : json["content"],
        isDeleted: json["is_deleted"] == null ? null : json["is_deleted"],
        posts: json["posts"] == null
            ? null
            : List<GroupPost>.from(
                json["posts"].map((x) => GroupPost.fromJson(x))),
        members: List<String>.from(json["members"].map((x) => x)),
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
        "admins": List<dynamic>.from(admins!.map((x) => x)),
        "name": name == null ? null : name,
        "content": content == null ? null : content,
        "is_deleted": isDeleted == null ? null : isDeleted,
        "posts": posts == null
            ? null
            : List<dynamic>.from(posts!.map((x) => x.toJson())),
        "members": List<dynamic>.from(members!.map((x) => x)),
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

class GroupPost extends Equatable {
  GroupPost({
    this.id,
    this.createdBy,
    this.content,
    this.imageUrl,
    this.likes,
    this.comments,
    this.isGroup,
    this.isDeleted,
    DateTime? createdAt,
    DateTime? updatedAt,
    this.v,
  })  : this.createdAt = createdAt ?? DateTime.now(),
        this.updatedAt = updatedAt ?? DateTime.now();

  final String? id;
  final UserModel? createdBy;
  final String? content;
  final String? imageUrl;
  final List<String>? likes;
  final List<String>? comments;
  final bool? isGroup;
  final bool? isDeleted;
  final DateTime createdAt;
  final DateTime updatedAt;
  final int? v;

  factory GroupPost.fromJson(Map<String, dynamic> json) => GroupPost(
        id: json["_id"] == null ? null : json["_id"],
        createdBy: json["created_by"] == null
            ? null
            : UserModel.fromJson(json["created_by"]),
        content: json["content"] == null ? null : json["content"],
        imageUrl: json["imageUrl"] == null ? null : json["imageUrl"],
        likes: json["likes"] == null
            ? null
            : List<String>.from(json["likes"].map((x) => x)),
        comments: json["comments"] == null
            ? null
            : List<String>.from(json["comments"].map((x) => x)),
        isGroup: json["is_group"] == null ? null : json["is_group"],
        isDeleted: json["is_deleted"] == null ? null : json["is_deleted"],
        createdAt: json["createdAt"] == null
            ? null
            : DateTime.parse(json["createdAt"]),
        updatedAt: json["updatedAt"] == null
            ? null
            : DateTime.parse(json["updatedAt"]),
        v: json["__v"] == null ? null : json["__v"],
      );

  Map<String, dynamic> toJson() => {
        "_id": id == null ? null : id,
        "created_by": createdBy == null ? null : createdBy!.toJson(),
        "content": content == null ? null : content,
        "imageUrl": imageUrl == null ? null : imageUrl,
        "likes":
            likes == null ? null : List<dynamic>.from(likes!.map((x) => x)),
        "comments": comments == null
            ? null
            : List<dynamic>.from(comments!.map((x) => x)),
        "is_group": isGroup == null ? null : isGroup,
        "is_deleted": isDeleted == null ? null : isDeleted,
        "createdAt": createdAt == null ? null : createdAt.toIso8601String(),
        "updatedAt": updatedAt == null ? null : updatedAt.toIso8601String(),
        "__v": v == null ? null : v,
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
      isGroup,
      isDeleted,
      createdAt,
      updatedAt,
      v,
    ];
  }
}
