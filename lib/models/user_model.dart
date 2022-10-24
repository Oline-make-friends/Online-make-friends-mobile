// ignore_for_file: public_member_api_docs, sort_constructors_first
// To parse this JSON data, do
//
//     final user = userFromJson(jsonString);

import 'dart:convert';

import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

List<User> userFromJson(String str) =>
    List<User>.from(json.decode(str).map((x) => User.fromJson(x)));

String userToJson(List<User> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

String registerToJson(User data) {
  return json.encode(data.registerToJson());
}

String updateToJson(User data) {
  return json.encode(data.updateToJson());
}

class User extends Equatable {
  User({
    this.id,
    this.username,
    this.fullname,
    this.password,
    this.gender,
    this.location,
    this.interests,
    this.major,
    this.about,
    this.follows,
    this.friends,
    this.dateOfBirth,
    this.friendsRequest,
    this.avatarUrl,
    this.isAdmin = false,
    this.isActive = false,
    DateTime? createdAt,
    DateTime? updatedAt,
    this.v = 0,
  })  : this.createdAt = createdAt ?? DateTime.now(),
        this.updatedAt = updatedAt ?? DateTime.now();

  final String? id;
  final String? username;
  final String? fullname;
  final String? password;
  final String? gender;
  final String? location;
  final List<String>? interests;
  final String? major;
  final String? about;
  final List<dynamic>? follows;
  final List<dynamic>? friends;
  final String? dateOfBirth;
  final List<dynamic>? friendsRequest;
  final String? avatarUrl;
  final bool isAdmin;
  final bool isActive;
  final DateTime createdAt;
  final DateTime updatedAt;
  final int? v;

  factory User.fromJson(Map<String, dynamic> json) => User(
        id: json["_id"],
        username: json["username"],
        fullname: json["fullname"],
        password: json["password"],
        gender: json["gender"],
        location: json["location"],
        interests: List<String>.from(json["interrests"].map((x) => x)),
        major: json["major"],
        about: json["about"],
        follows: List<dynamic>.from(json["follows"].map((x) => x)),
        friends: List<dynamic>.from(json["friends"].map((x) => x)),
        dateOfBirth: json["date_of_birth"],
        friendsRequest:
            List<dynamic>.from(json["friends_request"].map((x) => x)),
        avatarUrl: json["avatar_url"],
        isAdmin: json["is_admin"],
        isActive: json["is_active"],
        createdAt: DateTime.parse(json["createdAt"]),
        updatedAt: DateTime.parse(json["updatedAt"]),
        v: json["__v"],
      );

  Map<String, dynamic> toJson() => {
        "_id": id,
        "username": username,
        "fullname": fullname,
        "password": password,
        "gender": gender,
        "location": location,
        "interrests": List<dynamic>.from(interests!.map((x) => x)),
        "major": major,
        "about": about,
        "follos": List<dynamic>.from(follows!.map((x) => x)),
        "friends": List<dynamic>.from(friends!.map((x) => x)),
        "date_of_birth": dateOfBirth,
        "friends_request": List<dynamic>.from(friendsRequest!.map((x) => x)),
        "avatar_url": avatarUrl,
        "is_admin": isAdmin,
        "is_active": isActive,
        "createdAt": createdAt.toIso8601String(),
        "updatedAt": updatedAt.toIso8601String(),
        "__v": v,
      };

  Map<String, dynamic> registerToJson() => {
        "username": username,
        "fullname": fullname,
        "password": password,
        "gender": gender,
        "date_of_birth": dateOfBirth,
      };

  Map<String, dynamic> updateToJson() => {
        "fullname": fullname,
        "gender": gender,
        "location": location,
        "interrests": List<dynamic>.from(interests!.map((x) => x)),
        "major": major,
        "about": about,
        "date_of_birth": dateOfBirth,
        "avatar_url": avatarUrl,
      };

  @override
  List<Object?> get props {
    return [
      id,
      username,
      fullname,
      password,
      gender,
      location,
      interests,
      major,
      about,
      follows,
      friends,
      dateOfBirth,
      friendsRequest,
      avatarUrl,
      isAdmin,
      isActive,
      createdAt,
      updatedAt,
      v,
    ];
  }

  @override
  String toString() {
    return "id: ${id}, fullname: ${fullname}, gender: {$gender}, location: ${location}, interests: ${interests}, major: ${major}, about: ${about}, friends: ${friends}, DOB: ${dateOfBirth}, ";
  }

  static List<User> users = [
    User(
      id: "1",
      fullname: "Beluga",
      gender: "Male",
      location: "USA",
      interests: ["Game"],
      major: "Sussy Cat",
      about: "Ka-hoot destroyer, Roblux hacker, skittle-chan lover, Mods hater",
      friends: [],
      dateOfBirth: "15/4/2002",
      friendsRequest: [],
      avatarUrl:
          'https://static.wikia.nocookie.net/beluga/images/9/99/Beluga_d.png/revision/latest?cb=20211229190719',
    ),
    User(
      id: "2",
      fullname: "Hecker",
      gender: "Male",
      location: "USA",
      interests: ["Hecking"],
      major: "Freelancer",
      about:
          "Initially a hacker who originally threatens Beluga, he later gradually becomes one of the latter's best friends once Skittle disappears, as the videos go.",
      friends: [],
      dateOfBirth: "22/7/2002",
      friendsRequest: [],
      avatarUrl:
          'https://yt3.ggpht.com/arWtsAqaTamuoTbdT2z-QXL121Qbv80wbsOE_1ty6I98JV3ocpKmfZ3A-UcyAVKiqikznFpc=s900-c-k-c0x00ffffff-no-rj',
    ),
    User(
      id: "3",
      fullname: "Skittle",
      gender: "Male",
      location: "USA",
      interests: ["Game"],
      major: "SE",
      about:
          "Beluga's best friend after encountering Lester. Later in the videos, Beluga was suffering from memory loss due to Lester's meddling, however, Hecker used his hacking skills to restore his memories along with skittles,[7] skittle has since made a return.",
      friends: [],
      dateOfBirth: "15/4/2002",
      friendsRequest: [],
      avatarUrl:
          'https://static.wikia.nocookie.net/beluga/images/f/f6/Skittle.jpg/revision/latest?cb=20210730213705',
    ),
    User(
      id: "4",
      fullname: "Scemmer",
      gender: "Male",
      location: "USA",
      interests: ["Scemming"],
      major: "SE",
      about: "A scemming cat",
      friends: [],
      dateOfBirth: "15/4/2002",
      friendsRequest: [],
      avatarUrl:
          'https://static.wikia.nocookie.net/beluga/images/b/b1/ScemerPic.png/revision/latest?cb=20211225164758',
    ),
    User(
      id: "5",
      fullname: "Eugnene",
      gender: "Male",
      location: "USA",
      interests: ["Banning"],
      major: "SE",
      about: "Literally an egg \u{1f95a}",
      friends: [],
      dateOfBirth: "15/4/2002",
      friendsRequest: [],
      avatarUrl:
          'https://static.wikia.nocookie.net/beluga/images/2/2d/Eugene.png/revision/latest/top-crop/width/360/height/450?cb=20210904195805',
    ),
  ];
}
