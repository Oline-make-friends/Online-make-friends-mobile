import 'dart:async';
import 'dart:convert';

import 'package:flutter_making_friends_app_2/models/user_model.dart';
import 'package:flutter_making_friends_app_2/repository/repository.dart';
import 'package:http/http.dart' as http;

class UserRepository {
  static final client = http.Client();

  static Future<String> postLogin(var body, String endpoint) async {
    try {
      var response = await client.post(
        BuildServer.buildUrl(endpoint),
        body: body,
        headers: {"Content-type": "application/json"},
      ).timeout(const Duration(seconds: 30));
      return response.body;
    } on TimeoutException catch (e) {
      return e.toString();
    }
  }

  static loginByGmail(String endpoint) async {
    var respone = await client.post(
      BuildServer.buildUrl(endpoint),
      headers: {"Content-type": "application/json"},
    );
    return respone.body;
  }

  static getAllUser(String endpoint) async {
    var response = await client.get(
      BuildServer.buildUrl(endpoint),
    );
    if (response.statusCode == 200) {
      var resultString = response.body;
      return userFromJson(resultString);
    } else {
      return null;
    }
  }

  static registerUser(String endpoint, var body) async {
    var respone = await client.post(
      BuildServer.buildUrl(endpoint),
      body: body,
      headers: {"Content-type": "application/json"},
    );
    return respone.body;
  }

  static addFriend(String endpoint, String userId, String friendId) async {
    var respone = await client.post(
      BuildServer.buildUrl(endpoint),
      body: jsonEncode(<String, String>{
        "id": userId,
        "friend": friendId,
      }),
      headers: {"Content-type": "application/json"},
    );
    return respone.body;
  }

  static updateProfile(String endpoint, var body) async {
    var respone = await client.post(
      BuildServer.buildUrl(endpoint),
      body: body,
      headers: {"Content-type": "application/json"},
    );
    return respone.body;
  }

  static updatePassword(String endpoint, String newPassword) async {
    var respone = await client.post(
      BuildServer.buildUrl(endpoint),
      body: jsonEncode(<String, String>{
        "password": newPassword,
      }),
      headers: {"Content-type": "application/json"},
    );
    return respone.body;
  }

  static getUserById(String endpoint) async {
    var respone = await client.post(
      BuildServer.buildUrl(endpoint),
      headers: {"Content-type": "application/json"},
    );
    return respone.body;
  }

  static sendFriendRequest(
      String endpoint, String senderId, String receiverId) async {
    var respone = await client.post(
      BuildServer.buildUrl(endpoint),
      body: jsonEncode(<String, String>{
        "sender_id": senderId,
        "receiver_id": receiverId,
      }),
      headers: {"Content-type": "application/json"},
    );
    return respone.body;
  }

  static deleletFriendRequest(String endpoint) async {
    var respone = await client.delete(
      BuildServer.buildUrl(endpoint),
      headers: {"Content-type": "application/json"},
    );
    return respone.body;
  }

  static sendEmailResetPassword(String endpoint) async {
    var respone = await client.post(
      BuildServer.buildUrl(endpoint),
      headers: {"Content-type": "application/json"},
    );
    return respone.body;
  }

  static followUser(
    String endpoint,
    String userId,
    String followerId,
  ) async {
    var respone = await client.post(
      BuildServer.buildUrl(endpoint),
      body: jsonEncode(<String, String>{
        "currentUser_id": userId,
        "follower_id": followerId,
      }),
      headers: {"Content-type": "application/json"},
    );
    return respone.body;
  }
}
