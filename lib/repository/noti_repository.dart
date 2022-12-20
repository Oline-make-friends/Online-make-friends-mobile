import 'dart:convert';

import 'package:flutter_making_friends_app_2/models/friendRequest_model.dart';
import 'package:flutter_making_friends_app_2/repository/repository.dart';
import 'package:http/http.dart' as http;

import '../models/models.dart';

class NotiRepository {
  static final client = http.Client();

  static getAllNoti(String endpoint) async {
    var response = await client.get(
      BuildServer.buildUrl(endpoint),
    );
    // print("${response.statusCode}: ${response.body}");
    if (response.statusCode == 200) {
      var resultString = response.body;
      return notificationFromJson(resultString);
    } else {
      return null;
    }
  }

  static getUserFriendRequest(String endpoint, String receiverId) async {
    var respone = await client.post(
      BuildServer.buildUrl(endpoint),
      body: jsonEncode(<String, String>{
        "receiver_id": receiverId,
      }),
      headers: {"Content-type": "application/json"},
    );
    // print(respone.body);
    return friendRequestFromJson(respone.body);
  }

  static addNoti(String endpoint, var body) async {
    var response = await client.post(
      BuildServer.buildUrl(endpoint),
      body: body,
      headers: {"Content-type": "application/json"},
    );
    if (response.statusCode == 200) {
      return true;
    } else {
      return false;
    }
  }

  static getUserNoti(String endpoint, String userId) async {
    var respone = await client.post(
      BuildServer.buildUrl(endpoint),
      body: jsonEncode(<String, String>{
        "user_id": userId,
      }),
      headers: {"Content-type": "application/json"},
    );
    // print(respone.body);
    return notificationFromJson(respone.body);
  }
}
