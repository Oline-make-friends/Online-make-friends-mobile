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
      ).timeout(const Duration(seconds: 10));
      // print("${response.statusCode}: ${response.body}");
      return response.body;
    } on TimeoutException catch (e) {
      print(e.toString());
      return e.toString();
    }
  }

  static getAllUser(String endpoint) async {
    var response = await client.get(
      BuildServer.buildUrl(endpoint),
    );
    // print("${response.statusCode}: ${response.body}");
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
    print('${respone.statusCode}: ${respone.body}');
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
    print('add friend post: ${respone.statusCode} : ${respone.body}');
    return respone.body;
  }
}
