// ignore_for_file: public_member_api_docs, sort_constructors_first
// To parse this JSON data, do
//
//     final userModel = userModelFromJson(jsonString);

import 'dart:convert';

import 'package:equatable/equatable.dart';

Friend userModelFromJson(String str) => Friend.fromJson(json.decode(str));

String userModelToJson(Friend data) => json.encode(data.toJson());

class Friend extends Equatable {
  Friend({
    // this.isProve,
    // this.proveImageUrl,
    this.id,
    this.username,
    this.fullname,
    // this.password,
    this.gender,
    this.location,
    this.interrests,
    this.major,
    this.about,
    // this.friends,
    // this.friendsRequest,
    this.avatarUrl,
    this.isAdmin,
    this.isActive,
    DateTime? createdAt,
    DateTime? updatedAt,
    this.v,
    // this.follows,
  })  : this.createdAt = createdAt ?? DateTime.now(),
        this.updatedAt = updatedAt ?? DateTime.now();

  // final bool? isProve;
  // final String? proveImageUrl;
  final String? id;
  final String? username;
  final String? fullname;
  // final String? password;
  final String? gender;
  final String? location;
  final List<String>? interrests;
  final String? major;
  final String? about;
  // final List<String>? friends;
  // final List<dynamic>? friendsRequest;
  final String? avatarUrl;
  final bool? isAdmin;
  final bool? isActive;
  final DateTime createdAt;
  final DateTime updatedAt;
  final int? v;
  // final List<String>? follows;

  factory Friend.fromJson(Map<String, dynamic> json) => Friend(
        // isProve: json["is_prove"] == null ? null : json["is_prove"],
        // proveImageUrl:
        //     json["proveImage_url"] == null ? null : json["proveImage_url"],
        id: json["_id"] == null ? null : json["_id"],
        username: json["username"] == null ? null : json["username"],
        fullname: json["fullname"] == null ? null : json["fullname"],
        // password: json["password"] == null ? null : json["password"],
        gender: json["gender"] == null ? null : json["gender"],
        location: json["location"] == null ? null : json["location"],
        interrests: json["interrests"] == null
            ? null
            : List<String>.from(json["interrests"].map((x) => x)),
        major: json["major"] == null ? null : json["major"],
        about: json["about"] == null ? null : json["about"],
        // friends: json["friends"] == null
        //     ? null
        //     : List<String>.from(json["friends"].map((x) => x)),
        // friendsRequest: json["friends_request"] == null
        //     ? null
        //     : List<dynamic>.from(json["friends_request"].map((x) => x)),
        avatarUrl: json["avatar_url"] == null ? null : json["avatar_url"],
        isAdmin: json["is_admin"] == null ? null : json["is_admin"],
        isActive: json["is_active"] == null ? null : json["is_active"],
        createdAt: json["createdAt"] == null
            ? null
            : DateTime.parse(json["createdAt"]),
        updatedAt: json["updatedAt"] == null
            ? null
            : DateTime.parse(json["updatedAt"]),
        v: json["__v"] == null ? null : json["__v"],
        // follows: json["follows"] == null
        //     ? null
        //     : List<String>.from(json["follows"].map((x) => x)),
      );

  Map<String, dynamic> toJson() => {
        // "is_prove": isProve == null ? null : isProve,
        // "proveImage_url": proveImageUrl == null ? null : proveImageUrl,
        "_id": id == null ? null : id,
        "username": username == null ? null : username,
        "fullname": fullname == null ? null : fullname,
        // "password": password == null ? null : password,
        "gender": gender == null ? null : gender,
        "location": location == null ? null : location,
        "interrests": interrests == null
            ? null
            : List<dynamic>.from(interrests!.map((x) => x)),
        "major": major == null ? null : major,
        "about": about == null ? null : about,
        // "friends":
        //     friends == null ? null : List<dynamic>.from(friends!.map((x) => x)),
        // "friends_request": friendsRequest == null
        //     ? null
        //     : List<dynamic>.from(friendsRequest!.map((x) => x)),
        "avatar_url": avatarUrl == null ? null : avatarUrl,
        "is_admin": isAdmin == null ? null : isAdmin,
        "is_active": isActive == null ? null : isActive,
        "createdAt": createdAt == null ? null : createdAt.toIso8601String(),
        "updatedAt": updatedAt == null ? null : updatedAt.toIso8601String(),
        "__v": v == null ? null : v,
        // "follows":
        //     follows == null ? null : List<dynamic>.from(follows!.map((x) => x)),
      };

  @override
  List<Object?> get props {
    return [
      // isProve,
      // proveImageUrl,
      id,
      username,
      fullname,
      // password,
      gender,
      location,
      interrests,
      major,
      about,
      // friends,
      // friendsRequest,
      avatarUrl,
      isAdmin,
      isActive,
      createdAt,
      updatedAt,
      v,
      // follows,
    ];
  }
}
