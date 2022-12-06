// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:equatable/equatable.dart';

import 'package:flutter_making_friends_app_2/models/models.dart';

List<FriendRequest> friendRequestFromJson(String str) =>
    List<FriendRequest>.from(
        json.decode(str).map((x) => FriendRequest.fromJson(x)));

String friendRequestToJson(List<FriendRequest> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class FriendRequest extends Equatable {
  FriendRequest({
    this.id,
    this.senderId,
    this.receiverId,
    this.status,
    DateTime? createdAt,
    DateTime? updatedAt,
    this.v,
  })  : this.createdAt = createdAt ?? DateTime.now(),
        this.updatedAt = updatedAt ?? DateTime.now();

  final String? id;
  final Friend? senderId;
  final String? receiverId;
  final bool? status;
  final DateTime createdAt;
  final DateTime updatedAt;
  final int? v;

  factory FriendRequest.fromJson(Map<String, dynamic> json) => FriendRequest(
        id: json["_id"] == null ? null : json["_id"],
        senderId: json["sender_id"] == null
            ? null
            : Friend.fromJson(json["sender_id"]),
        receiverId: json["receiver_id"] == null ? null : json["receiver_id"],
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
        "_id": id == null ? null : id,
        "sender_id": senderId == null ? null : senderId!.toJson(),
        "receiver_id": receiverId == null ? null : receiverId,
        "status": status == null ? null : status,
        "createdAt": createdAt == null ? null : createdAt.toIso8601String(),
        "updatedAt": updatedAt == null ? null : updatedAt.toIso8601String(),
        "__v": v == null ? null : v,
      };

  @override
  List<Object?> get props {
    return [
      id,
      senderId,
      receiverId,
      status,
      createdAt,
      updatedAt,
      v,
    ];
  }

  @override
  bool get stringify => true;
}
