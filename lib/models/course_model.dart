// To parse this JSON data, do
//
//     final course = courseFromJson(jsonString);

import 'dart:convert';

import 'models.dart';

List<Course> courseFromJson(String str) =>
    List<Course>.from(json.decode(str).map((x) => Course.fromJson(x)));

String courseToJson(List<Course> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Course {
  Course({
    this.id,
    this.createdBy,
    this.description,
    this.name,
    this.quizs,
    DateTime? createdAt,
    DateTime? updatedAt,
    this.v,
  })  : this.createdAt = createdAt ?? DateTime.now(),
        this.updatedAt = updatedAt ?? DateTime.now();

  final String? id;
  final User? createdBy;
  final String? description;
  final String? name;
  final List<Quiz>? quizs;
  final DateTime createdAt;
  final DateTime updatedAt;
  final int? v;

  factory Course.fromJson(Map<String, dynamic> json) => Course(
        id: json["_id"] == null ? null : json["_id"],
        createdBy: json["created_by"] == null
            ? null
            : User.fromJson(json["created_by"]),
        description: json["description"] == null ? null : json["description"],
        name: json["name"] == null ? null : json["name"],
        quizs: json["quizs"] == null
            ? null
            : List<Quiz>.from(json["quizs"].map((x) => Quiz.fromJson(x))),
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
        "description": description == null ? null : description,
        "name": name == null ? null : name,
        "quizs": quizs == null
            ? null
            : List<dynamic>.from(quizs!.map((x) => x.toJson())),
        "createdAt": createdAt == null ? null : createdAt.toIso8601String(),
        "updatedAt": updatedAt == null ? null : updatedAt.toIso8601String(),
        "__v": v == null ? null : v,
      };
}
